import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unergiagraphapp/Widgets/Dot.dart';

class Test extends StatelessWidget {
  final databaseReference = Firestore.instance;

  void getData() {
    databaseReference
        .collection("Data")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print(f.data.keys));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[RaisedButton(onPressed: 
        (){
          // Provider.of<FirebaseNotfier>(context,listen: false).setData();
        })],
      ),
      body: Container(
       
       child: Center(child: Dot()),),
    );
  }

  
}
