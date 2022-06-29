import 'package:admin_dairy_management_system/ui_screen/animals.dart';
import 'package:admin_dairy_management_system/ui_screen/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customer.dart';
import 'feed.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    var email="mubasharfareed@dairy.com";
    var password="mubashar123";
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Admin Login Page"),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  if(value!=email){
                    return "Please Enter valid Email";
                  }
                },
                onSaved: (value){
                  if(value==email){
                    email==value;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.purple, fontSize: 18)),
              ),
              TextFormField(
                onSaved: (save){
                  if(save==password){
                    password==save;
                  }
                },
                validator: (value) {
                  if(value!=password){
                    return "Please enter valid Password";
                  }
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.green, fontSize: 18)),
              ),
              CupertinoButton(
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.black45),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Animals()));
                    }

                  })
            ],
          ),
        ),
      ),
    );
  }
}

class LoginNotifier with ChangeNotifier {}
