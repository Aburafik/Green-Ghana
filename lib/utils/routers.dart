import 'package:green_ghana_app/utils/exports.dart';

class AppRouter {
  static const String initialRoute = "/";
  static const String home = "/home";
  static const String projecthome = "/projecthome";
  static const String login = "/login";
  static const String signUp = "/signUp";
  // ignore: constant_identifier_names
  static const String regidtered_tress = "/regidtered_tress";

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const IntroView()),
    GetPage(name: login, page: () => const LoginVC()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: projecthome, page: () => const ProjectHomeView()),
    GetPage(name: regidtered_tress, page: () => const RegisterdTreesVC()),
  ];
}
