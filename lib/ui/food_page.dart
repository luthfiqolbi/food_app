part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<FoodCubit>().getFoods();
    super.initState();
  }

  void onRefresh() {
    context.read<FoodCubit>().getFoods();
  }

  @override
  Widget build(BuildContext context) {
    double listWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        // header
        Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          color: darkColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Food Market.",
                    style: heading1,
                  ),
                  Text(
                    "Let's obtain some food.",
                    style: heading2,
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath ??
                          "http://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded).user.name}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 220,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: defaultMargin,
          ),
          child: BlocBuilder<FoodCubit, FoodState>(
              builder: (_, state) => (state is FoodLoaded)
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.food
                          .map(
                            (food) => Padding(
                              padding: EdgeInsets.only(
                                  left: food == state.food.first
                                      ? defaultMargin
                                      : 0,
                                  right: defaultMargin),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailPage(
                                      onBackButtonPressed: () {
                                        Get.back();
                                      },
                                      transaction: Transaction(
                                        food: food,
                                        user: (context.read<UserCubit>().state
                                                as UserLoaded)
                                            .user,
                                      ),
                                    ),
                                  )!
                                      .then((value) {
                                    onRefresh();
                                  });
                                },
                                child: FoodCard(
                                  food: food,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : const Center()),
        ),
        Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              Tabbar(
                selectedIndex: selectedIndex,
                titles: const ["New Taste", "Popular", "Recommended"],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) {
                  if (state is FoodLoaded) {
                    List<Food> foods = state.food
                        .where(
                          (e) => e.types!.contains(
                            (selectedIndex == 0)
                                ? FoodType.newFood
                                : (selectedIndex == 1)
                                    ? FoodType.popularFood
                                    : FoodType.recommended,
                          ),
                        )
                        .toList();
                    return Column(
                      children: foods
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailPage(
                                    onBackButtonPressed: () {
                                      Get.back();
                                    },
                                    transaction: Transaction(
                                      food: e,
                                      user: (context.read<UserCubit>().state
                                              as UserLoaded)
                                          .user,
                                    ),
                                  ),
                                )!
                                    .then((value) {
                                  onRefresh();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FoodListItem(
                                  food: e,
                                  itemWidth: listWidth,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        )
      ],
    );
  }
}
