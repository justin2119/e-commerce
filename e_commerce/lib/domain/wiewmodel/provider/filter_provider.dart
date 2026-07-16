import 'package:flutter_riverpod/flutter_riverpod.dart';

// Gère le texte de recherche
final searchQueryProvider = StateProvider<String>((ref) => "");

// Gère la catégorie sélectionnée (null = toutes)
final selectedCategoryProvider = StateProvider<String?>((ref) => null);
