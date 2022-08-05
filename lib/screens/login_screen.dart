import 'dart:convert';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:ti_boutik_an_lin/screens/produit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List categoryList = [];

  void getListApi() async {
    var response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
    if (response.statusCode == 200) {
      setState(() {
        categoryList = jsonDecode(response.body) as List;
      });
    }
  }

  @override
  void initState() {
    getListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Boutik 10"),
          actions: [TextButton(onPressed: () {}, child: Text("Peye"))],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Tiboutik"),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text("Konekte"),
              ),
              ListTile(
                title: Text("Lis prodwi"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Dekonekte"),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
              children: categoryList.map((cat) {
            return GestureDetector(
                onTap: () {
                  if (cat['id'] == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Produit()));
                  }
                },
                child: topCategory(cat));
          }).toList()),
        ));
  }
}

Widget topCategory(Map cat) {
  return Container(
    decoration: BoxDecoration(
      image:
          DecorationImage(image: NetworkImage(cat['image']), fit: BoxFit.cover),
    ),
    margin: EdgeInsets.all(15),
    width: double.infinity,
    height: 170.0,
    child: Stack(
      children: [
        Positioned(
          child: Text(
            cat['name'],
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          bottom: 5,
          right: 5,
        )
      ],
    ),
  );
}
