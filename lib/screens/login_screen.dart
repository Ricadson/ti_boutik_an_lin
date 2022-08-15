import 'dart:convert';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:ti_boutik_an_lin/State/produitState.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _init = true;
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<ProduitState>(context, listen: false).GetCategorie();
      setState(() {});
    }
    _init = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // List categoryList = [];
//
  // void getListApi() async {
  //   var response =
  //       await http.get(Uri.parse("https://fakestoreapi.com/products"));
  //   if (response.statusCode == 200) {
  //     print(categoryList);
  //     setState(() {
  //       categoryList = jsonDecode(response.body);
  //     });
  //   }
  // }

  //@override
  //void initState() {
  //  getListApi();
  //  super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    final Produit = Provider.of<ProduitState>(context).listeCategories();
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
        body: ListView.builder(
            itemCount: Produit.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print('hello');
                },
                child: Text('${Produit[index].category}'.toString()),
              );
            }));
  }
}
