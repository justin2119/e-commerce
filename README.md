# Ecommerce Poke - Application Mobile

## Présentation du Projet
Il s'agit d'une application mobile d'e-commerce Flutter haute performance conçue avec un accent sur la **Clean Architecture**, une **Gestion d'État Robuste** (State Management) et une esthétique minimaliste **Dark UI**. Le projet implémente un stockage persistant pour le panier d'achat et les favoris de l'utilisateur, garantissant une expérience utilisateur fluide d'une session à l'autre.

## Clean Architecture
Le projet est strictement organisé en trois couches distinctes :
1. **Data Layer** : Responsable de la récupération et de la persistance des données.
   - `lib/data/repositories/` : Implémentations concrètes des repositories (Product, Cart, Favorite).
   - `lib/data/dto/` : Data Transfer Objects pour une sérialisation JSON sécurisée.
   - `lib/data/data_test.dart` : Source de données mock pour les produits de spécialité togolaise.
2. **Domain Layer** : Contient la logique métier centrale et les entités.
   - `lib/domain/models/` : Entités de base (Product).
   - `lib/domain/repositories/` : Interfaces abstraites des repositories.
   - `lib/domain/wiewmodel/provider/` : Providers Riverpod pour l'état de l'application.
3. **Presentation Layer** : Les composants de l'interface utilisateur (UI).
   - `lib/screens/` : Écrans modulaires (Home, Detail, Cart, Profile).
   - `lib/main.dart` : Point d'entrée de l'application et configuration du routage.

## Riverpod Providers
Nous implémentons plus de 5 providers Riverpod distincts pour un contrôle granulaire de l'état :
- **productsProvider** : Un FutureProvider qui récupère la liste des produits de manière asynchrone.
- **productDetailProvider** : Un Family FutureProvider pour récupérer les détails d'un produit spécifique par ID.
- **cartProvider** : Un AsyncNotifierProvider qui gère l'état persistant du panier d'achat.
- **favoriteProvider** : Un AsyncNotifierProvider gérant les articles favoris persistants de l'utilisateur.
- **productFilterProvider** : Un StateProvider gérant la recherche, le filtrage par catégorie et le tri par prix.
- **userProfileProvider** : Fournit des données de profil utilisateur fictives statiques.
- **filteredProductsProvider** : Un provider dérivé qui calcule la liste filtrée et triée en fonction des préférences actuelles de l'utilisateur.

## Caractéristiques Clés
- **Persistence** : Utilisation de `shared_preferences` avec sérialisation JSON via les DTOs.
- **Gestion des Erreurs** : Blocs try-catch robustes et gestion explicite de `FormatException` lors de l'analyse (parsing) JSON.
- **UI Design** : 
  - Bordure arrondie nulle (`0.0`) sur toutes les cartes, boutons et champs de saisie.
  - Typographie personnalisée utilisant `GoogleFonts.abel`.
  - Thème sombre profond (`#263238`) with des accents blancs contrastés.
- **Navigation** : Routage déclaratif utilisant `go_router`.

## Prise en Main
### Dépendances
- `flutter_riverpod` : Gestion d'état.
- `shared_preferences` : Persistance locale.
- `go_router` : Routage déclaratif.
- `google_fonts` : Typographie personnalisée.

### Installation
1. Cloner le repository.
2. Exécuter `flutter pub get` pour installer les dépendances.
3. Exécuter `flutter run` pour démarrer l'application.

### Exécution des Tests
Exécutez la suite de tests complète avec :
```bash
flutter test
```
La suite comprend des tests unitaires pour les repositories et des tests de widgets pour les écrans principaux.
