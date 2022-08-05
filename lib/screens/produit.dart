import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Produit extends StatefulWidget {
  Produit({Key? key}) : super(key: key);

  @override
  State<Produit> createState() => _ProduitState();
}

class _ProduitState extends State<Produit> {
  List<dynamic> productList = [];

  void getProductApi(int id) async {
    var response = await http
        .get(Uri.parse("https://api.escuelajs.co/api/v1/products/$id"));
    if (response.statusCode == 200) {
      setState(() {
        productList = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    getProductApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Prodwi'),
        ),
        body: GridView.builder(
            itemCount: productList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(productList[index]['images'][2]),
                          fit: BoxFit.cover),
                    ),
                    height: 100,
                    width: 170,
                  ),
                  SizedBox(height: 20),
                  Text(
                    productList[index]['title'],
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 7, 181, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: null, icon: Icon(Icons.sell)),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 26,
                          ))
                    ],
                  )
                ],
              );
            }));
  }
}
