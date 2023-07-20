import 'package:green_ghana_app/utils/exports.dart';

class AboutGreenGhana extends StatelessWidget {
  const AboutGreenGhana({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        color: CustomColors.lightGreenColor,
        fontSize: 25,
        fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: commonAppBar(),
      backgroundColor: CustomColors.lightBlueColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              Text(
                "GREEN GHANA DAY",
                style: textStyle,
              ),
              Text(
                "INITIATIVE",
                style: textStyle.copyWith(color: CustomColors.yellowColor),
              ),
              const Text(aboutText,style: TextStyle(height:2 ),)
            ],
          ),
        ),
      ),
    );
  }
}
