import 'package:flutter/material.dart';
import 'package:food_delivery/home_page/home_page.dart';
import 'package:food_delivery/otp_page/otp_page.dart';

TextEditingController PhoneNumberController = TextEditingController();
TextEditingController otpController = TextEditingController();
FocusNode focusNode = FocusNode();

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            SizedBox(width: 20,),
            Text(
              "FOOD TRUCK",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Image.network(
                "https://cdn.dribbble.com/users/1365713/screenshots/5381232/media/86983d424b8126d974d6a768e2f15568.png",height: 150,width: 150, ),
              const SizedBox(height: 30,),
              Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    //maxLength: 10,
                    focusNode: focusNode,
                    controller: PhoneNumberController,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Manrope-VariableFont'),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Phone Number',
                      hintText: 'Enter Your Mobile Number',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                  onPressed: () {
                AlertDialog alert = AlertDialog(
                  title:SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextFormField(
                                //maxLength: 4,
                                focusNode: focusNode,
                                controller: otpController,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Manrope-VariableFont'),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'OTP',
                                  hintText: 'Enter Otp',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange
                        ),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));}, child: const Text("Next")),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
                }, child: const Text("Generate OTP"))
            ],
          ),
        ),
      ),
    );
  }
}
