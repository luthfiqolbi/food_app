part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(top: 26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/photo_border.png'),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'assets/qo.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                CustomTabBar(
                  selectedIndex: selectedIndex,
                  titles: ['In Progress', 'Past Orders'],
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
      ),
    );
  }
}
