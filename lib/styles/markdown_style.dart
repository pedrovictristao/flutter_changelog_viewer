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
        fontSize: 16,
        color: Colors.black87,
        height: 1.5,
      ),
      strong: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
      code: TextStyle(
        fontSize: 14,
        fontFamily: 'Courier',
        backgroundColor: Colors.grey[200],
        color: Colors.deepPurple,
      ),
      blockquote: TextStyle(
        fontSize: 18,
        fontStyle: FontStyle.italic,
        color: Colors.grey[600],
      ),
    );
  }
}
