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
      style: const TextStyle(color: CustomColors.blackColor),
    ),
    iconTheme: hasIconColor
        ? const IconThemeData(color: CustomColors.blackColor)
        : null,
  );
}

const String aboutText =
    "The Green Ghana Day was introduced in 2021, by H.E. Nana Addo Dankwa Akuffo-Addo as part of an aggressive national afforestation/reforestation programme to restore the lost forest cover of Ghana and to contribute to the global effort to mitigate climate change. The maiden edition was held on June 11 2021, where an estimated 7million tree seedlings were planted across the nation.";

List<Map<String, dynamic>> categories = [
  {
    "id": 1,
    "title": "General Public Tree Planting program",
    "image": "assets/images/g.jpg",
  },
  {
    "id": 2,
    "title": "Government Institutions Tree Planting Program",
    "image": "assets/images/g.jpg",
  },
  {
    "id": 3,
    "title": "Private Institutions Tree Planting Program",
    "image": "assets/images/g.jpg",
  },
  {
    "id": 4,
    "title": "Religious Groups Tree Planting Program",
    "image": "assets/images/g.jpg",
  }
];

Padding minheading({String? title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 10),
    child: Text(
      title!,
      style: const TextStyle(
          color: CustomColors.blackColor, fontWeight: FontWeight.w600),
    ),
  );
}

Future<dynamic> loadingBar(BuildContext context) {
  return showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: CustomColors.secondaryColor.withOpacity(0.0),
        elevation: 0.0,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.discreteCircle(
                color: CustomColors.primaryColor,
                secondRingColor: CustomColors.secondaryColor,
                size: 60),
            SizedBox(height: 6),
            const Center(
              child: Text(""),
            ),
          ],
        ),
      );
    },
  );
}

showErrorSnackBar({BuildContext? context, String? message}) {
  return showTopSnackBar(
    Overlay.of(context!),
    CustomSnackBar.error(message: message!),
  );
}

showSuccessSnackBar({BuildContext? context, String? message}) {
  return showTopSnackBar(
    Overlay.of(context!),
    CustomSnackBar.success(message: message!),
  );
}
