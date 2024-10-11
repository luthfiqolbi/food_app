part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.transaction,
    required this.itemWidth,
  });

  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(
            right: 12,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(transaction.food?.picturePath ??
                  'https://ui-avatars.com/api/?background=random?name=${transaction.food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth - 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'Food Name',
                style: heading2,
              ),
              Row(
                children: [
                  Text(
                    "${transaction.quantity.toString()} item(s) ~ ",
                    style: greyFontStyle,
                  ),
                  Text(
                    NumberFormat.currency(
                            symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                        .format(transaction.total),
                    style: greyFontStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              displayConvertDateTime(transaction.dateTime!),
              style: heading3,
            ),
            (transaction.status == TransactionStatus.delivered)
                ? Text(
                    "Delivered",
                    style: heading2.copyWith(color: Colors.green),
                  )
                : (transaction.status == TransactionStatus.on_delivery)
                    ? Text(
                        "On Delivery",
                        style: heading2.copyWith(color: Colors.blue),
                      )
                    : (transaction.status == TransactionStatus.canceled)
                        ? Text(
                            "Canceled",
                            style: heading2.copyWith(color: Colors.red),
                          )
                        : Text(
                            "Pending",
                            style: heading2.copyWith(color: Colors.yellow),
                          ),
          ],
        ),
      ],
    );
  }
}
