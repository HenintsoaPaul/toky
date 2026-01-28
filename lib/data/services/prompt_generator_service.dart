import '../models/prompt_variant.dart';

class PromptGeneratorService {
  List<PromptVariant> generatePrompts(String question) {
    if (question.trim().isEmpty) {
      return [];
    }

    final sanitizedQuestion = question.trim();

    return [
      _createBeginnerPrompt(sanitizedQuestion),
      _createTechnicalPrompt(sanitizedQuestion),
      _createAnalogyPrompt(sanitizedQuestion),
      _createStepByStepPrompt(sanitizedQuestion),
    ];
  }

  PromptVariant _createBeginnerPrompt(String question) {
    return PromptVariant(
      title: 'ELI5 (Explain Like I\'m 5)',
      description: 'Simple, jargon-free explanation.',
      content: '''
Explain "$question" in simple terms as if I were a 12-year-old.
- Avoid technical jargon.
- Use simple sentences.
- Focus on the "why" and "what".
'''
          .trim(),
    );
  }

  PromptVariant _createTechnicalPrompt(String question) {
    return PromptVariant(
      title: 'Technical Deep Dive',
      description: 'Detailed technical breakdown with examples.',
      content: '''
Provide a technical deep dive on "$question".
- Explain the underlying architecture or mechanics.
- Include code examples if applicable.
- Discuss trade-offs, performance implications, or best practices.
- Use professional terminology.
'''
          .trim(),
    );
  }

  PromptVariant _createAnalogyPrompt(String question) {
    return PromptVariant(
      title: 'Mental Model / Analogy',
      description: 'Understanding concepts through comparisons.',
      content: '''
Explain "$question" using a real-world analogy.
- Map the technical concepts to familiar everyday objects or scenarios.
- Highlight where the analogy holds and where it breaks down.
'''
          .trim(),
    );
  }

  PromptVariant _createStepByStepPrompt(String question) {
    return PromptVariant(
      title: 'Step-by-Step Breakdown',
      description: 'Logical sequence of events or actions.',
      content: '''
Break down "$question" into a step-by-step process.
- Number each step clearly.
- Explain what happens at each stage.
- If it's a process, describe the flow from start to finish.
'''
          .trim(),
    );
  }
}
