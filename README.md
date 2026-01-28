# Toky

Toky is a Flutter-based learning assistant focused on **helping users ask better questions to Large Language Models (LLMs)**.

Instead of directly answering questions, Toky transforms a user’s raw question into multiple **high-quality, learning-optimized prompts**.  
The goal is to empower self-taught learners to get clearer, deeper, and more structured answers from AI tools.

Toky positions itself as a **prompt engineering companion for learning**, not as a general-purpose AI chatbot.

---

## Problem Statement

Many learners struggle to get useful answers from LLMs because:
- their questions are too vague
- they lack structure or constraints
- they don’t know how to guide the AI toward a learning-oriented response

Toky solves this by:
- taking a simple human question
- generating multiple improved prompt variants
- encouraging users to customize prompts to fit their learning style

---

## MVP Goals

The MVP focuses on **clarity, simplicity, and learning impact**.

### Primary Goal
Enable users to transform **one raw question** into **3–4 high-quality learning prompts**.

### MVP Principles
- No user accounts
- No chat system
- No long-term memory
- No social or collaborative features
- Toky does **not** answer questions directly

Toky’s only responsibility in the MVP is **prompt enhancement**.

---

## Core MVP Features

### 1. Question Input
- A single text input where the user types a question they want to understand.
- Example questions:
  - “How do phone calls work?”
  - “What is an API?”
  - “Why does my code crash?”

---

### 2. Prompt Generation
Toky generates **3 to 4 enhanced prompt variants** from the user’s question.

Each prompt focuses on a different learning angle, such as:
- Beginner-friendly explanation
- Step-by-step breakdown
- Technical deep dive
- Analogy or mental model
- Teaching or Q&A style

Toky does **not** generate answers — only prompts.

---

### 3. Prompt Customization
Each generated prompt:
- Is editable by the user
- Can be refined using simple modifiers such as:
  - “Simpler”
  - “More technical”
  - “Add examples”
  - “Go deeper”
  - “Shorter explanation”

These refinements rewrite the prompt, not the answer.

---

### 4. Copy & Use
- Each prompt has a copy action
- The user pastes the prompt into their preferred LLM (ChatGPT, Claude, etc.)

Toky remains tool-agnostic.

---

## Non-Goals (Explicitly Out of Scope for MVP)

The following features must NOT be implemented in the MVP:
- User authentication
- Chat history or conversations
- Prompt ratings or likes
- AI-generated answers
- File uploads
- Voice input
- Plugins or extensions

---

## Target Users

- Self-taught learners
- Students
- Junior developers
- Curious professionals
- Anyone who wants better answers from AI

---

## Technical Scope (MVP)

- Flutter application
- Simple UI with minimal screens:
  - Question input screen
  - Prompt results screen
- Stateless or minimal local state
- LLM integration can be:
  - Rule-based templates (acceptable for MVP)
  - OR a lightweight LLM call for prompt enhancement

The architecture should favor **readability over performance**.

---

## Roadmap

### Phase 1 – MVP (Current)
- Single-question input
- 3–4 enhanced prompt variants
- Editable prompts
- Copy-to-clipboard functionality

---

### Phase 2 – Learning Modes
- Predefined learning modes:
  - Beginner
  - Technical
  - Interview preparation
  - Exam revision
  - Debugging assistance

---

### Phase 3 – Personalization
- Save preferred prompt styles
- Learning preferences (examples-heavy, concise, deep)
- Prompt templates per user goal

---

### Phase 4 – Prompt Intelligence
- Explain why a prompt is effective
- Highlight improvements compared to the original question
- Teach prompt engineering implicitly

---

### Phase 5 – AI-Native Learning
- Run prompts internally
- Compare “bad prompt” vs “good prompt” answers
- Become an AI literacy and learning tool

---

## Vision

Toky aims to teach people **how to think with AI**, not just how to use it.

The long-term vision is to make prompt literacy a core learning skill.

## License

Toky is **source-available** and licensed under the **Polyform Shield License**.

You are free to:
- View the source code
- Learn from it
- Modify it for personal or non-commercial use

You may NOT:
- Use this project for commercial purposes
- Offer it as a hosted or SaaS service
- Sell or rebrand derivative works

For commercial usage or partnerships, please contact the project owner.

© All rights reserved.
