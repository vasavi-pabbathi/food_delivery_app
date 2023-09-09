class FoodItemsModel {
  String image;
  String name;
  int ratings;
  int price;
  int quantity;
  FoodItemsModel(this.image, this.name, this.ratings, this.price, this.quantity);
  @override
  String toString() {
    return 'restaurant: image= $image, name= $name, ratings= $ratings, price=$price, quantity=$quantity';
  }
}