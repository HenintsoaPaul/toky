import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/prompt_provider.dart';
import '../widgets/prompt_card.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompts = ref.watch(promptProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enhanced Prompts',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: prompts.isEmpty
          ? Center(
              child: Text(
                'No prompts generated.',
                style: GoogleFonts.inter(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: prompts.length,
              itemBuilder: (context, index) {
                final prompt = prompts[index];
                return PromptCard(
                  title: prompt.title,
                  description: prompt.description,
                  content: prompt.content,
                  onCopy: () {
                    Clipboard.setData(ClipboardData(text: prompt.content));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Prompt copied to clipboard!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  onContentChanged: (newContent) {
                    ref
                        .read(promptProvider.notifier)
                        .updatePrompt(index, newContent);
                  },
                );
              },
            ),
    );
  }
}
