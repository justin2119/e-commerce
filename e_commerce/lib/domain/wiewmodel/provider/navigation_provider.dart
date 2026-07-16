import 'package:flutter_riverpod/flutter_riverpod.dart';

// Gère l'index de la page active pour la navigation principale
final navIndexProvider = StateProvider<int>((ref) => 0);
