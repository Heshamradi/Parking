class ApiContest{
  // https://accept.paymob.com/api/auth/tokens
  static const String baseUrl='https://accept.paymob.com/api';
  static const String  getAuthToken='/auth/tokens';
  static const String paymentApiKey='ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8zTURJd05qUjkuZkVPMm1JYmp6Ri1qT1dwMDNVcFEteEhCQUl4YzFJeWxJcUFLOVdvQXdtRDczOFhPRmZhcENvRkVWNFRFbnBJZ1FMZHhNckdUZEFuRHlrelgyZ1NzX1E=';
  static const String getOrderId='/ecommerce/orders';
  static const String getPaymentId='/acceptance/payment_keys';
  static const String getRefCode='/acceptance/payments/pay';

    static String visaUrl =
      '$baseUrl/acceptance/iframes/734150?payment_token=$finalToken';
  // get Auth back token i want to save this token (هعرف متغير هحفظ فيه التوكين اللي جايلي)
  static String paymentFirstToken='';
  static String paymentOrderId='';
  static String finalToken='';
  static String refCode='';

  static String integrationIdCart='3411522';
  static String integrationIdKiosk='3414908';
}
class AppImages{
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}