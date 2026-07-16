# Togo Marché : Infrastructure E-commerce Flutter

Togo Marché est une application mobile de commerce électronique moderne, conçue avec une architecture robuste pour la distribution de produits du terroir togolais. Le projet met l'accent sur la performance, la testabilité et une expérience utilisateur fluide.

## 🚀 Fonctionnalités Clés

- **Catalogue Dynamique** : Navigation par catégories et recherche en temps réel.
- **Détails Produits** : Fiches détaillées avec animations Hero et vues Slivers.
- **Thématisation** : Support complet du mode clair et sombre (Light/Dark mode).
- **Navigation Avancée** : Routage déclaratif avec GoRouter et gestion de l'état de la navigation (StatefulShellRoute).
- **Architecture Propre** : Séparation stricte des responsabilités (Data, Domain, UI).
- **Adaptivité** : Interface responsive s'adaptant aux mobiles et tablettes.
- **Formulaires Validés** : Système de feedback avec validation côté client.

## 🛠 Stack Technique

- **Framework** : [Flutter](https://flutter.dev) (Null-safety)
- **Gestion d'État** : [Riverpod](https://riverpod.dev) (AsyncNotifier, StateProvider, StateNotifier)
- **Routage** : [GoRouter](https://pub.dev/packages/go_router)
- **Architecture** : Clean Architecture + MVVM
- **Réseau** : [Dio](https://pub.dev/packages/dio)
- **Linter** : Configuration personnalisée via `analysis_options.yaml`

## 📂 Structure du Projet

```text
lib/
├── data/           # Sources de données (Local/Remote)
├── domain/         # Logique métier (Modèles, DTOs, Repositories, Providers)
│   ├── models/     # Entités immuables
│   ├── dto/        # Objets de transfert de données
│   └── wiewmodel/  # Logique d'état (Riverpod Notifiers)
├── ui/             # Couche présentation
│   ├── widgets/    # Composants UI réutilisables (ProductCard, CategoryChip)
│   └── screens/    # Écrans principaux (Home, Detail, Feedback)
└── main.dart       # Point d'entrée
test/               # Tests Unitaires et Widget Tests
```

## 🧪 Tests

Le projet inclut une suite de tests pour garantir la stabilité :
- **Tests Unitaires** : Validation de la logique métier (ex: ThemeNotifier).
- **Widget Tests** : Vérification du rendu et de l'interaction (ex: FeedbackForm).

Lancer les tests :
```bash
flutter test
```

## 📦 Installation & Setup

1. **Clonage** :
   ```bash
   git clone https://github.com/justin2119/e-commerce.git
   ```
2. **Dépendances** :
   ```bash
   flutter pub get
   ```
3. **Exécution** :
   ```bash
   flutter run
   ```

---
*Note : Développé par Justin. Photos sourcées via Wikimedia Commons.*
