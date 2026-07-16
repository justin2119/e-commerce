import 'package:flutter/material.dart';

import 'categorie_button.dart';

class Categorie extends StatelessWidget {
  const Categorie ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Flex(
        spacing: 8,
          mainAxisSize: MainAxisSize.max,
          direction: Axis.horizontal,
        children: [
          CategorieButton(
            text: 'beauté',
            onPressed: () {  },
          ),
          CategorieButton(
            text: 'parfums',
            onPressed: () {  },
          ),
          CategorieButton(
            text: 'fourniture',
            onPressed: () {  },
          ),
          CategorieButton(
            text: 'épiceries',
            onPressed: () {  },
          ),
          CategorieButton(
            text: "décoration d'intérieur",
            onPressed: () {  },
          ),
          CategorieButton(
            text:"Accessoire de cuisine",
            onPressed: () {  },
          ),
          CategorieButton(
            text:"Chemises pour hommes",
            onPressed: () {  },
          ),
          CategorieButton(
            text:"chaussure pour hommes",
            onPressed: () {  },
          ),
          CategorieButton(
            text:"sac pour femme",
            onPressed: () {  },
          ),
          CategorieButton(
            text:"Robe pour femme",
            onPressed: () {  },
          ),
          CategorieButton(
            text:"Bijoux pour femmes",
            onPressed: () {  },
          ),
          CategorieButton(
            text:"Montres pour femmes",
            onPressed: () {  },
          )
        ],
      ),
    );
  }
}
