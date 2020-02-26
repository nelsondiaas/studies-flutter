import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'controllers/file.controller.dart';
import 'views/home/home.view.dart';


void main() { 
  
  GetIt provider = GetIt.instance;
  provider.registerSingleton<FileController>(FileController());
  provider.registerSingleton<Random>(Random());

  return runApp(MyApp()); 
} 

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme Generation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
