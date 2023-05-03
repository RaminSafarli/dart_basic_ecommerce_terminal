class Product {
  String name;
  int quantity;
  String type;
  num salePrice;
  num retailPrice;

  Product(
      this.name, this.quantity, this.type, this.salePrice, this.retailPrice) {}

  bool isExist(Product product) {
    if (this.quantity > 0) {
      return true;
    } else {
      return false;
    }
  }
}
