import 'package:drugger/view/screens/auth/register_screen.dart';
import 'package:drugger/view/screens/bottom_nav_screen.dart';
import 'package:drugger/view/screens/search/search_screen.dart';
import 'package:get/get.dart';

import '../binding/home_binding.dart';
import '../splash.dart';
import '../view/screens/cart/create_order_screen.dart';
import '../view/screens/comment/comment_screen.dart';
import '../view/screens/item_detailes/item.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/otp_email.dart';
import '../view/screens/auth/reset_Password.dart';
import '../view/screens/wishList/wishList_Screen.dart';
import 'app_routs_name.dart';

List<GetPage<dynamic>>? routes =[
// GetPage(name:AppRoutes.login , page: ()=> LoginScreen()),
   GetPage(name:AppRoutes.homeScreen , page: ()=> BottomNavScreen(),binding: HomeBinding()),
   GetPage(name:AppRoutes.loginScreen , page: ()=> LoginScreen()),
   GetPage(name:AppRoutes.registerScreen , page: ()=> RegisterScreen()),
   GetPage(name:AppRoutes.searchScreen , page: ()=> SearchScreen()),
   GetPage(name:AppRoutes.otpByEmail , page: ()=> OtpByEmail()),
   GetPage(name:AppRoutes.resetPass , page: ()=> ResetPass()),
   GetPage(name:AppRoutes.itemDetailes , page: ()=> ItemDetails()),
   GetPage(name:AppRoutes.commentScreen , page: ()=> CommentScreen()),
   GetPage(name:AppRoutes.createOrder , page: ()=> CreateOrderScreen()),
   GetPage(name:AppRoutes.createOrder , page: ()=> CreateOrderScreen()),
   GetPage(name:AppRoutes.wishListScreen , page: ()=> WishListScreen()),
   GetPage(name:AppRoutes.splashScreen , page: ()=> MyCustomSplashScreen()),
];