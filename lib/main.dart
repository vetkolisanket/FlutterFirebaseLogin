import 'package:flutter/material.dart';
import 'package:simple_firebase_auth/auth.dart';
import 'package:simple_firebase_auth/home_page.dart';
import 'package:simple_firebase_auth/login_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider<AuthService>(
      child: MyApp(),
      builder: (BuildContext context) {
        return AuthService();
      },
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: Provider.of<AuthService>(context).getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.hasData ? HomePage() : LoginPage();
            } else {
              return Container(color: Colors.white);
            }
          }
      ),
    );
  }
}