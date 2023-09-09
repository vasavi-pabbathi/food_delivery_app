import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/cart_page/cart_page.dart';
import 'package:food_delivery/food_items/food_items.dart';

import '../model/resturant_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<RestaurantsModel> restaurant = [
RestaurantsModel("https://res.cloudinary.com/hz3gmuqw6/image/upload/c_fill,q_auto,w_750/f_auto/tk-traditional-indian-foods-to-taste-in-2022-phpEXAXNS", "Celebrations", 4, "Magunta Layout "),
      RestaurantsModel("https://fastly.picsum.photos/id/292/3852/2556.jpg?hmac=cPYEh0I48Xpek2DPFLxTBhlZnKVhQCJsbprR-Awl9lo", "United Kitchens", 5, "SraswathiNagar")
    ];
    return WillPopScope(
      onWillPop: ()async { return false; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("FOOD TRUCK",style: TextStyle(color: Colors.black),),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
            }, icon: const Icon(Icons.shopping_cart,color: Colors.orange,))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                return  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FoodItems()));
                  },
                  child: Card(
                    elevation: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(restaurant[index].image,height: 100,width: 100,),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(restaurant[index].name),
                            Text(restaurant[index].location),
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.orange,),
                                Icon(Icons.star,color: Colors.orange,),
                                Icon(Icons.star,color: Colors.orange,),
                                Icon(Icons.star,color: Colors.orange,),
                                Icon(Icons.star_border_rounded,color: Colors.orange,),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },)
            ],
          ),
        ),
      ),
    );
  }


}
