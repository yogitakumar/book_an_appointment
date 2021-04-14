import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final collectionRef=Firestore.instance.collection("categories");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase demo'),
      ),
      body: StreamBuilder(
        stream: collectionRef.snapshots(),
        builder: (_,snapshot){
          if(snapshot.hasData){

          return Text(snapshot.data.documents[0].data.toString());}
          else{return CircularProgressIndicator();}
        },
      ),
    );
  }
}
