import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';
import 'package:flutter/material.dart';

class VersionWidget extends StatefulWidget {
  final Version requiredVersion;

  const VersionWidget({super.key, required this.requiredVersion});

  @override
  State<VersionWidget> createState() => _VersionWidgetState();
}

class _VersionWidgetState extends State<VersionWidget> {
  String _versionMessage = 'Obtendo versão...';

  Future<void> _initPackageInfo() async {
    try {
      final info = await PackageInfo.fromPlatform();

      String normalizedVersion = _normalizedVersion(info.version);
      Version currentVersion = Version.parse(normalizedVersion);

      setState(() {
        _versionMessage = currentVersion < widget.requiredVersion
            ? 'Aplicativo desatualizado!'
            : 'Versão $currentVersion';
      });
    } catch (e) {
      setState(() {
        _versionMessage = 'Erro ao obter versão!\n$e';
      });
    }
  }

  String _normalizedVersion(String version) {
    version = version.split('+').first;
    List<String> parts = version.split('.');
    while (parts.length < 3) {
      parts.add('0');
    }
    return parts.join('.');
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(_versionMessage),
    );
  }
}
