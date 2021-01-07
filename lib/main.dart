
import 'file:///E:/Android_projects/ecommerceapp/lib/view/auth/loginscreen.dart';
import 'package:ecommerceapp/binding.dart';
import 'package:ecommerceapp/view/auth/controller.dart';
import 'package:ecommerceapp/view/auth/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: ControlView()
      //ControlView(),
    );
  }
}
