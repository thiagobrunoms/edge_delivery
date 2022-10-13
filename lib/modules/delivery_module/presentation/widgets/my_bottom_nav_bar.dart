import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        print('position selected: $position');
        setState(() {
          selectedBarIndex = position;

          switch (position) {
          case 0:
            Modular.to.navigate('./request_home');
            break;
          case 1:
            Modular.to.navigate('./delivery_history');
            break;
          case 2:
            Modular.to.navigate('./payment');
            break;
          default:
        }
        });
      },
    );
  }
}