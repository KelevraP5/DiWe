import 'package:flutter/material.dart';

class EditBlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier un blog'),
      ),
      body: Center(
        child: Text('Ceci est la page d\'édition de blog.'),
      ),
    );
  }
}
