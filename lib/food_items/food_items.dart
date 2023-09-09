import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/food_items.dart';

import '../cart_page/cart_page.dart';

List<FoodItemsModel> cartData = [];

class FoodItems extends StatefulWidget {
  const FoodItems({Key? key}) : super(key: key);

  @override
  State<FoodItems> createState() => _FoodItemsState();
}

class _FoodItemsState extends State<FoodItems> {
  @override
  Widget build(BuildContext context) {
    List<FoodItemsModel> foodItems = [
      FoodItemsModel(
          "https://fastly.picsum.photos/id/493/3872/2592.jpg?hmac=PWm2bsTKWkChWATD_2AD0F_GNifmGvQDPMHZp2sWhk0",
          "Oats",
          2,
          300,
          1),
      FoodItemsModel(
          "https://fastly.picsum.photos/id/488/1772/1181.jpg?hmac=psl3qLyDefO6AYqU4TJQ8PNCjS8RdPiP_vRLB8WPVjY",
          "Salad",
          2,
          500,1),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.orange,
          ),
        ),
        title: Text(
          "FOOD TRUCK",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            foodItems[index].image,
                            height: 150,
                            width: 150,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foodItems[index].name),
                            SizedBox(
                              height: 3,
                            ),
                            Text("₹${foodItems[index].price.toString()}"),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star_border_rounded,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.orange.withOpacity(0.5)),
                                onPressed: () {
                                  setState(() {
                                    if (cartData.contains(foodItems[index])) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "You have already added this item to your cart"),
                                        backgroundColor: Colors.redAccent,
                                        elevation: 10, //shadow
                                      ));
                                    } else {
                                      cartData.add(foodItems[index]);
                                    }
                                    print(cartData);
                                  });
                                },
                                child: const Text("Add To Cart")),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
