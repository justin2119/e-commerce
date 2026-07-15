import 'dart:convert';
import '../domain/models/product.dart';

const String rawProductsJson = '''
[
  {
    "id": "1",
    "name": "Gari (Fin)",
    "description": "Farine de manioc fermentée et râpée traditionnelle du Togo. Indispensable pour de nombreux plats ouest-africains.",
    "price": 1500.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/7/75/Bowl_of_Fermented_Cassava_Flour_%28Garri%29.jpg",
    "categoryId": "tubercules_derives",
    "origin": "Togo (Région Maritime)",
    "conservationType": "Sec / Ambiant"
  },
  {
    "id": "2",
    "name": "Feuilles d'Adémè Fraîches",
    "description": "Feuilles fraîches de Corchorus olitorius, utilisées pour préparer la célèbre sauce Adémè togolaise.",
    "price": 500.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/5/5e/Ademe.JPG",
    "categoryId": "legumes",
    "origin": "Togo (Lomé)",
    "conservationType": "Frais / Réfrigéré"
  },
  {
    "id": "3",
    "name": "Poudre de Moringa",
    "description": "Poudre de feuilles de Moringa oleifera pure et biologique, riche en vitamines et minéraux.",
    "price": 2500.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/2/23/Moringa_leaves_powder.jpg",
    "categoryId": "superaliments",
    "origin": "Togo (Région des Plateaux)",
    "conservationType": "Sec / Poudre"
  },
  {
    "id": "4",
    "name": "Lanhoin (Poisson Fermenté)",
    "description": "Poisson salé et fermenté traditionnel togolais utilisé comme exhausteur de goût naturel puissant dans les soupes.",
    "price": 1200.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/a/a2/Assorted_fish.jpg",
    "categoryId": "produits_halieutiques",
    "origin": "Togo (Aného)",
    "conservationType": "Salé / Fermenté"
  },
  {
    "id": "5",
    "name": "Huile Rouge Togolaise (Huile de Palme)",
    "description": "Huile de palme naturelle non raffinée, extraite selon des méthodes traditionnelles.",
    "price": 3000.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/8/82/Palm_Oil_%28Red_Oil%29.jpg",
    "categoryId": "huiles",
    "origin": "Togo (Région Centrale)",
    "conservationType": "Liquide / Ambiant"
  },
  {
    "id": "6",
    "name": "Igname (Pona)",
    "description": "Igname Pona de haute qualité, connue pour son goût sucré et sa texture excellente une fois bouillie ou frite.",
    "price": 4500.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/d/df/Yam_%28Dioscorea_rotundata%29_tubers.jpg",
    "categoryId": "tubercules",
    "origin": "Togo (Région de la Kara)",
    "conservationType": "Frais / Lieu Sec et Frais"
  },
  {
    "id": "7",
    "name": "Feuilles de Gboma",
    "description": "Feuilles d'aubergine africaine (Solanum aethiopicum), un légume vert essentiel pour les sauces traditionnelles.",
    "price": 400.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/d/de/Solanum_aethiopicum.jpg",
    "categoryId": "legumes",
    "origin": "Togo (Région Maritime)",
    "conservationType": "Frais / Réfrigéré"
  },
  {
    "id": "8",
    "name": "Tomates Locales (Gboébessé)",
    "description": "Petites tomates locales savoureuses et charnues, idéales pour les sauces fraîches et les ragoûts.",
    "price": 800.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/8/88/Bright_red_tomato_and_cross_section02.jpg",
    "categoryId": "legumes",
    "origin": "Togo (Région Maritime)",
    "conservationType": "Frais / Ambiant"
  },
  {
    "id": "9",
    "name": "Gombo Frais (Okra)",
    "description": "Gombos tendres et frais, utilisés pour donner une texture onctueuse aux sauces.",
    "price": 600.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/c/c9/Okra_fruit.jpg",
    "categoryId": "legumes",
    "origin": "Togo (Région des Savanes)",
    "conservationType": "Frais / Réfrigéré"
  },
  {
    "id": "10",
    "name": "Papaye Solo",
    "description": "Papaye locale sucrée et parfumée, riche en vitamines A et C.",
    "price": 1200.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/d/d4/Papaya_-_longitudinal_section_close-up_view.jpg",
    "categoryId": "fruits",
    "origin": "Togo (Région des Plateaux)",
    "conservationType": "Frais / Ambiant"
  },
  {
    "id": "11",
    "name": "Mangues Greffées",
    "description": "Mangues charnues et sans fibres, récoltées à maturité pour une saveur optimale.",
    "price": 1500.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/a/a2/Mango_-_single.jpg",
    "categoryId": "fruits",
    "origin": "Togo (Région Maritime)",
    "conservationType": "Frais / Ambiant"
  },
  {
    "id": "12",
    "name": "Bananes Douces",
    "description": "Petites bananes locales très sucrées, parfaites pour le dessert ou le goûter.",
    "price": 1000.0,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/b/ba/Banana-Single.jpg",
    "categoryId": "fruits",
    "origin": "Togo (Région des Plateaux)",
    "conservationType": "Frais / Ambiant"
  }
]
''';

final List<Product> testProducts = (json.decode(rawProductsJson) as List)
    .map((data) => Product.fromJson(data))
    .toList();
