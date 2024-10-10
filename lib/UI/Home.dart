import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:roaddetection/Adapter/AdapterFood.dart';
import 'package:roaddetection/Constant/FontSize.dart';
import 'package:roaddetection/Model/StaticData.dart';
import 'package:roaddetection/Route.dart';

import '../Constant/Colors.dart';



class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String Nama="Nama";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundGray(),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 3.0,
            backgroundColor: PrimaryColors(),
            title: Text(
              "Home",style: TextStyle(
                fontSize: 25,
                color: Colors.white
            ),
            ),
            actions : [
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                  size: 28,
                ),
              )
            ]
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  final cameras = await availableCameras();
                  toScanner(context, false,cameras);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            color: Colors.grey,
                            offset:Offset(0,3),
                            spreadRadius: 4
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.qr_code,
                          size: 50,
                        ),
                        Text("Road Detector")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
