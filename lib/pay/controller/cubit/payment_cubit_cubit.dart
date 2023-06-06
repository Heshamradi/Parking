import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/pay/core/network/constant.dart';
import 'package:parking_app/pay/core/network/dio_helper.dart';
part 'payment_cubit_state.dart';
class PaymentCubitCubit extends Cubit<PaymentCubitState>{
  PaymentCubitCubit():super(PaymentCubitInitial());
  static PaymentCubitCubit get(context)=> BlocProvider.of(context);

  // function Auth
  Future <void> getAuthToken()async{
    emit(PaymentAuthLoadingState());
    DioHelper.postDataDio(url: ApiContest.getAuthToken,data:{
      "api_key":ApiContest.paymentApiKey,

   }).then((value) {
    ApiContest.paymentFirstToken=value.data['token'];
    print('the token${ApiContest.paymentFirstToken}');
    emit(PaymentAutSuccessState());
   }).catchError((error){
    emit(PaymentAuthErrorState());
   });
  }
  // function For order 

  Future getOrderRegistrationId({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
    })async{
      emit(PaymentGetOrderRegistrationIdLoadingState());
      DioHelper.postDataDio(
        url: ApiContest.getOrderId,
        data: {
          
  "auth_token":  ApiContest.paymentFirstToken,
  "delivery_needed": "false",
  "amount_cents": price,
  "currency": "EGP",
  "items":[]
    }).then((value)  {
      ApiContest.paymentOrderId=value.data['id'].toString();
      print('the order id${ApiContest.paymentOrderId}');
      
      getPaymentRequest(firstName: firstName, lastName: lastName, email: email, phone: phone, price: price);
      emit(PaymentGetOrderRegistrationIdSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(PaymentGetOrderRegistrationIdErorrState());
    });
    }
    Future<void>getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
    })
    async{
      emit(PaymentGetPaymentRequestLoadingState());
      DioHelper.postDataDio(url: ApiContest.getPaymentId,
      data:{
        "auth_token":  ApiContest.paymentFirstToken,
        "amount_cents": price,
        "expiration":3600,
        "order_id":ApiContest.paymentOrderId,
       
  "billing_data": {
    "apartment": "NA", 
    "email": email, 
    "floor": "NA", 
    "first_name": firstName, 
    "street": "NA", 
    "building": "NA", 
    "phone_number":phone, 
    "shipping_method": "NA", 
    "postal_code": "NA", 
    "city": "NA", 
    "country": "NA", 
    "last_name": lastName, 
    "state": "Utah"
  }, 
  "currency": "EGP", 
  "integration_id": ApiContest.integrationIdCart,
  "lock_order_when_paid": "false"
       
      } ).then((value) {
        ApiContest.finalToken= value.data['token'];
        print('Final Token${ApiContest.finalToken}');
        emit(PaymentGetPaymentRequestSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(PaymentGetPaymentRequestErrorState());

      });
    }
    Future<void> getRefCode()async{
      emit(PaymentRefCodeLoadingState());
      DioHelper.postDataDio(url: ApiContest.getRefCode,
      data: {
         "source": {
    "identifier": "AGGREGATOR", 
    "subtype": "AGGREGATOR"
  },
  "payment_token": ApiContest.finalToken,
      }
      ).then((value) {
        print('Success get ref code');
        ApiContest.refCode=value.data['id'].toString();
        emit(PaymentRefCodeSuccessState());
      }).catchError((error){
        emit(PaymentRefCodeErrorState());

      });
    }
}