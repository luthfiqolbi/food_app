part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({
    super.key,
    required this.user,
    required this.password,
    required this.pictureFile,
  });

  final User user;
  final String password;
  final File pictureFile;

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  bool isLoading = false;
  List<String>? cities;
  String? selectedCity;

  @override
  void initState() {
    cities = ['Bandung', 'Jakarta', 'Surabaya'];
    selectedCity = cities![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: "Address",
      subtitle: "Make sure it's valid",
      onBackButtonPresses: () {
        Get.back();
      },
      child: Column(
        children: [
          // text address
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Address",
              style: heading2,
            ),
          ),
          // field addredd
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type Your Address",
                hintStyle: greyFontStyle,
              ),
              style: heading3,
              cursorColor: whiteColor,
            ),
          ),
          // text phone number
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "Phone Number",
              style: heading2,
            ),
          ),
          // field phone number
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type Your Phone Number",
                hintStyle: greyFontStyle,
              ),
              style: heading3,
              cursorColor: whiteColor,
            ),
          ),
          // text house number
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "House Number",
              style: heading2,
            ),
          ),
          // field house number
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: TextField(
              controller: houseNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type Your House Number",
                hintStyle: greyFontStyle,
              ),
              style: heading3,
              cursorColor: whiteColor,
            ),
          ),
          // text city
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "City",
              style: heading2,
            ),
          ),
          // city dropdown
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: whiteColor,
              ),
            ),
            child: DropdownButton(
              value: selectedCity,
              items: cities!
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: heading3,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor: darkColor,
              style: heading3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                child: (isLoading == true)
                    ? loadingIndicator
                    : ElevatedButton(
                        onPressed: () async {
                          User user = widget.user.copyWith(
                            address: addressController.text,
                            phoneNumber: phoneNumberController.text,
                            houseNumber: houseNumberController.text,
                            city: selectedCity,
                          );

                          setState(() {
                            isLoading = true;
                          });

                          // Simulasi penundaan (hanya untuk pengujian, bisa dihapus)
                          await Future.delayed(const Duration(seconds: 2));

                          // memanggil fungsi signup
                          await context.read<UserCubit>().signUp(
                                user,
                                widget.password,
                                pictureFile: widget.pictureFile,
                              );

                          // mendapatkan state setelah signup
                          UserState state = context.read<UserCubit>().state;

                          // memeriksa stutus
                          if (state is UserLoaded) {
                            context.read<FoodCubit>().getFoods();
                            context.read<TransactionCubit>().getTransactions();
                            Get.to(() => MainPage());
                          } else {
                            Get.snackbar(
                              "",
                              "",
                              backgroundColor: Colors.black,
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: whiteColor,
                              ),
                              titleText: Text(
                                "Sign In Failed",
                                style: heading1,
                              ),
                              messageText: Text(
                                'Please Try Again Later',
                                style: heading3,
                              ),
                            );
                          }

                          setState(() {
                            isLoading = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Create Account",
                          style: heading3,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
