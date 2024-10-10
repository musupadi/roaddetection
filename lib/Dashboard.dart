import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'Constant/Colors.dart';
import 'UI/Home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 1; // Home sebagai default

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _navigationBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> tabs = [
    Text("data3"),
    home(), // Home ada di indeks 1
    Text("data3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: ConvexAppBar.badge(
        const <int, dynamic>{3: '99+'},
        style: TabStyle.fixedCircle,
        backgroundColor: PrimaryColors(),
        items: const <TabItem>[
          TabItem(icon: Icons.history, title: "History"),
          TabItem(icon: Icons.home, title: "Home"), // Tab Home
          TabItem(icon: Icons.person, title: "Profile"),
        ],
        onTap: (int i) => _navigationBottomBar(i),
      ),
    );
  }
}
