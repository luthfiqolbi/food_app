part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
        title: 'Yeay! Completed',
        subtitle: 'Now you are able to order\nsome foods as a self-reward',
        picturepath: 'assets/food_wishes.png',
        buttontitle1: 'Find Foods',
        buttontap1: (){},
    );
  }
}
