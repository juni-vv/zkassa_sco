import 'package:zkassa_sco/model/scanned_product.dart';

class ProductInformation {
  final double cost;
  final String name;
  final List<String> barcodes;
  final String sku;

  ProductInformation({
    required this.cost,
    required this.name,
    required this.barcodes,
    required this.sku,
  });

  ScannedProduct scan() {
    return ScannedProduct(cost: cost, name: name, quantity: 1);
  }
}
