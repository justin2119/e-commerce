import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../ui/favorite_products.dart';
import '../../../ui/home.dart';
import '../../../ui/products_list.dart';
import '../../../ui/profil_users.dart';
import '../../repository/product_produit_implemente.dart';
import '../../service_api/service_api.dart';

final ApiclientProvider = Provider((ref)=>ServiceApi());
final ProduitRepositoryProvider=Provider((ref)=>ProductProductImplemente(
  ref.watch(ApiclientProvider)
));
final itemListWidgetProvider=StateProvider<List<Widget>>((ref)=>[
  const ProductScreen(),
  const ProductList(),
  const FavoriteProducts(),
  const ProfilUsers()
]);

final indexProvider = StateProvider<int>((ref)=>0);