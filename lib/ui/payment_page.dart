part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPresses: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Orders',
                  style: heading3.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.transaction.food!.picturePath!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189,
                          child: Text(
                            widget.transaction.food!.name!,
                            style: heading2,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            decimalDigits: 0,
                            locale: 'id_ID',
                            symbol: 'IDR ',
                          ).format(widget.transaction.food!.price),
                          style: heading3,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${widget.transaction.quantity} item(s)',
                        style: greyFontStyle.copyWith(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: whiteColor,
                ),
                Text(
                  'Details Transaction',
                  style: heading3.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      widget.transaction.food!.name!,
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction.food!.price),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      "${widget.transaction.quantity.toString()} item(s)",
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Sub Total',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 0,
                        locale: 'id_ID',
                        symbol: 'IDR ',
                      ).format(
                        widget.transaction.food!.price! *
                            widget.transaction.quantity!,
                      ),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: whiteColor,
                ),
                Row(
                  children: [
                    Text(
                      'Tax 10%',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(50000),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Driver',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(50000),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: whiteColor,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(
                        widget.transaction.total! +
                            (widget.transaction.food!.price! *
                                widget.transaction.quantity! *
                                0.1) +
                            50000,
                      ),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultMargin,
                ),
                Divider(
                  thickness: 1,
                  color: whiteColor,
                ),
                Text(
                  "Deliver to:",
                  style: heading3,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Name Receiver:',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction.user!.name!,
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Email Receiver:',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction.user!.email!,
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Phone Number:',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction.user!.phoneNumber!,
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Address:',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction.user!.address!,
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'House Number:',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction.user!.houseNumber!,
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'City:',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      widget.transaction.user!.city!,
                      style: heading3,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  height: 25,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      String? paymentUrl = await context
                          .read<TransactionCubit>()
                          .submitTransaction(
                            widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: (widget.transaction.total! * 1.1 + 50000)
                                  .toInt(),
                            ),
                          );

                      if (paymentUrl != null) {
                        Get.to(PaymentMethodPage(paymentUrl: paymentUrl));
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
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Order Now',
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
