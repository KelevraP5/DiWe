import 'package:diwe_flutter/pages/commandes.dart';
import 'package:flutter/material.dart';

class ListeMateriel extends StatefulWidget {
  const ListeMateriel({super.key});

  @override
  State<ListeMateriel> createState() => _ListeMaterielState();
}

class _ListeMaterielState extends State<ListeMateriel> {

  final materiels = [
    {
      "nom" : "Matos 1"
    },
    {
      "nom" : "Matos 2"
    },
    {
      "nom" : "Matos 3"
    },
    {
      "nom" : "Matos 4"
    },
    {
      "nom" : "Matos 5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Diwe'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: materiels.length,
              itemBuilder: (context, index) {
                final materiel = materiels[index];
                final nomMateriel = materiel['nom'];

                return ListTile(
                  title: Text('$nomMateriel')
                );
              },
            ),
          ),

          Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Commandes())),
              child: Text('Commandes'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




