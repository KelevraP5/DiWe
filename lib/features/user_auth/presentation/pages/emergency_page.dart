import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Page d\'urgence'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Action à effectuer lors du clic sur l'icône d'ajout
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Liste des personnes à contacter',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Ces contacts seront notifiés par SMS en cas de problème.',
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return _buildContactItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem() {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(
          Icons.person,
          size: 50.0,
        ),
        title: Text(
          'Nom du contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Relation avec vous',
        ),
        trailing: IconButton(
          icon: Icon(Icons.call),
          onPressed: () {
            // Action à effectuer lors du clic sur l'icône d'appel
          },
        ),
      ),
    );
  }
}
