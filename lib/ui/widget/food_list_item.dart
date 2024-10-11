part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    super.key,
    this.food,
    this.itemWidth,
  });

  final Food? food;
  final double? itemWidth;

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
              image: NetworkImage(food?.picturePath ??
                  'https://ui-avatars.com/api/?background=random?name=${food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth! - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food?.name ?? 'Food Name',
                style: heading2,
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                    .format(food?.price),
                style: greyFontStyle,
              ),
            ],
          ),
        ),
        RatingStar(
          rate: food?.rate ?? 0,
        ),
      ],
    );
  }
}
