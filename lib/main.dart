import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttersharedprefrence/Homepage.dart';
import 'package:fluttersharedprefrence/LoginPage.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),

    );
  }
}
class SplashPage extends StatefulWidget{
  @override
  State<SplashPage>createState()=>SplashPageState();}
class SplashPageState extends State<SplashPage> {
  static const String KEYLOGIN ="Login";
  @override
  void initState(){
    super.initState();

    whereToGo();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Icon(Icons.account_circle, color: Colors.white),
        ),
      ),
    );
  }


  void whereToGo() async{
    var sharedPref= await SharedPreferences.getInstance();
    var isLoggedIn= sharedPref.getBool(KEYLOGIN);
    Timer(Duration(seconds: 2),(){
      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              Homepage(),));

        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              Loginpage(),));
        }

      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
            Loginpage(),));
      }

    },);
  }

}