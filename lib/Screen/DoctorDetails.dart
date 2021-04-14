import 'package:book_an_appointment/DataClass/Doctors.dart';
import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatefulWidget {
  final Doctor doc;
  const DoctorDetailScreen({this.doc});
  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
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
      body:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              height: 400,
              width: width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top:60,
                    left: 30,
                    child: Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        color:Colors.purple,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 25),
                              SizedBox(height: 50,),
                              IconButton(
                                onPressed: (){},
                                 icon:Icon(Icons.mail)),
                              SizedBox(width: 200,),
                              IconButton(
                                  onPressed: (){},
                                  icon:Icon(Icons.phone)),
                            ],
                          ),
                          SizedBox(height: 40,),
                          Text("Dr. "+widget.doc.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color:Colors.white
                          ),),
                          Text(widget.doc.specialty,
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 16
                          ),),
                          Divider(
                            color: Colors.white,
                          ),
                          Text(widget.doc.degree,
                          style: TextStyle(
                            fontSize: 15,
                            color:Colors.black
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left:width/3,
                    child:CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(widget.doc.avtar),
                      backgroundColor: Colors.transparent,
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:0),
              child: Container(

                height: 800,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight:  Radius.circular(40),topLeft:Radius.circular(40) ),
                  color:Colors.red
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:120),
                      child: DropdownButton(
                        // need to syncronise drop down box
                        items: timeslotList?.map((value) {
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text(value, style: new TextStyle(fontSize: 16.0),),
                          );
                        })?.toList() ?? [],
                        onTap: (){},
                        onChanged: (newSelectedCategory) {
                          setState(() {
                            _allotedSlot=newSelectedCategory;
                           // _cureentCategory=newSelectedCategory;
                            //int i=categoryList.indexOf(_cureentCategory);
                            //CatId = catIdList.elementAt(i);
                            //isSelected=true;
                          });

                          //_onDropDownItemSelected(newSelectedCategory);
                          print(newSelectedCategory);
//_allotedSlot=newSelectedCategory;
                        },
                        value: _allotedSlot,
                        hint: Text("choose timeslot"),
                      ),
                    ),
                    Text("Selected time slot : $_allotedSlot")
                  ],
                ),

              ),
            )
          ],
        ),
      ),

    );
  }
}
