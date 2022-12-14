import 'package:cthtc/pages/navigation/menu_bar.dart';
import 'package:cthtc/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: MenuBar(
          path: ABOUT_PAGE,
        ),
      ),
      body: Container(
        child: Text('About'),
      ),
    );
  }
}
