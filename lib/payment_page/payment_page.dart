import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 150,),
            Icon(Icons.check_circle,color: Colors.green,size: 200,),
            Text("Payment Successful",style: TextStyle(fontSize: 30),),
            SizedBox(height: 8,),
            Text("Thanks for ordering",style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
