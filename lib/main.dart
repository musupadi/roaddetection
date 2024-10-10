import 'dart:async';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'Constant/Colors.dart';
import 'Constant/DefaultFirebaseOptions.dart';
import 'Login.dart';
import 'Route.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          primaryColor: PrimaryColors(),
          primaryColorDark: PrimaryColorsDark(),
          primarySwatch: Colors.blue,
          fontFamily: 'gotham'
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  // void ChangePageHome(){
  //   Navigator.push(
  //       context,
  //       PageRouteBuilder(
  //           transitionDuration: Duration(milliseconds: 0),
  //           transitionsBuilder: (
  //               BuildContext context,
  //               Animation<double> animation,
  //               Animation<double> secAnimation,
  //               Widget child) {
  //             animation = CurvedAnimation(
  //                 parent: animation,
  //                 curve: Curves.elasticInOut
  //             );
  //             return ScaleTransition(
  //               scale: animation,
  //               child: child,
  //               alignment: Alignment.center,
  //             );
  //           },
  //           pageBuilder: (
  //               BuildContext context,
  //               Animation<double> animation,
  //               Animation<double> secAnimation
  //               )
  //           {
  //             return homepage();
  //           }
  //       )
  //   );
  // }

  Checker() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    if (name != null) {
      // Jika name tidak null, pindah ke dashboard
      // toDashboard(context, false);
    } else {
      // Jika name null, tunggu 3 detik sebelum pindah ke login
      Timer(
        Duration(seconds: 3),
            () => toLogin(context,false),  // Panggil toLogin setelah 3 detik
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Obtain shared preferences.
    Checker();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'gotham'),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              color: BackgroundGray(),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage("assets/img/logo.png")
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Road Detector",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: PrimaryColors()
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
