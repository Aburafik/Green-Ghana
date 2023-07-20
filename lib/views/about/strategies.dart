import 'package:card_vertical_divider/card_vertical_divider.dart';
import 'package:green_ghana_app/utils/exports.dart';

class StrategiesVC extends StatelessWidget {
  const StrategiesVC({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: commonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardVerticalDivider(
              title: "Strategy",
              titleStyle: textStyle,
              content:
                  "Planting in degraded forest reserve compartments across the country.",
              contentStyle: const TextStyle(fontSize: 16),
              cardColor: Theme.of(context).cardColor,
              cricleBackgroungColor: CustomColors.primaryColor,
              dividerColor: CustomColors.blackColor,
              child: const Text("1"),
            ),
            CardVerticalDivider(
              title: "Strategy",
              titleStyle: textStyle,
              content:
                  "Planting to be done outside forest reserves, within farms, along watershed areas, in road medians, compound of homes, schools, churches, offices, etc, Within recreational grounds or parks..",
              contentStyle: const TextStyle(fontSize: 16),
              cardColor: Theme.of(context).cardColor,
              cricleBackgroungColor: CustomColors.primaryColor,
              dividerColor: CustomColors.blackColor,
              child: const Text("2"),
            ),
            // CardVerticalDivider(),
          ],
        ),
      ),
    );
  }
}
