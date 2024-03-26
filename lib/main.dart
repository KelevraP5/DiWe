import 'package:diwe_flutter/pages/liste_materiel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner : false,
      home: MyHomePage(title: 'Diwe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ListeMateriel())),
              child: Text('Liste de matériel'),
          ),
        ],
      ),
    );
  }
}