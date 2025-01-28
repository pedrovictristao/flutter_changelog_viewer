import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:poc_automatic_changelog/styles/markdown_style.dart';

class MarkdownReader extends StatefulWidget {
  const MarkdownReader({super.key});

  @override
  State<MarkdownReader> createState() => _MarkdownReaderState();
}

class _MarkdownReaderState extends State<MarkdownReader> {
  String _markdownContent = "";

  @override
  void initState() {
    super.initState();
    _loadMarkdownFile();
  }

  // Tenta obter o arquivo markdown
  Future<void> _loadMarkdownFile() async {
    try {
      // Utiliza um arquivo disponível em assets para exibição
      final content = await rootBundle.loadString('CHANGELOG.md');
      setState(() {
        _markdownContent = content;
      });
    } catch (e) {
      setState(() {
        _markdownContent = 'Não foi possível carregar o conteúdo: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CHANGELOG')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: _markdownContent.isEmpty
            ? const CircularProgressIndicator()
            : Markdown(
                data: _markdownContent,
                styleSheet: MarkdownStyle.getStyle(context),
              ),
      ),
    );
  }
}
