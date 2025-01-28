import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownStyle {
  static MarkdownStyleSheet getStyle(BuildContext context) {
    return MarkdownStyleSheet(
      h1: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      h2: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      p: const TextStyle(
        fontSize: 14,
      ),
      strong: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      code: TextStyle(
        fontSize: 14,
        backgroundColor: Colors.grey[200],
        color: Colors.deepPurple,
      ),
      blockquote: TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        color: Colors.grey[600],
      ),
    );
  }
}
