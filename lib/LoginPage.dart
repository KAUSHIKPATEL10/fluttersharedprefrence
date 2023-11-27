
import 'package:fluttersharedprefrence/HomePage.dart';
import 'package:fluttersharedprefrence/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';





class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page "),
        ),
        body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)
                ),
                child: FloatingActionButton.extended(
                  label: Text('Login'), // <-- Text
                  // <-- Text
                  backgroundColor: Colors.blue,


                  onPressed: () async{
                    var sharedpref= await SharedPreferences.getInstance();
                    sharedpref.setBool(SplashPageState.KEYLOGIN, true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                        Homepage(),));
                  },
                ),),



            ],
          ),
        )
    );
  }
}