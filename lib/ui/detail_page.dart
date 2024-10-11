part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.onBackButtonPressed,
    this.transaction,
  });

  final Function onBackButtonPressed;
  final Transaction? transaction;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: darkColor,
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.transaction!.food!.picturePath ??
                      'https://ui-avatars.com/api/?name=${widget.transaction!.food!}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.onBackButtonPressed != null)
                          widget.onBackButtonPressed!();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white12,
                        ),
                        child: Image.asset('assets/back_arrow_white.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 180),
                  padding: const EdgeInsets.symmetric(
                    vertical: 26,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: "272727".toColor(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.transaction!.food!.name}",
                                  style: heading2,
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                RatingStar(
                                  rate: widget.transaction!.food!.rate,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_min.png'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: heading3.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(999, quantity + 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_add.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 14, 0, 16),
                        child: Text(
                          widget.transaction!.food!.description!,
                          style: heading3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Ingredients ',
                            style: heading3,
                          ),
                          Icon(
                            Icons.info,
                            color: mainColor,
                            size: 20,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 4, 0, 16),
                        child: Text(
                          widget.transaction!.food!.ingredient!,
                          style: heading3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Total Price ',
                                  style: heading3,
                                ),
                                Icon(
                                  Icons.monetization_on,
                                  color: mainColor,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              NumberFormat.currency(
                                symbol: 'IDR ',
                                decimalDigits: 0,
                                locale: 'id_ID',
                              ).format(
                                quantity * widget.transaction!.food!.price!,
                              ),
                              style: heading3,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(
                              PaymentPage(
                                transaction: widget.transaction!.copyWith(
                                  quntity: quantity,
                                  total: quantity *
                                      (widget.transaction!.food!.price!
                                          .toInt()),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Order Now',
                            style: heading2,
                          ),
                        ),
                      ),
                    ],
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
