import 'package:drugger/view/screens/auth/register_screen.dart';
import 'package:drugger/view/screens/bottom_nav_screen.dart';
import 'package:drugger/view/screens/search/search_screen.dart';
import 'package:get/get.dart';

import '../splash.dart';
import '../view/screens/comment/comment_screen.dart';
import '../view/screens/item_detailes/item.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/otp_email.dart';
import '../view/screens/auth/reset_Password.dart';
import 'app_routs_name.dart';

List<GetPage<dynamic>>? routes =[
// GetPage(name:AppRoutes.login , page: ()=> LoginScreen()),
   GetPage(name:AppRoutes.homeScreen , page: ()=> BottomNavScreen()),
   GetPage(name:AppRoutes.loginScreen , page: ()=> LoginScreen()),
   GetPage(name:AppRoutes.registerScreen , page: ()=> RegisterScreen()),
   GetPage(name:AppRoutes.searchScreen , page: ()=> SearchScreen()),
   GetPage(name:AppRoutes.otpByEmail , page: ()=> OtpByEmail()),
   GetPage(name:AppRoutes.resetPass , page: ()=> ResetPass()),
   GetPage(name:AppRoutes.itemDetailes , page: ()=> ItemDetails()),
   GetPage(name:AppRoutes.commentScreen , page: ()=> CommentScreen()),
   GetPage(name:AppRoutes.myCustomSplashScreen , page: ()=> const MyCustomSplashScreen()),
];