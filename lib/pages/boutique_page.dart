import 'package:flutter/material.dart';

class BoutiquePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boutique'),
      ),
      body: Center(
        child: Text('Ceci est la page de boutique.'),
      ),
    );
  }
}
