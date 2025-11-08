import 'package:flutter/material.dart';
import 'package:the_12th_kit/screens/menu.dart';
import 'package:the_12th_kit/screens/productslist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Drawer(
      backgroundColor: cs.surface,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: cs.primary,
            ),
            child: Column(
              children: [
                Text(
                  'The 12th Kit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: cs.onPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Seluruh jersey sepak bola terkini di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: cs.onPrimary.withOpacity(0.9),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.home_outlined, color: cs.secondary),
            title: Text(
              'Home',
              style: TextStyle(color: cs.onSurface),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.post_add, color: cs.secondary),
            title: Text(
              'Create Product',
              style: TextStyle(color: cs.onSurface),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductsFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}