class ScannedProduct {
  final double cost;
  final String name;
  int quantity;

  ScannedProduct({
    required this.cost,
    required this.name,
    required this.quantity,
  });
  ScannedProduct withQuantity(int newQuantity) {
    return ScannedProduct(cost: cost, name: name, quantity: newQuantity);
  }
}
