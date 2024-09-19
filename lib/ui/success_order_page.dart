part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
      title: 'You,ve made Order',
      subtitle: 'Just stay at home while we are preparing your best food',
      picturepath: 'assets/bike.png',
      buttontap1: (){},
      buttontitle1: 'View My Order',
      buttontap2: (){},
      buttontitle2: 'View My Order',
    );
  }
}
