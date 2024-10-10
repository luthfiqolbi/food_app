part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key, required this.paymentURL});

  final String paymentURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IlustrationPage(
        title: 'Finish Your Payment',
        subtitle: 'please select your favorite payment method',
        picturepath: 'assets/Payment.png',
        buttontitle1: 'Payment Method',
        buttontap1: () async {
          await launch(paymentURL);
        },
        buttontap2: () {
          Get.to(SuccessOrderPage());
        },
        buttontitle2: 'Continue',
      ),
    );
  }
}
