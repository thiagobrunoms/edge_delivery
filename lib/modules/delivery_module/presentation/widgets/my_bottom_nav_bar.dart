import 'package:flutter/material.dart';

class MyBottonNavBar extends StatefulWidget {
  const MyBottonNavBar({super.key});

  @override
  State<MyBottonNavBar> createState() => _MyBottonNavBarState();
}

class _MyBottonNavBarState extends State<MyBottonNavBar> {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedBarIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Delivery'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
      ],
      onTap: (position) {
        setState(() {
          selectedBarIndex = position;

          switch (selectedBarIndex) {
            case value:
              
              break;
            default:
          }

        });
      },
    );
  }
}