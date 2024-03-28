import 'package:flutter/material.dart';

class BlogDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail du blog'),
      ),
      body: Center(
        child: Text('Ceci est la page de détail du blog.'),
      ),
    );
  }
}
