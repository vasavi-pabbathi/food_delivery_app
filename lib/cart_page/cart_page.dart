import 'package:flutter/material.dart';
import 'package:food_delivery/food_items/food_items.dart';
import 'package:food_delivery/payment_page/payment_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    int cost = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back,color: Colors.black,),),
        title: const Text(
          "FOOD Truck",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: cartData.isNotEmpty ?Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartData.length,
              itemBuilder: (context, index) {
                return  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FoodItems()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.orange.shade50,
                      elevation: 2,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(cartData[index].image,height: 100,width: 100,),
                          ),
                          const SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartData[index].name),
                              Text(cartData[index].price.toString()),
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    setState(() {
                                     cartData[index].quantity++;
                                     for(int i = 0; i< cartData[index].quantity ; i++){
                                       cost = cost+cartData[index].quantity;
                                     }
                                    });
                                  }, icon: const Icon(Icons.add,color: Colors.orange,)),
                                  Text(cartData[index].quantity.toString()),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      if(cartData[index].quantity > 1){
                                        cartData[index].quantity--;
                                      }else {
                                        cartData.removeAt(index);
                                      }
                                    });
                                  }, icon: const Icon(Icons.remove,color: Colors.orange,)),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(width: 45,),
                          IconButton(onPressed: (){
                    AlertDialog alert = AlertDialog(
                      title: const Text("Do you really want to remove this item from your cart?"),
                      actions: [
                        ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange
                          ),
                            onPressed: (){cartData.removeAt(index);
                            Navigator.pop(context);
                            }, child: const Text("yes")),
                        const SizedBox(width: 40,),
                        ElevatedButton(
                            style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange
                            ),
                            onPressed: (){Navigator.pop(context);}, child: const Text("No")),
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                },icon: const Icon(Icons.delete,color: Colors.orange,))
                        ],
                      ),
                    ),
                  ),
                );
              },),
           ElevatedButton(
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.orange
             ),
               onPressed: (){
              setState(() {
                for(int i = 0; i<cartData.length; i++){
                  for(int j = 0; j<cartData[i].quantity; j++){
                    cost = cartData[j].quantity * cartData[j].price;

                  }
                }
              });
              AlertDialog alert =AlertDialog(
                content:Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0,top: 15,bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                children:  [
                                  const Text("Amount:",style: TextStyle(fontSize: 18),),
                                  const SizedBox(width: 20,),
                                  Text("$cost",style: TextStyle(fontSize: 18))
                                ],
                              ),
                              Row(
                                children: const [
                                  Text("Packing:",style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 20,),
                                  Text("15",style: TextStyle(fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text("Delivery:",style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 20,),
                                  Text("50",style: TextStyle(fontSize: 18)),
                                ],
                              ),
                              const Divider(thickness: 2,),
                              Row(
                                children:  [
                                  Text("Total:",style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 20,),
                                  Text("${cost+65}",style: TextStyle(fontSize: 18))
                                ],
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                ),
                actions: [ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange
                  ),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));}, child: Text("OK"))],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
               }, child: const Text("Proceed To Pay"))
          ],
        ) : Column(
          children: const [
            SizedBox(height: 250,),
            Center(child: Text("No Items Are Added To Cart",style: TextStyle(fontSize: 20),)),
          ],
        ),
      ),
    );
  }
}

