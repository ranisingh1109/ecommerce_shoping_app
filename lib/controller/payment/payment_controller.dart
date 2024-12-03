import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  var isPaymentSuccessful = false.obs;

  final Razorpay _razorpay = Razorpay();

  @override
  void onInit() {
    super.onInit();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  void onClose() {
    super.onClose();
    _razorpay.clear();
  }
  void processPayment(double totalPrice) {
    var options = {
      'key': 'your_razorpay_key',
      'amount': (totalPrice * 100).toString(),
      'name': 'Your App Name',
      'description': 'Payment for Cart Items',
      'prefill': {
        'contact': 'your_user_phone',
        'email': 'your_user_email',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success: ${response.paymentId}');
    isPaymentSuccessful.value = true;
    Get.snackbar("Payment Success", "Payment was successful!");
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Failed: ${response.message}');
    isPaymentSuccessful.value = false;
    Get.snackbar("Payment Failed", "Something went wrong: ${response.message}");
  }
}
