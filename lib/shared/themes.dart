part of 'shared.dart';

const double defaultMargin = 24.0;

Color mainColor = "f77f00".toColor();
Color secondaryColor = "fcbf49".toColor();
Color accentColor = "d62828".toColor();
Color darkColor = "151515".toColor();
Color greyColor = "8D92A3".toColor();
Color whiteColor = "FFFFFF".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle heading1 = GoogleFonts.poppins().copyWith(
  color: whiteColor,
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
);
TextStyle heading2 = GoogleFonts.poppins().copyWith(
  color: whiteColor,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);
TextStyle heading3 = GoogleFonts.poppins().copyWith(
  color: whiteColor,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
);
