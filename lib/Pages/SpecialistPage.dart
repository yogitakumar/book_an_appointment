import 'package:book_an_appointment/DataClass/DoctorModel.dart';
import 'package:flutter/material.dart';

import 'DoctorDetailPage.dart';
import 'RatedDocPage.dart';

class SpecialistPage extends StatefulWidget {
  final Hospital dept;
  SpecialistPage(this.dept);
  @override
  _SpecialistPageState createState() => _SpecialistPageState();
}

class _SpecialistPageState extends State<SpecialistPage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body: ListView.builder(
          itemCount: widget.dept.doctorsInDept.length,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>DoctorDetailPage(widget.dept.doctorsInDept[index])));
            },
            child: Card(
              child: Row(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(
                      width: 100,
                      height: 80,
                      child: Image.network(
                        widget.dept.doctorsInDept[index].avtar,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Dr. "+widget.dept.doctorsInDept[index].name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          widget.dept.doctorsInDept[index].degree,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          widget.dept.doctorsInDept[index].specialty,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: Container(
                            height: 0.1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (i) {
                                return Icon(
                                  i < widget.dept.doctorsInDept[index].rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })

      /*GridView.builder(

          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            //childAspectRatio: width / (height / 4)
          ),
          itemCount: widget.dept.doctorsInDept.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                /* Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => RatedDocScreen(snapshot.data.documents[index]
                                                .data['name'])));*/
              },
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(
                      width: 100,
                      height: 80,
                      child: Image.network(
                        widget.dept.doctorsInDept[index].avtar,
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
                        widget.dept.doctorsInDept[index].name,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),*/
    );
  }
}
