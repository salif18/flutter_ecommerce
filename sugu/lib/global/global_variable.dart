import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:sugu/models/products.dart';

//model catpurchase
class ItemPurchase {
  String name;
  String image;
  double prix;
  int qty;

  ItemPurchase(this.name, this.image, this.prix, this.qty);
}

//model addresse
class Addresse {
  String ville;
  String quartier;
  int rue;
  int porte;
  int log;

  Addresse(this.ville, this.quartier, this.rue, this.porte, this.log);
}

class VariableGlobal extends ChangeNotifier {
  String _userId;
  String _token;
  double _total;
  // Mon panier
  List<ItemPurchase> _cart;

  VariableGlobal()
      : _userId = "",
        _token = "",
        _total = 0,
        _cart = [];

  // Fonction ajout panier
  void addToCart(Products product, int quantity) {
    // Vérifier si le produit est déjà dans le panier
    final itemIsExist =
        _cart.firstWhereOrNull((item) => item.name.contains(product.name));
    // Si c'est le cas, modifier seulement la quantité existante
    if (itemIsExist != null) {
      itemIsExist.qty += quantity;
    } else {
      // Sinon, ajouter le nouveau produit
      _cart.add(
          ItemPurchase(product.name, product.image, product.prix, quantity));
    }
    // Réinitialiser à 0 après l'ajout
    quantity = 0;
    // Informer les auditeurs (les widgets) du changement
    notifyListeners();
  }

  // fonction suppression du produit dans le panier
  void removeToCart(item) {
    _cart.removeAt(item);
    notifyListeners();
  }

// Increment
  void increment(ItemPurchase item) {
    final newCart = _cart.map((product) =>
        product.name == item.name && product.qty > 0
            ? ItemPurchase(
                product.name, product.image, product.prix, product.qty + 1)
            : product);
    _cart = newCart.toList();
    notifyListeners();
  }

// Decrement
  void decrement(ItemPurchase item) {
    final newCart = _cart.map((product) =>
        product.name == item.name && product.qty > 0
            ? ItemPurchase(
                product.name, product.image, product.prix, product.qty - 1)
            : product);
    _cart = newCart.toList();
    notifyListeners();
  }

//fonction se connecter
  Future<void> loginUser(String userId, String token) async {
    _userId = userId;
    _token = token;
    notifyListeners();
  }

//fonction se deconnecter
  void logoutUser() {
    _userId = "";
    _token = "";
    notifyListeners();
  }

  double calculateTotal() {
    if (_cart.isNotEmpty) {
      _total = _cart
        .map((product) => product.qty * product.prix)
        .reduce((a, b) => a + b);
    } else {
      _total = 0;
    }
    return _total;
  }

  List<ItemPurchase> get cart => List.from(_cart);
  String get userId => _userId;
  String get token => _token;
  //statut de connection de utilisateur
  bool get isLogin => _token.isNotEmpty;
  int get total => _total.toInt();
}
