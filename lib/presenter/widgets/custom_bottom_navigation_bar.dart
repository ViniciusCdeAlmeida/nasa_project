import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int position;

  const CustomBottomNavigationBar({
    required this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 4,
            onTap: (value) {
              switch (value) {
                case 0:
                  Modular.to.pushNamed('/');
                  break;
                case 1:
                  Modular.to.pushNamed('/saved/');
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Find',
                icon: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Icon(Icons.search),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey,
                label: 'Saved',
                icon: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
