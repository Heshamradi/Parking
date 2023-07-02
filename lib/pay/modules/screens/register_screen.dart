import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/Booking/Book_spot.dart';
import 'package:parking_app/pay/controller/cubit/payment_cubit_cubit.dart';
import 'package:parking_app/pay/modules/screens/toggle_screen.dart';
import 'package:parking_app/pay/modules/widgets/default_TextFormField.dart';
import 'package:parking_app/pay/modules/widgets/default_button.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  String nameofspot;

  RegisterScreen({super.key, 
    required  this.nameofspot,

  });
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentCubitCubit()..getAuthToken(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Payment Integration"),
            backgroundColor: Colors.purple,
          ),
          body: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
              listener: (BuildContext context, Object? state) {
            if (state is PaymentGetPaymentRequestSuccessState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ToggleScreen()));
            }
          }, builder: (context, state) {
            var cubit = PaymentCubitCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset("images/Delivery.png"),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                               // Text("FirstName:$firstNameController"),
                                Expanded(
                                    child: DefaultTextFormFiled(
                                  type: TextInputType.text,
                                  hintText: "First name",
                                  prefix: Icons.person,
                                  controller: firstNameController,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'please enter First name';
                                    }
                                    return null;
                                  },
                                )),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                    child: DefaultTextFormFiled(
                                  type: TextInputType.text,
                                  hintText: "Last name",
                                  prefix: Icons.person,
                                  controller: lastNameController,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'please enter your last name';
                                    }
                                    return null;
                                  },
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                           // Text("Firstname:$firstNameController"),
                            DefaultTextFormFiled(
                              type: TextInputType.emailAddress,
                              hintText: "email",
                              prefix: Icons.email,
                              controller: emailController,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultTextFormFiled(
                              type: TextInputType.phone,
                              hintText: "Phone",
                              prefix: Icons.phone,
                              controller: phoneController,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter Your Phone';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Price:$pricee",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.purple.shade300,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultButton(
                                backgroundColor: Colors.purple.shade300,
                                radius: 10,
                                buttonWidget: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 1.7),
                                ),
                                function: () async {
                                  if (formKey.currentState!.validate()) {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) =>  ToggleScreen()));

                                    cubit.getOrderRegistrationId(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      price: pricee.toString(),
                                    );
                                    await FirebaseFirestore.instance
                                        .collection("Spots")
                                        .doc(nameofspot)
                                        .update({"bol": false});
                                  }
                                })
                          ],
                        ))
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
