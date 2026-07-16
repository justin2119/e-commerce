# Togo Marché : Application E-commerce Flutter

Une application mobile moderne dédiée à la vente de fruits, légumes et produits du terroir togolais (Gari, Adémè, Moringa, etc.). Ce projet met en avant les produits locaux tout en respectant les standards de développement mobile les plus rigoureux.

## 🛠 Stack Technique

- **Framework** : [Flutter](https://flutter.dev) (Null-safety)
- **Gestion d'État** : [Riverpod](https://riverpod.dev) (Utilisation de `AsyncNotifier` pour une gestion asynchrone robuste)
- **Architecture** : Clean Architecture avec pattern MVVM (Model-View-ViewModel)
- **Réseau** : [Dio](https://pub.dev/packages/dio) pour des requêtes API performantes et sécurisées
- **Persistence & Mapping** : DTOs (Data Transfer Objects) typés et immuables

## ✨ Fonctionnalités Clés

- **Architecture Propre (Clean Architecture)** : Séparation stricte des responsabilités pour une maintenance et une testabilité optimales.
- **Pattern MVVM** : Découplage de la logique métier et de l'interface utilisateur.
- **Mapping de Données Sécurisé** : Transformation des réponses JSON en modèles de domaine via des DTOs, avec gestion sécurisée des types (ex: conversion des listes d'images d'API externes).
- **Données Locales et Distantes** : Support pour l'affichage de produits locaux togolais via des données mockées et intégration d'APIs externes (DummyJSON).
- **Immuabilité** : Utilisation systématique de `final`, `const` et de modèles immuables pour garantir la stabilité de l'état.

## 📂 Structure du Projet

L'application suit une structure modulaire basée sur la Clean Architecture :

```text
lib/
├── data/           # Implémentations concrètes (Data Sources, Repositories)
│   └── data_test   # Données mockées des produits togolais
├── domain/         # Logique métier pure (Entités, Interfaces, Use Cases)
│   ├── models/     # Modèles de domaine immuables
│   ├── dto/        # Objets de transfert de données et mapping API
│   └── repository/ # Définition des contrats de dépôt
├── ui/             # Couche de présentation
│   └── viewmodel/  # Logique de vue (Riverpod Notifiers)
└── main.dart       # Point d'entrée de l'application
```

## 🚀 Installation

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/justin2119/e-commerce.git
   ```

2. **Installer les dépendances** :
   ```bash
   cd e_commerce
   flutter pub get
   ```

3. **Lancer l'application** :
   ```bash
   flutter run
   ```

## 📜 Licence & Crédits

Développé par Justin. Photos des produits sourcées via Wikimedia Commons pour garantir des visuels réels et stables.

---
*Note : Ce projet est en cours de développement actif suivant les principes de Clean Code.*
