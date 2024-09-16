part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, this.food, this.itemwidth});

  final Food? food;
  final double? itemwidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(food!.picturePath ??
                  'https://ui-avatars.com/api/?name=${food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemwidth! - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                NumberFormat.currency(
                  symbol: 'IDR',
                  decimalDigits: 0,
                  locale: 'id-ID',
                ).format(food?.price),
              ),
              RatingStars(rate: food?.rate,)
            ],
          ),
        )
      ],
    );
  }
}
