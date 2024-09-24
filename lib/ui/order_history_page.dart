part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inProgess = mockTransaction
      .where((e) =>
          e.status == TransactionStatus.on_delivery ||
          e.status == TransactionStatus.pending)
      .toList();
  List<Transaction> past = mockTransaction
      .where((e) =>
          e.status == TransactionStatus.canceled ||
          e.status == TransactionStatus.delivered)
      .toList();

  @override
  Widget build(BuildContext context) {

    double listItemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;

    return (inProgess.length == 0 && past.length == 0)
        ? IlustrationPage(
            title: 'Ouch! Hungry',
            subtitle: 'Seems like you have not\nordered any food yet',
            picturepath: 'assets/food_wishes.png',
            buttontitle1: 'find foods',
            buttontap1: () {})
        : ListView(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  bottom: defaultMargin,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 15,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Orders',
                      style: blackFontStyle2,
                    ),
                    Text(
                      'Wait for the best meal',
                      style: blackFontStyle3.copyWith(color: greyColor),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(
                      selectedIndex: selectedIndex,
                      titles: ['In Progess', 'Past Orders'],
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: (selectedIndex == 0 ? inProgess : past)
                          .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OrderListItem(
                                transaction: e,
                                itemWidth: listItemWidth,
                            ),
                          ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
