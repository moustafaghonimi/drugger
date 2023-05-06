import 'package:drugger/view/screens/auth/register_screen.dart';
import 'package:drugger/view/screens/bottom_nav_screen.dart';
import 'package:get/get.dart';

import '../view/screens/auth/login_screen.dart';
import 'app_routs_name.dart';

List<GetPage<dynamic>>? routes =[
// GetPage(name:AppRoutes.login , page: ()=> LoginScreen()),
   GetPage(name:AppRoutes.homeScreen , page: ()=> BottomNavScreen()),
   GetPage(name:AppRoutes.loginScreen , page: ()=> LoginScreen()),
   GetPage(name:AppRoutes.registerScreen , page: ()=> RegisterScreen()),
];