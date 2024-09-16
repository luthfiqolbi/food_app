part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    double listItemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        //header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Food Market",
                    style: blackFontStyle1,
                  ),
                  Text(
                    "Let's get some food",
                    style: blackFontStyle2,
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/qo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        //card food
        Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: defaultMargin,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: Foods.map((food) => Padding(
                  padding: EdgeInsets.only(
                      left: (food == Foods.first) ? defaultMargin : 0,
                      right: defaultMargin),
                  child: FoodCard(
                    food: food,
                  ),
                )).toList(),
          ),
        ),
        //tab layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTabBar(
                selectedIndex: selectedIndex,
                titles: [
                  'New Taste',
                  'Popular',
                  'Recommended',
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 20,),
              Builder(builder: (_) {
                List<Food> foods = (selectedIndex == 0)
                    ? Foods
                    : (selectedIndex == 1)
                        ? []
                        : [];
                return Column(
                  children: foods
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FoodListItem(
                            food: e,
                            itemwidth: listItemWidth,
                          ),
                        ),
                      )
                      .toList(),
                );
              }),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ],
    );
  }
}
