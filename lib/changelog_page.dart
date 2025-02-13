import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:poc_automatic_changelog/styles/markdown_style.dart';

class ChangelogPage extends StatefulWidget {
  const ChangelogPage({super.key});

  @override
  State<ChangelogPage> createState() => _ChangelogPageState();
}

class _ChangelogPageState extends State<ChangelogPage> {
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
      appBar: AppBar(
        title: const Text('Histórico de versões'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: _markdownContent.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Markdown(
                data: _markdownContent,
                styleSheet: MarkdownStyle.getStyle(context),
              ),
      ),
    );
  }
}
