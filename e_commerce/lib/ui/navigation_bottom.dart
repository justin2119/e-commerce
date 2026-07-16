import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/wiewmodel/provider/provider.dart';

class NavigationBottom extends ConsumerStatefulWidget {
  const NavigationBottom({super.key});

  @override
  ConsumerState<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends ConsumerState<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    final IndexProvider=ref.watch(indexProvider);
    final pages=ref.watch(itemListWidgetProvider);
    return Scaffold(
      body: pages[IndexProvider],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: IndexProvider,
        onTap: (index){
          ref.read(indexProvider.notifier).state=index;
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste des produits"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoris"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
