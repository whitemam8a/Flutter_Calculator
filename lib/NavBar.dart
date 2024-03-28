import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          child: Text('Menu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ),
        ListTile(
          title: const Text('Calculator'),
          onTap: () => {Navigator.of(context).pushNamed('/')},
        ),
        ListTile(
          title: const Text('Converter'),
          onTap: () => {Navigator.of(context).pushNamed('/converter')},
        ),
        ListTile(
          title: const Text('History'),
          onTap: () => {Navigator.of(context).pushNamed('/history')},
        ),
      ]),
    );
  }
}
