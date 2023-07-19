// ignore_for_file: constant_identifier_names

import 'package:green_ghana_app/utils/exports.dart';
import 'package:green_ghana_app/views/about/about_view.dart';
import 'package:green_ghana_app/views/projects/tree_details.dart';

class AppRouter {
  static const String initialRoute = "/";
  static const String home = "/home";
  static const String projecthome = "/projecthome";
  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String treeDetials = "/treeDetials";
  static const String regidtered_tress = "/regidtered_tress";
  static const String aboutScreen = "/aboutScreen";

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const IntroView()),
    GetPage(name: login, page: () => const LoginVC()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: projecthome, page: () => const ProjectHomeView()),
    GetPage(name: regidtered_tress, page: () => const RegisterdTreesVC()),
    GetPage(name: treeDetials, page: () => TreeDetailsVC()),
    GetPage(name: aboutScreen, page: () => AboutGreenGhana()),
  ];
}
