import 'package:flutter/material.dart';
import 'package:poc_automatic_changelog/changelog_page.dart';
import 'package:poc_automatic_changelog/widgets/version_widget.dart';
import 'package:version/version.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POC Changelog automático',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.history),
        title: const Text('Changelog Automático'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Projeto desenvolvido para geração de changelogs automaticamente com a possibilidade de exibir o arquivo gerado para o usuário.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangelogPage(),
                      ),
                    );
                  },
                  label: const Text(
                    'Histórico de versões',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(
                    Icons.history,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          VersionWidget(
            requiredVersion: Version(1, 0, 0),
          ),
        ],
      ),
    );
  }
}
