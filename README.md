# KAIC Research Skills

Agent Skill package for occupational therapy and health-science research
workflows, designed for use with Codex and Claude Code.

`kaic-research-skills` provides reusable guidance and editable templates for
research tasks such as:

- data preparation and derived-variable planning
- R and SPSS statistical workflows
- PROCESS macro, propensity score matching, and complex survey analysis support
- statistical result interpretation
- Korean manuscript reporting support
- pool-first reference verification (PubMed → Crossref → Semantic Scholar, DOI-confirmed only)
- APA citation and reference list generation with verified DOIs

## Repository Structure

- `SKILL.md` - main skill rules, routing, and working defaults
- `references/` - focused guidance for research workflows
- `scripts/` - editable R analysis templates
- `agents/` - agent metadata

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

Install or link this repository under the Codex skills directory, then use it
for occupational therapy or health-science research tasks that require analysis
planning, statistical workflow support, result interpretation, or
manuscript-facing reporting guidance.

Example location: `~/.codex/skills/kaic-research-skills/`

### Claude Code

Install or clone this repository under the Claude Code personal skills
directory.

Example location: `~/.claude/skills/kaic-research-skills/`

Claude Code should be able to find the main skill file at:

`~/.claude/skills/kaic-research-skills/SKILL.md`

The main behavior and routing rules are defined in `SKILL.md`.

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

## Status

Reference verification added (pool-first, three-tier).

---

## 한국어 안내

`KAIC Research Skills`는 작업치료 및 보건의료 연구 작업을 지원하기 위한
Agent Skill 패키지입니다.

이 저장소의 `kaic-research-skills`는 Codex와 Claude Code에서 활용할 수
있도록 구성되어 있으며, 반복적으로 사용할 수 있는 연구 지침과 분석
템플릿을 제공합니다.

주로 다음과 같은 작업을 지원합니다.

- 자료 정리 및 파생변수 설계
- R 및 SPSS 기반 통계 분석 흐름
- PROCESS macro, 성향점수매칭, 복합표본분석 관련 지원
- 통계 결과 해석
- 한국어 논문 보고 및 문장 작성 지원
- 3단계 참고문헌 검증 (PubMed → Crossref → Semantic Scholar, DOI 확인 필수)
- 검증된 문헌만 사용한 APA 인용 및 레퍼런스 목록 생성

## 저장소 구성

- `SKILL.md` - 스킬의 핵심 규칙, 작업 분기, 기본 원칙
- `references/` - 연구 작업별 세부 지침
- `scripts/` - 수정하여 사용할 수 있는 R 분석 템플릿
- `agents/` - 에이전트 메타데이터

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

Codex 스킬 디렉터리에 이 저장소를 설치하거나 연결한 뒤, 작업치료 및
보건의료 연구와 관련된 분석 계획, 통계 작업 흐름, 결과 해석, 논문 보고
지원이 필요할 때 사용합니다.

예시 경로: `~/.codex/skills/kaic-research-skills/`

### Claude Code

Claude Code 개인 스킬 디렉터리에 이 저장소를 설치하거나 clone하여
사용합니다.

예시 경로: `~/.claude/skills/kaic-research-skills/`

Claude Code에서 핵심 스킬 파일은 다음 위치에 있어야 합니다.

`~/.claude/skills/kaic-research-skills/SKILL.md`

스킬의 핵심 동작 방식과 작업 분기 규칙은 `SKILL.md`에 정의되어 있습니다.

## 참고문헌 검증

서론·고찰 작성 시, 본문을 쓰기 전에 검증된 문헌 풀을 먼저 구축합니다.

1. **PubMed MCP** — 보건/의학/작업치료 분야 1차 탐색
2. **Crossref API** — 전 분야 DOI 검증 (API 키 불필요)
3. **Semantic Scholar** — 보완 탐색 (API 키 불필요)

DOI가 확인되고 제목·저자·연도 메타데이터가 완전한 문헌만 풀에 등록됩니다.
작성 전 확보된 문헌 수를 보고하며, 문헌을 임의로 생성하거나 추측하지 않습니다.
사용자가 직접 제공한 문헌도 동일한 파이프라인으로 검증합니다.

## 상태

참고문헌 검증 기능 추가 (풀 우선 방식, 3단계 검증).
