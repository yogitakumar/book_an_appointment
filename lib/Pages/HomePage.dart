import 'package:book_an_appointment/DataClass/DoctorModel.dart';
import 'package:book_an_appointment/DataClass/LookFor.dart';
import 'package:flutter/material.dart';

import 'SpecialistPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Talk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 7,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Welcome ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "UserName!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How can we help you today?",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: width / (height / 4)),
                itemCount: listDept.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SpecialistPage(listDept[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Card(
                        shadowColor: Colors.orangeAccent,
                        color: Colors.orangeAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(listDept[index].dept,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ),
                              Image.network(
                                listDept[index].deptimage,
                                height: 70,
                                width: 60,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    "Your Appointments",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey),
                  ),
                  Icon(
                    Icons.timer,
                    color: Colors.lightGreen,
                  )
                ],
              ),
            ),
            Container(
                width: 400,
                height: 150,
                child: Card(
                  shadowColor: Colors.blue,
                )),
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    "For Today",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Colors.lightGreen,
                  )
                ],
              ),
            ),
            Container(
                width: 400,
                height: 150,
                child: Card(
                  shadowColor: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}
