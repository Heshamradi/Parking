
part of 'payment_cubit_cubit.dart';
@immutable 


abstract class PaymentCubitState{}
class PaymentCubitInitial extends PaymentCubitState{

}
class PaymentAuthLoadingState extends PaymentCubitState{}
class PaymentAutSuccessState extends PaymentCubitState{}
class PaymentAuthErrorState extends PaymentCubitState{}
class PaymentGetOrderRegistrationIdLoadingState extends PaymentCubitState{}
class PaymentGetOrderRegistrationIdSuccessState extends PaymentCubitState{}
class PaymentGetOrderRegistrationIdErorrState extends PaymentCubitState{}
class PaymentGetPaymentRequestLoadingState extends PaymentCubitState{}
class PaymentGetPaymentRequestSuccessState extends PaymentCubitState{}
class PaymentGetPaymentRequestErrorState extends PaymentCubitState{}
class PaymentRefCodeLoadingState extends PaymentCubitState{}
class PaymentRefCodeSuccessState extends PaymentCubitState{}
class PaymentRefCodeErrorState extends PaymentCubitState{}