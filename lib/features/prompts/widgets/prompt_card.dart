import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromptCard extends StatefulWidget {
  final String title;
  final String description;
  final String content;
  final VoidCallback onCopy;
  final ValueChanged<String> onContentChanged;

  const PromptCard({
    super.key,
    required this.title,
    required this.description,
    required this.content,
    required this.onCopy,
    required this.onContentChanged,
  });

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content);
  }

  @override
  void didUpdateWidget(covariant PromptCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.content != widget.content) {
      if (_controller.text != widget.content) {
        _controller.text = widget.content;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: widget.onCopy,
                  icon: const Icon(Icons.copy_rounded, size: 20),
                  tooltip: 'Copy to clipboard',
                  color: Colors.deepPurple,
                ),
              ],
            ),
            const Divider(height: 24),
            TextField(
              controller: _controller,
              maxLines: null,
              onChanged: widget.onContentChanged,
              style: GoogleFonts.jetBrainsMono(fontSize: 13, height: 1.5),
              decoration: const InputDecoration(
                hintText: 'Prompt content...',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ModifierChip(
                  label: 'Simpler',
                  onTap: () => _appendInstruction('Explain this simply.'),
                ),
                _ModifierChip(
                  label: 'Technical',
                  onTap: () => _appendInstruction('Include technical details.'),
                ),
                _ModifierChip(
                  label: 'Examples',
                  onTap: () => _appendInstruction('Provide examples.'),
                ),
                _ModifierChip(
                  label: 'Shorter',
                  onTap: () => _appendInstruction('Keep it concise.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _appendInstruction(String instruction) {
    setState(() {
      final current = _controller.text.trim();
      if (!current.endsWith(instruction)) {
        final newContent = '$current\n- $instruction';
        _controller.text = newContent;
        widget.onContentChanged(newContent);
      }
    });
  }
}

class _ModifierChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ModifierChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        label,
        style: GoogleFonts.inter(fontSize: 12),
      ),
      onPressed: onTap,
      backgroundColor: Colors.deepPurple.withValues(alpha: 0.05),
      labelStyle: const TextStyle(color: Colors.deepPurple),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
