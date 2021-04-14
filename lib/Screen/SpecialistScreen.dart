import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'RatedDocScreen.dart';

class SpecialistScreen extends StatefulWidget {
  @override
  _SpecialistScreenState createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {

  CollectionReference collectionReference =
  Firestore.instance.collection("Specialist");
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body: StreamBuilder(
          stream: collectionReference.snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 600,
                          width: 400,
                          child: GridView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  //childAspectRatio: width / (height / 4)
                                  ),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => RatedDocScreen(snapshot.data.documents[index]
                                                .data['name'])));
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top:8.0),
                                        child: Container(
                                          width: 100,
                                          height: 80,
                                          child: Image.network(
                                            snapshot.data.documents[index]
                                                .data['image'],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 100,
                                        color:Colors.lightBlueAccent,
                                        child: Center(
                                          child: Text(
                                            snapshot.data.documents[index]
                                                .data['name'],
                                            style: TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })
                      ),

                    ],
                  ),
                ),
              );
            } else {
              return Text('loading');
            }
          }),
    );
  }
}
