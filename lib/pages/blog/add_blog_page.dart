import 'package:flutter/material.dart';

class AddBlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un blog'),
      ),
      body: Center(
        child: Text('Ceci est la page d\'ajout de blog.'),
      ),
    );
  }
}
