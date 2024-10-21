import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext){
    return MaterialApp(
      title: 'Get That Finance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes:{
        '/':(context)=> LoginScreen(),
        '/register': (context)=> RegistrationScreen(),
      },
    );
  }
}