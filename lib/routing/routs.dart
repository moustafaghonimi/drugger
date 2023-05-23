import 'package:drugger/view/screens/auth/register_screen.dart';
import 'package:drugger/view/screens/bottom_nav_screen.dart';
import 'package:drugger/view/screens/search/search_screen.dart';
import 'package:get/get.dart';

import '../binding/home_binding.dart';
import '../middelware/my_middelware.dart';
import '../view/screens/cart/create_order_screen.dart';
import '../view/screens/comment/comment_screen.dart';
import '../view/screens/item_detailes/item.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/otp_email.dart';
import '../view/screens/auth/reset_Password.dart';
import '../view/screens/onboarding/onboarding_screen.dart';
import '../view/screens/profile/my_order_screen.dart';
import '../view/screens/profile/update_password_screen.dart';
import '../view/screens/profile/update_profile_screen.dart';
import '../view/screens/user_medicine/add_medicine.dart';
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
   GetPage(name:AppRoutes.itemDetails , page: ()=> ItemDetails()),
   GetPage(name:AppRoutes.commentScreen , page: ()=> CommentScreen()),
   GetPage(name:AppRoutes.createOrder , page: ()=> CreateOrderScreen()),
   // GetPage(name:AppRoutes.createOrder , page: ()=> CreateOrderScreen()),
   GetPage(name:AppRoutes.wishListScreen , page: ()=> WishListScreen()),
   GetPage(name:AppRoutes.addNewMedicine , page: ()=> AddMedicine()),
   GetPage(name:AppRoutes.updateProfileScreen , page: ()=> UpdateProfileScreen()),
   GetPage(name:AppRoutes.onBoardingScreen , page: ()=> OnBoardingScreen(),middlewares: [MyMiddleWare()]),
   GetPage(name:AppRoutes.updatePassword , page: ()=> UpdatePasswordScreen()),
   GetPage(name:AppRoutes.myOrder , page: ()=> MyOrderScreen()),
];