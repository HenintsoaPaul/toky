import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/prompt_variant.dart';
import '../../../../data/services/prompt_generator_service.dart';

final promptProvider = NotifierProvider<PromptNotifier, List<PromptVariant>>(PromptNotifier.new);

class PromptNotifier extends Notifier<List<PromptVariant>> {
  late final PromptGeneratorService _service;

  @override
  List<PromptVariant> build() {
    _service = PromptGeneratorService();
    return [];
  }

  void generatePrompts(String question) {
    if (question.trim().isEmpty) {
      state = [];
      return;
    }
    // In a real app, this might be async.
    state = _service.generatePrompts(question);
  }
  
  void updatePrompt(int index, String newContent) {
    final prompts = [...state];
    if (index >= 0 && index < prompts.length) {
      prompts[index] = prompts[index].copyWith(content: newContent);
      state = prompts;
    }
  }
}
