import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/panier.dart';
import '../../models/product.dart';

class CartNotifier extends Notifier<List<CartItem>> {
  /// État initial du panier.
  /// Au démarrage, le panier est vide.
  @override
  List<CartItem> build() {
    return [];
  }

  /// Ajouter un produit au panier.
  void addToCart(Product product) {
    // Recherche si le produit existe déjà.
    final index = state.indexWhere((item) => item.product.id == product.id);

    // Si le produit existe déjà,
    // on augmente simplement sa quantité.
    if (index != -1) {
      final cartItem = state[index];

      final updatedItem = cartItem.copyWith(quantity: cartItem.quantity + 1);

      // Mise à jour immutable de l'état.
      state = [
        ...state.sublist(0, index),
        updatedItem,
        ...state.sublist(index + 1),
      ];
    } else {
      // Sinon on ajoute un nouvel élément.
      state = [...state, CartItem(product: product, quantity: 1)];
    }
  }

  /// Supprimer complètement un produit du panier.
  void removeFromCart(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }

  /// Augmenter la quantité d'un produit.
  void increment(Product product) {
    addToCart(product);
  }

  /// Diminuer la quantité d'un produit.
  void decrement(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    // Le produit n'existe pas.
    if (index == -1) return;

    final cartItem = state[index];

    // Si la quantité vaut 1,
    // on retire le produit du panier.
    if (cartItem.quantity == 1) {
      removeFromCart(product);
    } else {
      // Sinon on diminue simplement la quantité.
      final updatedItem = cartItem.copyWith(quantity: cartItem.quantity - 1);

      state = [
        ...state.sublist(0, index),
        updatedItem,
        ...state.sublist(index + 1),
      ];
    }
  }

  /// Vider complètement le panier.
  void clearCart() {
    state = [];
  }

  /// Retourne le nombre total d'articles
  /// présents dans le panier.
  int get totalItems {
    return state.fold(0, (sum, item) => sum + item.quantity);
  }

  /// Retourne le montant total du panier.
  double get totalPrice {
    return state.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>(
  CartNotifier.new,
);
