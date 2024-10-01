part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
      title: 'Other Foods are on the way',
      subtitle: 'Just stay at home while we are preparing your best food',
      picturepath: 'assets/bike.png',
      buttontap1: (){
        Get.offAll(MainPage(initialPage: 1));
      },
      buttontap2: (){},
      buttontitle1: 'View My Order',
      buttontitle2: 'View My Order',
    );
  }
}
