part of 'pages.dart';

class IlustrationPage extends StatelessWidget {
  const IlustrationPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.picturepath,
    required this.buttontitle1,
    this.buttontitle2,
    required this.buttontap1,
    this.buttontap2,
  });

  final String title;
  final String subtitle;
  final String picturepath;

  final String buttontitle1;
  final String? buttontitle2;

  final Function buttontap1;
  final Function? buttontap2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              picturepath,
              width: 240,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: greyFontStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                style: greyFontStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                buttontap1();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MainColor,
              ),
              child: Text(buttontitle1),
            ),
            (buttontap2 == null)
                ? SizedBox()
                : Text(
                    buttontitle2 ?? "change me",
                  ),
          ],
        ),
      ),
    );
  }
}
