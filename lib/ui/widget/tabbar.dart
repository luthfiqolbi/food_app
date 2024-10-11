part of "widgets.dart";

class Tabbar extends StatelessWidget {
  const Tabbar({
    super.key,
    required this.selectedIndex,
    required this.titles,
    this.onTap,
  });

  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      child: Row(
        children: titles
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (onTap != null) {
                          onTap!(titles.indexOf(e));
                        }
                      },
                      child: Text(
                        e,
                        style: (titles.indexOf(e) == selectedIndex)
                            ? heading3
                            : greyFontStyle.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 3,
                      margin: const EdgeInsets.only(top: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (titles.indexOf(e) == selectedIndex)
                            ? whiteColor
                            : Colors.transparent,
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
