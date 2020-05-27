import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg='';

  Future<List> _login() async {
    final response = await http.post("http://192.168.43.38/apiflutter/login/login_api", body: {
      "username": user.text,
      "password": pass.text,
    });

    //print(response.body);

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
      if(datauser['level']=='user'){
        Navigator.pushReplacementNamed(context, '/pages/home');
      }else if(datauser['level']=='admin'){
        Navigator.pushReplacementNamed(context, '/pages/admin');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username", style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: user,
                decoration: InputDecoration(
                  hintText: 'Username'
                ),
              ),

              Text("Password", style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),

              RaisedButton(
                child: Text("Login"),
                onPressed: (){
                  _login();
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0, color: Colors.red),)
            ]
          ),
        )
      ),
    );
  }
}