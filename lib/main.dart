import 'package:get_storage/get_storage.dart';
import 'package:green_ghana_app/utils/exports.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRouter.initialRoute,
    getPages: AppRouter.routes,
  ));
}
