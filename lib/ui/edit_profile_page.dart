part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    nameController.text =
        (context.read<UserCubit>().state as UserLoaded).user.name!;
    phoneNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.phoneNumber!;
    houseNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.houseNumber!;
    addressController.text =
        (context.read<UserCubit>().state as UserLoaded).user.address!;
    cityController.text =
        (context.read<UserCubit>().state as UserLoaded).user.city!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: accentColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: darkColor,
                  ),
                ),
                child: TextField(
                  controller: nameController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: darkColor,
                  ),
                ),
                child: TextField(
                  controller: phoneNumberController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: darkColor,
                  ),
                ),
                child: TextField(
                  controller: houseNumberController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: darkColor,
                  ),
                ),
                child: TextField(
                  controller: addressController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: darkColor,
                  ),
                ),
                child: TextField(
                  controller: cityController,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 24),
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: (isLoading == true)
                    ? loadingIndicator
                    : ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          User user =
                              (context.read<UserCubit>().state as UserLoaded)
                                  .user
                                  .copyWith(
                                    name: nameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    address: addressController.text,
                                    houseNumber: houseNumberController.text,
                                    city: cityController.text,
                                  );

                          ApiReturnValue<User> result =
                              await UserService.updateProfile(user);

                          if(result.value != null){
                            context.read<UserCubit>().getUser(result.value!);
                            Get.snackbar(
                              "",
                              "",
                              backgroundColor: '2ECC71'.toColor(),
                              icon: Icon(
                                MdiIcons.checkCircleOutline,
                                color: whiteColor,
                              ),
                              titleText: Text(
                                "Update Profile Success",
                                style: heading1,
                              ),
                              messageText: Text(
                                'Your Profile has been updated',
                                style: heading3,
                              ),
                            );
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
                                "Update Profile Failed",
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

                          Get.back();
                          context.read<UserCubit>().getUser(user);

                        },
                        style: ElevatedButton.styleFrom(),
                        child: const Text('Save Profile'),
                      ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
