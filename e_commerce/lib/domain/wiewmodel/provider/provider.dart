import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/product_produit_implemente.dart';
import '../../service_api/service_api.dart';

final ApiclientProvider=Provider((ref)=>ServiceApi());
final ProduitRepositoryProvider=Provider((ref)=>ProductProductImplemente(
  ref.watch(ApiclientProvider)
));