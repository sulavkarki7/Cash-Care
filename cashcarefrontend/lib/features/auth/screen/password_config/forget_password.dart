import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: const Text('Forget Password'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const Text(
              //   "Forget Password",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              // ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Please Enter Your Phone Number To Recieve a Verification Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextFormField(
                    validator: (value) => WwValidator.isInputEmpty(value),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        labelText: 'Enter Your Email',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //     style: const ButtonStyle(
              //         backgroundColor:
              //             MaterialStatePropertyAll<Color>(Colors.blue)),
              //     onPressed: () {},
              //     child: const Padding(
              //         padding: EdgeInsets.all(15),
              //         child: Text(
              //           "Submit",
              //           style: TextStyle(
              //               color: Colors.white, fontWeight: FontWeight.bold),
              //         ))),
              SizedBox(
                height: Get.height * 0.02,
              ),

              Container(
                width: Get.width * 0.8,
                height: Get.height * 0.05,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(Colors.blue)),
                    onPressed: () {},
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          )),
    );
  }
}
