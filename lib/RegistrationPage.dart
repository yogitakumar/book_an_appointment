import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  var _countryMap = ['India', 'United Kingdom', 'New Zealand'];
  String _userName, _password, _email, _confirmPassword,_contactNo;
  bool _obscureText = true;
  final TextEditingController _passwordcotroller = new TextEditingController();
  final TextEditingController _ConfirmPasswordCotroller =
      new TextEditingController();
  final TextEditingController _contactNoCotroller = new TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  String _country, _mobileno;
  FocusNode _focusNode = new FocusNode();




  String matchPassword(String value){
    if(value != _password){
      return "Passwords do not match";
    }
    else{return null;}
  }

  @override
  Widget _showUserNameInput() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.face,
          color: Colors.blueAccent,
        ),
        labelText: 'User Name',
        hintText: 'eg. John Smith',
        focusColor: Color(0xFF0C3853),
      ),
      onSaved: (val) => _userName = val,
      validator: MultiValidator([
        RequiredValidator(errorText: "* Required"),
        MinLengthValidator(6,
            errorText: "Password should be atleast 6 characters"),
        MaxLengthValidator(15,
            errorText:
            "Password should not be greater than 15 characters")
      ]),

    );
  }

  Widget _showUserEmailInput() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.blueAccent,
        ),
        labelText: 'Email',
        hintText: 'eg. John@gmail.com',

        focusColor: Color(0xFF0C3853),
      ),
      onSaved: (val) => _email = val,
      validator: MultiValidator([
        RequiredValidator(errorText: "* Required"),
        EmailValidator(errorText: "Enter valid email id"),
      ])

    );
  }

  Widget _showContactNoInput() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.blueAccent,
        ),

        focusColor: Color(0xFF0C3853),
        labelText: 'Contact Number',
        hintText: 'Enter your contact number',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly
      ],
      controller: _contactNoCotroller,
      onSaved: (val) => _contactNo = val,
      validator: MultiValidator([
        RequiredValidator(errorText: "* Required"),
        MinLengthValidator(10,
            errorText: "must be 10 digits"),
        MaxLengthValidator(15,
            errorText:
            "not be greater than 15 characters")
      ]),


    );
  }


  Widget _showPasswordInput() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            _obscureText = !_obscureText;
          }),
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.blueAccent,
        ),
        focusColor: Color(0xFF0C3853),
        labelText: 'Password',
        hintText: 'Enter secure password, min length 6',
      ),
      obscureText: _obscureText,
      controller: _passwordcotroller,
      onSaved: (value) => _password = value,
      validator: MultiValidator([

            RequiredValidator(errorText: "* Required"),
            MinLengthValidator(6,
                errorText: "Password should be atleast 6 characters"),
            MaxLengthValidator(15,
                errorText:
                "Password should not be greater than 15 characters"),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
      ]),


    );
  }

  Widget _showConfirmPasswordInput() {
    return TextFormField(
      controller: _ConfirmPasswordCotroller,
      onSaved: (value) => _confirmPassword = value,
      validator:(value)=>matchPassword(value),
        //MatchValidator(errorText: 'passwords do not match').validateMatch(value,_password),
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            _obscureText = !_obscureText;
          }),
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.blueAccent,
        ),
        focusColor: Color(0xFF0C3853),
        labelText: 'Confirm Password',
        hintText: 'Re-type password',
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)),
      child: FlatButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // Navigator.push(context,
            //   MaterialPageRoute(builder: (_) => HomePage()));
            print("Validated");
          } else {
            print("Not Validated");
          }
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      _signUpWithEmailandPassword();
    } else
      print('Invalid form');
  }

  _signUpWithEmailandPassword() async {
    try {
      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      setState(() {
        firebaseUser = authResult.user;
      });
      adduserDetailsToDatabase();
    } catch (e) {
      print(e);
    }
  }

  adduserDetailsToDatabase() {
    final CollectionReference userReference =
        Firestore.instance.collection('users');
    final userToAdd = {
      "userDisplayName": _userName,
      "userPassword": _password,
      "userUid": firebaseUser.uid,
      "userEmail": _email,
    };
    //Provider.of<Cart>(context, listen: false).setUid(firebaseUser.uid);
    // userReference.add(userToAdd).whenComplete(() =>

    // Provider.of<MyUser>(context,listen: false).addUser(emailAddress: _email,uid: firebaseUser.uid,userDisplayName: _userName));
    print("navigate to new page");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showUserNameInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showUserEmailInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showContactNoInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showPasswordInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showConfirmPasswordInput(),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _registerButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
