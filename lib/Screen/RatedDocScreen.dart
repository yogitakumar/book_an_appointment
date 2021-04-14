import 'package:book_an_appointment/DataClass/Doctors.dart';
import 'package:book_an_appointment/Screen/DoctorDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RatedDocScreen extends StatefulWidget {
  final String specialty;
  RatedDocScreen(this.specialty);
  @override
  _RatedDocScreenState createState() => _RatedDocScreenState();
}

class _RatedDocScreenState extends State<RatedDocScreen> {
  final ref = Firestore.instance.collection('Doctors');
  @override
  Widget build(BuildContext context) {
   final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.specialty),
      ),
      body: StreamBuilder(
          stream: ref.where('specialty', isEqualTo: widget.specialty).snapshots(),
          builder: (_,AsyncSnapshot<QuerySnapshot>snapshot){
            if (snapshot.hasData){
              List<Doctor> docList =[];
              snapshot.data.documents.forEach((document) {
                docList.add(Doctor.fromJson(document.data));
              });
              //print(snapshot.data.documents[1].data['name']);

              return Container(
                height: height,
               // width: 600,
                child: ListView.builder(
                    //scrollDirection: Axis.vertical,
                    itemCount: docList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(_)=>DoctorDetailScreen(doc: docList[index],)));
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(40,5,20,5),
                              height: 170,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color:Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(130,20,20,20),
                                child: Column(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width:120,
                                          child: Text(docList[index].name,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                            overflow: TextOverflow.ellipsis,),
                                        ),
                                        /*Column(
                                          children: <Widget>[
                                            Text('\$${activity.price}',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                              ),),
                                            Text('per pax',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),),
                                          ],
                                        ),*/
                                      ],
                                    ),
                                    Text(docList[index].specialty,
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),),
                                   // _buildRatingStars(activity.rating),
                                    /*SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          width:70,
                                          decoration:BoxDecoration(
                                            color:Theme.of(context).accentColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(activity.startTimes[0]),
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          width:70,
                                          decoration:BoxDecoration(
                                            color:Theme.of(context).accentColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(activity.startTimes[1]),
                                        ),
                                      ],
                                    ),*/

                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left:20,
                              top:15,
                              bottom:15,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(docList[index].avtar),
                                  backgroundColor: Colors.transparent,
                                )
                              ),
                            )
                          ],
                        ),
                      );

                      /*Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          width: 300,
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                Image.network(snapshot.data.documents[index].data['avtar']),
                                Column(
                                  children: <Widget>[
                                    Text(snapshot.data.documents[index].data['name'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w700
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                        ),
                        ));*/

                    }
                ),
              );

            }
            else if (snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            else{
              return CircularProgressIndicator();
            }
          }

      ),
    );
  }
}
