import 'package:flutter/material.dart';
import 'package:my_app1/provider/addpage_provider.dart';
import 'package:my_app1/provider/details_provider.dart';
import 'package:my_app1/provider/edit_pprovider.dart';
import 'package:my_app1/provider/flashpage_provider.dart';
import 'package:my_app1/provider/list_provider.dart';
import 'package:my_app1/view/splash.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentDetailProvider()),
        ChangeNotifierProvider(create: (_)=> SplashProvider()),
        ChangeNotifierProvider(create: (_)=>HomeProvider()),
        ChangeNotifierProvider(create: (_)=>AddStudentProvider()),
        ChangeNotifierProvider(create: (_)=>EditStudentProvider())
        // Add other providers here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My students',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}
