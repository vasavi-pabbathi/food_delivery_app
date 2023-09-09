import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page/home_page.dart';
import '../login_page/login_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    FocusNode focusNode = FocusNode();
    return Scaffold(
      body: Column(
        children: [
          Text(PhoneNumberController.toString()),
          Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                focusNode: focusNode,
                controller: otpController,
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
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
          }, child: const Text("Generate OTP"))
        ],
      ),
    );
  }
}
