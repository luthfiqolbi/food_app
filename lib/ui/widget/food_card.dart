part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    this.food,
  });

  final Food? food;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: darkColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 0,
            offset: const Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(food?.picturePath ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  food?.name ?? 'This is food',
                  style: heading2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                RatingStar(
                  rate: food?.rate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
