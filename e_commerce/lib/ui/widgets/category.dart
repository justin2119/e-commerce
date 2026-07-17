import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/product.dart';
import 'categorie_button.dart';

class Categorie extends ConsumerWidget {
   Categorie ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Flex(
        spacing: 8,
          mainAxisSize: MainAxisSize.max,
          direction: Axis.horizontal,
        children: [
          CategorieButton(
            text: 'beauté',
            onPressed: () {
              context.push(
                  "/categorie",
                extra: "beauty"
              );
            },
          ),
          CategorieButton(
            text: 'parfums',
            onPressed: () {
              context.push(
                  "/categorie",
                  extra: "fragrances"
              );
            },
          ),
          CategorieButton(
            text: 'fourniture',
            onPressed: () {
              context.push(
                  "/categorie",
                  extra: "furniture"
              );
            },
          ),
          CategorieButton(
            text: 'épiceries',
            onPressed: () {
              context.push(
                  "/categorie",
                  extra: "groceries"
              );
            },
          ),
        ],
      ),
    );
  }
}
