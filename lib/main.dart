import 'package:green_ghana_app/utils/exports.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRouter.initialRoute,
    getPages: AppRouter.routes,
  ));
}
