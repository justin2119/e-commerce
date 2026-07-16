# Togo Marché : Infrastructure E-commerce Flutter

Ce projet constitue une base technique robuste pour une application mobile de commerce électronique. Bien que l'objectif final soit la distribution de produits du terroir togolais (Gari, Adémè, Moringa, etc.), la phase actuelle se concentre sur la validation structurelle et l'intégration de flux de données via des APIs de test.

## 🛠 Stack Technique

- **Framework** : [Flutter](https://flutter.dev) (Null-safety)
- **Gestion d'État** : [Riverpod](https://riverpod.dev) (Utilisation de `AsyncNotifier` pour une gestion asynchrone robuste)
- **Architecture** : Clean Architecture avec pattern MVVM (Model-View-ViewModel)
- **Réseau** : [Dio](https://pub.dev/packages/dio) pour des requêtes API performantes et sécurisées
- **Persistence & Mapping** : DTOs (Data Transfer Objects) typés et immuables

## ✨ Fonctionnalités & État du Projet

- **Validation par API Mock** : L'application utilise actuellement [DummyJSON](https://dummyjson.com) pour simuler les interactions backend, permettant de valider le mapping de données complexe et la gestion d'état avant le passage en production.
- **Architecture Propre (Clean Architecture)** : Séparation stricte des responsabilités entre la couche de données, le domaine et la présentation.
- **Pattern MVVM** : Utilisation de ViewModels pour isoler la logique métier de l'interface utilisateur.
- **Mapping de Données Résilient** : Implémentation de DTOs capables de transformer des structures JSON hétérogènes (ex: conversion de listes d'images en URLs uniques) en modèles de domaine stables.
- **Prêt pour le Terroir** : Les modèles de données sont conçus pour intégrer nativement les spécificités des produits togolais (origine, type de conservation).

## 📂 Structure du Projet

L'application suit une structure modulaire basée sur la Clean Architecture :

```text
lib/
├── data/           # Sources de données et implémentations des dépôts
│   └── data_test   # Configuration des données locales de test
├── domain/         # Cœur métier (Entités, Interfaces, DTOs)
│   ├── models/     # Modèles de domaine immuables
│   ├── dto/        # Mapping et transfert de données API
│   └── repository/ # Contrats et interfaces de données
├── ui/             # Couche de présentation
│   └── viewmodel/  # Logique d'état et interaction (Riverpod)
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

Développé par Justin. Photos des produits sourcées via Wikimedia Commons pour garantir des visuels réels et une disponibilité constante.

---
*Note : Ce projet est en phase de développement technique actif, utilisant des jeux de données de test pour la validation des flux.*
