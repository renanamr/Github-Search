import 'package:flutter/material.dart' show MaterialApp,ThemeData,Color,runApp;
import 'package:github_search/src/Home/Home.dart';

void main() =>
    runApp(
        MaterialApp(
          theme: ThemeData(
            primaryColor: Color(0xFF0092E5),
          ),
          debugShowCheckedModeBanner: false,
          home: Home(),
        )
    );
