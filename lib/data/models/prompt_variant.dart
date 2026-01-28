class PromptVariant {
  final String title;
  final String content;
  final String description;

  const PromptVariant({
    required this.title,
    required this.content,
    required this.description,
  });

  PromptVariant copyWith({
    String? title,
    String? content,
    String? description,
  }) {
    return PromptVariant(
      title: title ?? this.title,
      content: content ?? this.content,
      description: description ?? this.description,
    );
  }
}
