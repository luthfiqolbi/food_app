part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user;
  File? pictureFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: "Sign Up",
      subtitle: "Find your best ever meal",
      onBackButtonPresses: () {
        Get.back();
      },
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              XFile? pickedFile = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );

              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              width: 110,
              height: 110,
              margin: const EdgeInsets.only(
                top: 26,
              ),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/photo_border.png"),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: (pictureFile != null)
                        ? FileImage(pictureFile!)
                        : const AssetImage('assets/photo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              26,
              defaultMargin,
              6,
            ),
            child: Text(
              "Name",
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
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Type Your Name",
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
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Already Have an Account?",
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
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => AddressPage(
                            user: User(
                                name: nameController.text,
                                email: emailController.text),
                            password: passwordController.text,
                            pictureFile: pictureFile!,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Continue",
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
