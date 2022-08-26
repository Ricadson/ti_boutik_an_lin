import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../screens/categorieModel.dart';

class ProduitState with ChangeNotifier {
  List<Produit> _categorie = [];

  Future<void> GetCategorie() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      var data = json.decode(response.body) as List;

      List<Produit> produits = [];
      data.forEach((element) {
        Produit post = Produit.fromJson(element);
        produits.add(post);
        print(element);
      });
      _categorie = produits;
    } catch (e) {
      print('erreur');
      print(e);
    }
  }

  List<Produit> listeCategories() {
    if (_categorie != null) {
      return [..._categorie];
    }
    return [];
  }
}
