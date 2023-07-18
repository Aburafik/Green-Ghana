import 'package:green_ghana_app/utils/exports.dart';

////COMMON IMAGE DECORATION
const decorationImage = DecorationImage(
    image: AssetImage("assets/images/tree.jpeg"), fit: BoxFit.cover);

///COMMON LINERA GREDIENT
var linearGradient = LinearGradient(
  colors: [
    CustomColors.primaryColor,
    CustomColors.primaryColor,
    CustomColors.primaryColor.withOpacity(.8),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

///REUSABLE ROUND RECTANGLULAR BORDER FOR CARDS
var roundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

///COMMON APP BAR
AppBar commonAppBar({String? title = "", bool hasIconColor = true}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title!,
      style: TextStyle(color: CustomColors.blackColor),
    ),
    iconTheme: hasIconColor
        ? const IconThemeData(color: CustomColors.blackColor)
        : null,
  );
}
