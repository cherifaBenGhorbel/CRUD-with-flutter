import 'package:flutter/material.dart';
import 'package:tp5/util/dbuse.dart';
import '../models/list_etudiants.dart';

class ListStudentDialog {
  final txtNom = TextEditingController();
  final txtPrenom = TextEditingController();
  final txtdatNais = TextEditingController();

  Widget buildAlert(BuildContext context, ListEtudiants student, bool isNew) {
    dbuse helper = dbuse();

    if (!isNew) {
      txtNom.text = student.nom;
      txtPrenom.text = student.prenom;
      txtdatNais.text = student.datNais;
    }

    return AlertDialog(
      title: Text((isNew) ? 'New Student' : 'Edit Student'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(controller: txtNom, decoration: InputDecoration(hintText: 'Last Name')),
            TextField(controller: txtPrenom, decoration: InputDecoration(hintText: 'First Name')),
            TextField(controller: txtdatNais, decoration: InputDecoration(hintText: 'Date of Birth')),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                student.nom = txtNom.text;
                student.prenom = txtPrenom.text;
                student.datNais = txtdatNais.text;
                helper.insertEtudiants(student);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
