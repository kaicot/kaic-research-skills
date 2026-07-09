# KAIC Research Skills

Agent Skill package for occupational therapy and health-science research
workflows, designed for use with Codex and Claude Code.

Current version: `v0.1.1`

Version source of truth: Git tags and GitHub Releases on `main`.

`kaic-research-skills` provides reusable guidance and editable templates for
research tasks such as:

- data preparation and derived-variable planning
- R and SPSS statistical workflows
- PROCESS macro, propensity score matching, and complex survey analysis support
- KCHS / 지역사회건강조사 routing through the private `kaic-chs-analysis` skill
- statistical result interpretation
- APA-formatted Word table generation from SPSS / R / PROCESS output (`.docx`, `flextable` + `officer`)
- Korean manuscript reporting support
- pool-first reference verification (PubMed → Crossref → Semantic Scholar, DOI-confirmed only)
- APA citation and reference list generation with verified DOIs

## Repository Structure

- `SKILL.md` — main skill rules, mode routing, and working defaults
- `references/` — focused guidance per mode (statistical analysis, manuscript writing, APA table formatting, etc.)
- `scripts/` — editable R templates (analysis, PSM, survey, APA Word tables)
- `agents/` — agent metadata

## Scope and Data Safety

This repository is intended for reusable research-support instructions and
analysis templates.

Do not store the following materials in this repository:

- raw or restricted research data
- identifiable participant information
- unpublished manuscript-sensitive project files
- credentials, tokens, or private study documents

## Usage

This skill package is managed as a filesystem-based Agent Skill and is intended
for use with Codex and Claude Code.

### Codex

Install or link this repository under the Codex skills directory. Prefer a git
checkout so version checks and updates work:

```bash
git clone https://github.com/kaicot/kaic-research-skills.git ~/.codex/skills/kaic-research-skills
```

Then use it for occupational therapy or health-science research tasks that
require analysis planning, statistical workflow support, result interpretation,
or manuscript-facing reporting guidance.

### Claude Code

Install or clone this repository under the Claude Code personal skills
directory.

Example location: `~/.claude/skills/kaic-research-skills/`

Claude Code should be able to find the main skill file at:

`~/.claude/skills/kaic-research-skills/SKILL.md`

The main behavior and routing rules are defined in `SKILL.md`.

## For Agents

Use this order when installing, updating, or invoking the skill:

1. Install or update the folder as a git checkout when possible; copied folders
   cannot report their version.
2. Check the installed version with `git describe --tags --always`.
3. Read `SKILL.md` before acting on research-analysis, interpretation, table,
   or manuscript requests.
4. Use the mode routing table in `SKILL.md` to choose the minimum required
   reference file.
5. Load only the focused references needed for the active mode.
6. For KCHS / 지역사회건강조사 work, confirm the private companion skill
   `kaic-chs-analysis` is installed and use it as the source of truth for
   KCHS design variables, missing codes, scoring, SPSS complex-samples syntax,
   and PROCESS limitations.
7. If KCHS work is requested and `kaic-chs-analysis` is missing, install it
   from its private GitHub repository with credentials before proceeding.
8. Validate with `quick_validate.py` before tagging or publishing a release.

Safety rules for agents:

- Do not store raw or restricted data, identifiable participant information,
  unpublished manuscripts, credentials, or private study documents here.
- Do not duplicate private KCHS implementation detail from `kaic-chs-analysis`
  into this public repository.
- Do not replace verified-reference rules with unverified citation guesses.

## KCHS Integration

For Korea Community Health Survey (KCHS, 지역사회건강조사) work, this skill acts
as the research workflow layer and delegates KCHS-specific design, missing-code,
scoring, SPSS complex-samples, and PROCESS limitations to the private
`kaic-chs-analysis` skill.

## Reference Verification

When writing Introduction or Discussion sections, the skill automatically builds
a verified reference pool before writing any prose:

1. **PubMed MCP** — primary source for health/medical/OT literature
2. **Crossref API** — all-discipline DOI verification (no API key required)
3. **Semantic Scholar** — supplemental coverage (no API key required)

Only references with a confirmed DOI and complete metadata (title, authors, year)
are added to the pool. The skill reports pool size before writing and never
fabricates or guesses references. User-supplied references go through the same
pipeline before use.

## APA Table Mode

Paste SPSS, R, or PROCESS output and ask for an APA-formatted table — the skill
generates a complete, ready-to-run R script that produces a `.docx` file:

- Supported table types: descriptive statistics, t-test, one-way ANOVA,
  correlation matrix, regression (simple / hierarchical), mediation (PROCESS)
- APA 7th edition formatting: bold table number, italic title, horizontal borders
  only, centered column headings, left-aligned stub column
- Three note types: general (`Note.`), specific (superscript letters), probability
  (`*p < .05`)
- Requires R packages: `flextable`, `officer`

See `references/apa-table-formatting.md` and `scripts/apa_table_template.R`.

## Versioning and Updates

Check the installed version if this repo is installed as a git checkout:

```bash
git -C ~/.codex/skills/kaic-research-skills describe --tags --always
```

Update a git-based install:

```bash
git -C ~/.codex/skills/kaic-research-skills pull --ff-only
```

If the skill was installed as a plain copied folder, replace or reinstall the
folder; a copied install cannot report its version.

Release rule:

- Patch: wording, documentation, templates, or checklist-level changes.
- Minor: new mode, reference, script, or cross-skill routing.
- Major: renamed files, removed modes, or behavior that can break existing prompts.

Release checklist:

```bash
PYTHONUTF8=1 python ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py ~/.codex/skills/kaic-research-skills
git tag -a vX.Y.Z -m "vX.Y.Z"
git push origin main --follow-tags
```

## Release History

| Version | Date | Summary |
|---|---:|---|
| `v0.1.1` | 2026-07-09 | Added agent-facing install/use guidance, release history, and refreshed agent metadata. |
| `v0.1.0` | 2026-07-09 | Initial versioned baseline with reference verification, APA table mode, and KCHS routing to `kaic-chs-analysis`. |

---

## 한국어 안내

`KAIC Research Skills`는 작업치료 및 보건의료 연구 작업을 지원하기 위한
Agent Skill 패키지입니다.

이 저장소의 `kaic-research-skills`는 Codex와 Claude Code에서 활용할 수
있도록 구성되어 있으며, 반복적으로 사용할 수 있는 연구 지침과 분석
템플릿을 제공합니다.

현재 버전: `v0.1.1`

버전 기준: `main` 브랜치의 Git tag와 GitHub Release

주로 다음과 같은 작업을 지원합니다.

- 자료 정리 및 파생변수 설계
- R 및 SPSS 기반 통계 분석 흐름
- PROCESS macro, 성향점수매칭, 복합표본분석 관련 지원
- 비공개 `kaic-chs-analysis` 스킬과 연동한 KCHS / 지역사회건강조사 라우팅
- 통계 결과 해석
- SPSS / R / PROCESS 출력 → APA 양식 Word 표 자동 생성 (`.docx`, `flextable` + `officer`)
- 한국어 논문 보고 및 문장 작성 지원
- 3단계 참고문헌 검증 (PubMed → Crossref → Semantic Scholar, DOI 확인 필수)
- 검증된 문헌만 사용한 APA 인용 및 레퍼런스 목록 생성

## 저장소 구성

- `SKILL.md` — 스킬의 핵심 규칙, 모드 분기, 기본 원칙
- `references/` — 모드별 세부 지침 (통계 분석, 논문 작성, APA 표 포맷 등)
- `scripts/` — 수정하여 사용할 수 있는 R 분석 템플릿 (분석, 성향점수, 복합표본, APA Word 표)
- `agents/` — 에이전트 메타데이터

## 범위와 자료 관리

이 저장소는 재사용 가능한 연구 지원 지침과 분석 템플릿을 관리하기 위한
저장소입니다.

다음 자료는 이 저장소에 저장하지 않습니다.

- 원자료 또는 접근이 제한된 연구자료
- 연구참여자를 식별할 수 있는 정보
- 공개 전 원고 등 민감한 연구 산출물
- 계정 정보, 인증 토큰, 비공개 연구 문서

## 사용

이 스킬 패키지는 파일시스템 기반 Agent Skill로 관리되며, Codex와 Claude
Code에서 사용할 수 있도록 구성되어 있습니다.

### Codex

Codex 스킬 디렉터리에 이 저장소를 설치하거나 연결합니다. 버전 확인과
업데이트가 가능하도록 git checkout 설치를 우선합니다.

```bash
git clone https://github.com/kaicot/kaic-research-skills.git ~/.codex/skills/kaic-research-skills
```

작업치료 및 보건의료 연구와 관련된 분석 계획, 통계 작업 흐름, 결과 해석,
논문 보고 지원이 필요할 때 사용합니다.

### Claude Code

Claude Code 개인 스킬 디렉터리에 이 저장소를 설치하거나 clone하여
사용합니다.

예시 경로: `~/.claude/skills/kaic-research-skills/`

Claude Code에서 핵심 스킬 파일은 다음 위치에 있어야 합니다.

`~/.claude/skills/kaic-research-skills/SKILL.md`

스킬의 핵심 동작 방식과 작업 분기 규칙은 `SKILL.md`에 정의되어 있습니다.

## Agent 사용 순서

1. 가능하면 git checkout으로 설치하거나 업데이트합니다. 단순 복사 설치는
   버전 확인이 불가능합니다.
2. `git describe --tags --always`로 설치 버전을 확인합니다.
3. 연구분석, 해석, 표, 논문 작성 요청은 먼저 `SKILL.md`를 읽습니다.
4. `SKILL.md`의 mode routing 표에 따라 필요한 reference 파일만 읽습니다.
5. KCHS / 지역사회건강조사 작업은 비공개 companion skill인
   `kaic-chs-analysis`가 설치되어 있는지 확인하고, KCHS 설계변수, 결측,
   점수화, SPSS 복합표본 syntax, PROCESS 제한은 그 스킬을 기준으로 합니다.
6. KCHS 작업인데 `kaic-chs-analysis`가 없다면 비공개 GitHub 저장소 접근
   권한을 확인한 뒤 먼저 설치합니다.
7. tag나 release를 만들기 전 `quick_validate.py`로 검증합니다.

Agent 안전 규칙:

- 원자료, 제한 연구자료, 식별 가능 정보, 공개 전 원고, 인증정보, 비공개
  연구 문서를 저장하지 않습니다.
- public 저장소인 이 repo에 `kaic-chs-analysis`의 private 세부 구현을
  중복 복사하지 않습니다.
- 검증되지 않은 참고문헌을 임의로 만들지 않습니다.

## KCHS 연동

KCHS / 지역사회건강조사 작업에서는 이 스킬이 연구 흐름, 해석, 논문 보고를
담당하고, KCHS 고유의 설계변수, 결측 코드, 점수화, SPSS 복합표본 syntax,
PROCESS 제한은 비공개 `kaic-chs-analysis` 스킬에 위임합니다.

## 참고문헌 검증

서론·고찰 작성 시, 본문을 쓰기 전에 검증된 문헌 풀을 먼저 구축합니다.

1. **PubMed MCP** — 보건/의학/작업치료 분야 1차 탐색
2. **Crossref API** — 전 분야 DOI 검증 (API 키 불필요)
3. **Semantic Scholar** — 보완 탐색 (API 키 불필요)

DOI가 확인되고 제목·저자·연도 메타데이터가 완전한 문헌만 풀에 등록됩니다.
작성 전 확보된 문헌 수를 보고하며, 문헌을 임의로 생성하거나 추측하지 않습니다.
사용자가 직접 제공한 문헌도 동일한 파이프라인으로 검증합니다.

## APA 표 모드

SPSS, R, PROCESS 출력 결과를 붙여넣고 "APA 표로 만들어줘"라고 하면,
스킬이 완성된 R 스크립트를 생성하고 실행 시 `.docx` 파일이 저장됩니다.

- 지원 표 유형: 기술통계, t-검정, 일원분산분석, 상관행렬, 회귀분석(단순/위계), 매개분석(PROCESS)
- APA 7판 형식: 굵은 표 번호, 이탤릭 제목, 가로선만 사용, 헤딩 가운데 정렬, stub 열 왼쪽 정렬
- 주석 3종: 일반 주석(`Note.`), 개별 주석(위첨자 알파벳), 유의확률 주석(`*p < .05`)
- 필요 R 패키지: `flextable`, `officer`

`references/apa-table-formatting.md` 및 `scripts/apa_table_template.R` 참조.

## 버전관리와 업데이트

버전 기준은 `main` 브랜치의 Git tag입니다.

git checkout으로 설치된 경우:

```bash
git -C ~/.codex/skills/kaic-research-skills describe --tags --always
git -C ~/.codex/skills/kaic-research-skills pull --ff-only
```

단순 복사로 설치된 경우에는 버전 확인이 불가능하므로 폴더를 교체하거나 다시
설치합니다.

## 릴리스 이력

| 버전 | 날짜 | 요약 |
|---|---:|---|
| `v0.1.1` | 2026-07-09 | Agent 설치/사용 지침, 릴리스 이력, agent metadata 정리. |
| `v0.1.0` | 2026-07-09 | 참고문헌 검증, APA table mode, `kaic-chs-analysis` 연동을 포함한 최초 버전 기준. |
