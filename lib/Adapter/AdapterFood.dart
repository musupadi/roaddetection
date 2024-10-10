import 'package:flutter/material.dart';

class Adapterfood extends StatefulWidget {
  const Adapterfood({super.key});

  @override
  State<Adapterfood> createState() => _AdapterfoodState();
}

class _AdapterfoodState extends State<Adapterfood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.grey,
                offset:Offset(0,1),
                spreadRadius: 1
            )
          ]
      ),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fast-food-restaurant-logo%2C-restaurant-logo-design-template-33255790cb8e1186b28609dd9afd4ee6_screen.jpg?ts=1668794604"
                ),fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Text("0.68 KM * 20-30 Min"),
                Text("Kebab Jumbo"),
                Text("Rp.15.000")
              ],
            ),
          )
        ],
      ),
    );
  }
}
