class Doctor {
  String id;
  String avtar;
  String name;
  String rating;
  String specialty;
  String degree;
  List timeslot;

  Doctor({this.id, this.avtar, this.name, this.rating, this.specialty,this.degree,this.timeslot});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avtar = json['avtar'];
    name = json['name'];
    rating = json['rating'];
    specialty = json['specialty'];
    degree = json['degree'];
    timeslot=json['timeslot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avtar'] = this.avtar;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['specialty'] = this.specialty;
    data['degree'] = this.degree;
    data['timeslot']=this.timeslot;
    return data;
  }
}