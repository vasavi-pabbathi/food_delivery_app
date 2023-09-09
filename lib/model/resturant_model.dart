class RestaurantsModel {
  String image;
  String name;
  int ratings;
  String location;
  RestaurantsModel(this.image, this.name, this.ratings, this.location);
  @override
  String toString() {
    return 'restaurant: image= $image, name= $name, ratings= $ratings, location=$location';
  }
}