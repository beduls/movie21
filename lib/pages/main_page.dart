import 'package:flutter/material.dart';
import 'package:movie21/pages/homes/home_tab.dart';
import 'package:movie21/pages/homes/profile_tabl.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeTab(),
        const ProfileTab(),
        const ProfileTab(),
      ][currentIdx],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIdx,
          onTap: (value7) {
            setState(() {
              currentIdx = value7;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fave'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
