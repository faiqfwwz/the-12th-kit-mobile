import 'package:flutter/material.dart';
import 'package:the_12th_kit/screens/productslist_form.dart';
import 'package:the_12th_kit/screens/menu.dart';
import 'package:the_12th_kit/screens/products_entry_list.dart';
import 'package:the_12th_kit/screens/products_entry_list_all.dart';
import 'package:the_12th_kit/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}"),
              ),
            );
          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsFormPage(),
              ),
            );
          }
          else if (item.name == "My Products") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductsEntryListPage()
                ),
            );
          }
          else if (item.name == "All Products") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductsEntryListAllPage()
                ),
            );
          }
          else if (item.name == "Logout") {
              final response = await request.logout(
                  "https://ahmad-faiq41-the12thkit.pbp.cs.ui.ac.id/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message See you again, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}