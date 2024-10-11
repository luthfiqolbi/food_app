part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: "Sign In",
      subtitle: "Find your best ever meal",
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              26,
              defaultMargin,
              6,
            ),
            child: Text(
              "Email Address",
              style: heading2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Type Your Email Address",
                hintStyle: greyFontStyle,
                border: InputBorder.none,
              ),
              style: heading3,
              cursorColor: whiteColor,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              10,
              defaultMargin,
              6,
            ),
            child: Text(
              "Password",
              style: heading2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Type Your Password",
                hintStyle: greyFontStyle,
                border: InputBorder.none,
              ),
              style: heading3,
              cursorColor: whiteColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SignUpPage());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Create an Account",
                    style: heading3.copyWith(
                      color: secondaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: secondaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: defaultMargin),
                  child: isLoading
                      ? loadingIndicator
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            await context.read<UserCubit>().signIn(
                                  emailController.text,
                                  passwordController.text,
                                );
                            UserState state = context.read<UserCubit>().state;

                            if (state is UserLoaded) {
                              context.read<FoodCubit>().getFoods();
                              context
                                  .read<TransactionCubit>()
                                  .getTransactions();

                              Get.to(() => MainPage());
                            } else {
                              Get.snackbar(
                                "",
                                "",
                                backgroundColor: "D9435E".toColor(),
                                icon: Icon(
                                  MdiIcons.closeCircleOutline,
                                  color: whiteColor,
                                ),
                                titleText: Text(
                                  "Sign In Failed",
                                  style: heading1,
                                ),
                                messageText: Text(
                                  "Please try again later",
                                  style: heading3,
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Sign In",
                            style: heading3,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
