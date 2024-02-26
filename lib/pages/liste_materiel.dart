import 'package:flutter/material.dart';

class ListeMateriel extends StatefulWidget {
  const ListeMateriel({super.key});

  @override
  State<ListeMateriel> createState() => _ListeMaterielState();
}

Widget ShowMateriel() {
  return Expanded(child: ListView.builder(
      // itemCount: ,// liste matériel
      itemBuilder : (context, index) {
        // final String material = // pièce de matériel
      }
  ),
  );
}

class _ListeMaterielState extends State<ListeMateriel> {
  @override
  Widget build(BuildContext context) {
    return ShowMateriel();
  }
}
