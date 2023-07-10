import 'package:WHATSAPP/verify_no.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signupform extends StatefulWidget {
  const Signupform({super.key});
  @override
  State<Signupform> createState() => _SignupformState();
}

class _SignupformState extends State<Signupform> {
  final _formkey = GlobalKey<FormState>();
  final _phoneTC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text("Verify your Phone number",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          const Text(
              "  Whatsapp will send an SMS message(carrier\nchanges may apply) to verify your phone number.\n   Enter your country code and phone number",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 70,
          ),
          Container(
            child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        height: 100,
                        child: IntlPhoneField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneTC,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                          onChanged: (value) {
                            _formkey.currentState!.save();
                          },
                          decoration: InputDecoration(
                            label: const Text(
                              'Phone',
                              style: TextStyle(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          print(_phoneTC.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => verify(
                                        phone: _phoneTC.text,
                                      )));
                        },
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.adaptive.arrow_forward,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
