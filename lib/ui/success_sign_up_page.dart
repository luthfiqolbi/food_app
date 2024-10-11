part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: 'Yeay! Completed',
      subtitle: 'Now you are able to order\nsome foods as a self-reward',
      picturePath: 'assets/food_wishes.png',
      buttonTitle1: 'Find Foods',
      buttonTap1: () {},
    );
  }
}
