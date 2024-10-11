part of 'pages.dart';

class GeneralPages extends StatelessWidget {
  const GeneralPages({
    super.key,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    this.bgColor,
    this.onBackButtonPresses,
    this.child,
  });

  final String title;
  final String subtitle;
  final Color? bgColor;
  final Widget? child;
  final Function? onBackButtonPresses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: darkColor,
          ),
          SafeArea(
            child: Container(
              color: bgColor ?? darkColor,
            ),
          ),
          SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      color: darkColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      child: Row(
                        children: <Widget>[
                          onBackButtonPresses != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onBackButtonPresses != null) {
                                      onBackButtonPresses!();
                                    }
                                  },
                                  child: Container(
                                    width: defaultMargin,
                                    height: defaultMargin,
                                    margin: const EdgeInsets.only(
                                        right: defaultMargin),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/back_arrow_white.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: heading1,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                subtitle,
                                style: heading2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: defaultMargin,
                  width: double.infinity,
                  color: '191919'.toColor(),
                ),
                child ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
