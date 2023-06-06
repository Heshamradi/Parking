import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/pay/controller/cubit/payment_cubit_cubit.dart';
import 'package:parking_app/pay/core/network/constant.dart';
import 'package:parking_app/pay/modules/screens/ref_code.dart';
import 'package:parking_app/pay/modules/screens/visa_screen.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentCubitCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Toggle Screen "),
            centerTitle: true,
          ),
          body: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
              listener: (context, state) {
            if (state is PaymentRefCodeSuccessState) {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const ReferenceScreen()));
            }
          }, builder: (context, state) {
            var cubit = PaymentCubitCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: (() {
                      cubit.getRefCode();
                    }),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Image.network(AppImages.refCodeImage),
                    ),
                  )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap:() {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context)=>const VisaScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Image.network(AppImages.visaImage),
                    ),
                  )),
                ],
              ),
            );
          }),
        ));
  }
}
