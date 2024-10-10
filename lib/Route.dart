
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:roaddetection/Dashboard.dart';
import 'package:roaddetection/UI/Scanner.dart';

import 'Login.dart';

toLogin(BuildContext context,bool instant){
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(seconds: instant ? 0 : 2),
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.elasticInOut
            );
            return ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.centerLeft,
            );
          },
          pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation
              )
          {
            return Login();
          }
      )
  );
}
toDashboard(BuildContext context,bool instant){
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(seconds: instant ? 0 : 2),
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.elasticInOut
            );
            return ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.centerLeft,
            );
          },
          pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation
              )
          {
            return Dashboard();
          }
      )
  );
}
toScanner(BuildContext context,bool instant,List<CameraDescription> cameras){
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(seconds: instant ? 0 : 2),
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.elasticInOut
            );
            return ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.centerLeft,
            );
          },
          pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation
              )
          {
            return Scanner(cameras: cameras);
          }
      )
  );
}