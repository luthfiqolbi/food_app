part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, this.rate});

  final double? rate;

  @override
  Widget build(BuildContext context) {
    int? numberOfStars = rate?.round();

    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < numberOfStars!) ? MdiIcons.star : MdiIcons.starOutline,
              size: 12,
              color: MainColor,
            ),
          ) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: blackFontStyle3.copyWith(fontSize: 12),
            ),
          ],
    );
  }
}
