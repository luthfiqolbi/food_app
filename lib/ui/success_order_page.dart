part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: 'You\'ve Made Order.',
      subtitle: 'Just stay at home while we are \npreparing your meal.',
      picturePath: "assets/bike.png",
      buttonTitle1: "Order Other Foods",
      buttonTap1: () {
        Get.offAll(const MainPage());
      },
      buttonTitle2: "View My Order",
      buttonTap2: () {
        Get.offAll(MainPage(initialPage: 1));
      },
    );
  }
}
