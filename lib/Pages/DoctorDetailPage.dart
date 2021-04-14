import 'package:book_an_appointment/DataClass/DoctorModel.dart';
import 'package:book_an_appointment/DataClass/Doctors.dart';
import 'package:flutter/material.dart';

class DoctorDetailPage extends StatefulWidget {
  final DoctorModel doc;
  const DoctorDetailPage(this.doc);
  @override
  _DoctorDetailPageState createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var _allotedSlot;
    List timeslotList = widget.doc.timeslot;

    return Scaffold(
      appBar: AppBar(
        title: Text("Meet to"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 60,
                    left: 30,
                    child: Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 25),
                              SizedBox(
                                height: 50,
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.mail)),
                              SizedBox(
                                width: 200,
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.phone)),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Dr. " + widget.doc.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            widget.doc.specialty,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Text(
                            widget.doc.degree,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: width / 3,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(widget.doc.avtar),
                        backgroundColor: Colors.transparent,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                height: 800,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 2, right: 2),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Select Slot ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.doc.timeslot.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  print(widget.doc.timeslot[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(40)),
                                    child: Center(
                                        child: Text(
                                      widget.doc.timeslot[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
