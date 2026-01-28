import 'package:flutter_test/flutter_test.dart';
import 'package:toky/data/services/prompt_generator_service.dart';

void main() {
  group('PromptGeneratorService', () {
    final service = PromptGeneratorService();

    test('returns empty list for empty input', () {
      expect(service.generatePrompts(''), isEmpty);
      expect(service.generatePrompts('   '), isEmpty);
    });

    test('generates 4 variants for valid input', () {
      final prompts = service.generatePrompts('How do LLMs work?');
      expect(prompts.length, 4);
    });

    test('variants contain the input question', () {
      final question = 'What is recursion?';
      final prompts = service.generatePrompts(question);

      for (final prompt in prompts) {
        expect(prompt.content.contains(question), isTrue);
      }
    });

    test('variants have titles and descriptions', () {
      final prompts = service.generatePrompts('Test');
      for (final prompt in prompts) {
        expect(prompt.title.isNotEmpty, isTrue);
        expect(prompt.description.isNotEmpty, isTrue);
      }
    });
  });
}
