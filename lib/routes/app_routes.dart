import 'package:flutter/material.dart';

import '../features/home/home_screen/home_screen.dart';
import '../features/onboarding/pages/farmer_biodata_screen.dart';
import '../features/onboarding/pages/farmer_verification_screen.dart';
import '../features/farms/pages/add_farm_screen.dart';
import '../app_navigation_screen.dart';
import '../features/profile/pages/farmer_profile_screen.dart';
import '../features/farms/pages/registered_farmers_screen.dart';
import '../features/profile/pages/view_farmer_biodata_screen.dart';
import '../features/farms/pages/view_farms_map_screen.dart';
import '../features/farms/pages/view_farms_list_screen.dart';
import '../features/farms/pages/view_single_farm_screen.dart';
import '../features/splash/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String homeScreen = '/home_screen';

  static const String farmerVerificationScreen = '/farmer_verification_screen';

  static const String farmerBiodataScreen = '/farmer_biodata_screen';

  static const String farmerProfileScreen = '/farmer_profile_screen';

  static const String viewFarmerBiodataScreen = '/view_farmer_biodata_screen';

  static const String viewFarmsScreen = '/view_farms_screen';

  static const String viewSingleFarmScreen = '/view_single_farm_screen';

  static const String addFarmScreen = '/add_farm_screen';

  static const String viewFarmsMapScreen = '/view_farms_one_screen';

  static const String registeredFarmersScreen = '/registered_farmers_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    homeScreen: (context) => HomeScreen(),
    farmerVerificationScreen: (context) => FarmerVerificationScreen(),
    farmerBiodataScreen: (context) => FarmerBiodataScreen(),
    farmerProfileScreen: (context) => FarmerProfileScreen(),
    viewFarmerBiodataScreen: (context) => ViewFarmerBiodataScreen(),
    viewFarmsScreen: (context) => ViewFarmsListScreen(),
    viewSingleFarmScreen: (context) => ViewSingleFarmScreen(),
    addFarmScreen: (context) => AddFarmScreen(),
    viewFarmsMapScreen: (context) => ViewFarmsMapScreen(),
    registeredFarmersScreen: (context) => RegisteredFarmersScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
