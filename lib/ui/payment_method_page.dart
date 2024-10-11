part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({
    super.key,
    required this.paymentUrl,
  });

  final String paymentUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          launch(paymentUrl);
        }, child: Text('data')),
      )
    );
  }
}
