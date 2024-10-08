part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<TransactionCubit>().getTransaction();
      },
      color: MainColor,
      child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (_, state) {
          if (state is TransactionLoaded) {
            if (state.transaction.length == 0) {
              return IlustrationPage(
                title: 'Ouch! Hungry',
                subtitle: 'Seems like you have not\nordered any food yet',
                picturepath: 'assets/food_wishes.png',
                buttontitle1: 'find foods',
                buttontap1: () {},
              );
            } else {
              double listItemWidth =
                  MediaQuery.of(context).size.width - 2 * defaultMargin;

              return ListView(
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
                        Builder(builder: (_) {
                          List<Transaction> transactions = (selectedIndex == 0
                              ? state.transaction
                                  .where((e) =>
                                      e.status == TransactionStatus.on_delivery ||
                                      e.status == TransactionStatus.pending)
                                  .toList()
                              : state.transaction
                                  .where((e) =>
                                      e.status == TransactionStatus.canceled ||
                                      e.status == TransactionStatus.delivered)
                                  .toList());
                          return Column(
                            children: transactions
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: OrderListItem(
                                        transaction: e,
                                        itemWidth: listItemWidth,
                                      ),
                                    ))
                                .toList(),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              );
            }
          } else {
            return Center(
              child: loadingIndicator,
            );
          }
        },
      ),
    );
  }
}
