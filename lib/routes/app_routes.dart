import 'package:flutter/material.dart';
import 'package:nirsalfo/features/farms/pages/add_farm_screen.dart';
import 'package:nirsalfo/features/farms/pages/registered_farmers_list_screen.dart';
import 'package:nirsalfo/features/farms/pages/view_farms_list_screen.dart';
import 'package:nirsalfo/features/farms/pages/view_farms_map_screen.dart';
import 'package:nirsalfo/features/farms/pages/view_single_farm_screen.dart';

import '../features/home/presentation/home_screen.dart';
import '../features/onboarding/presentation/pages/farmer_biodata_screen.dart';
import '../features/onboarding/presentation/pages/farmer_profile_screen.dart';
import '../features/onboarding/presentation/pages/farmer_verification_screen.dart';
import '../features/onboarding/presentation/pages/view_farmer_biodata_screen.dart';
import '../features/splash/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = 'splash_screen';
  static const String homeScreen = 'home_screen';
  static const String farmerVerificationScreen = 'farmer_verification_screen';
  static const String farmerBiodataScreen = 'farmer_biodata_screen';
  static const String farmerProfileScreen = 'farmer_profile_screen';
  static const String viewFarmerBiodataScreen = 'view_farmer_biodata_screen';
  static const String viewFarmsScreen = 'view_farms_screen';
  static const String viewSingleFarmScreen = 'view_single_farm_screen';
  static const String addFarmScreen = 'add_farm_screen';
  static const String viewFarmsMapScreen = 'view_farms_one_screen';
  static const String registeredFarmersScreen = 'registered_farmers_screen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case farmerVerificationScreen:
        return MaterialPageRoute(builder: (context) => FarmerVerificationScreen());
      case farmerBiodataScreen:
        return MaterialPageRoute(builder: (context) => FarmerBiodataScreen(), settings: settings);
      case farmerProfileScreen:
        return MaterialPageRoute(builder: (context) => FarmerProfileScreen(farmerId: settings.arguments as String));
      case viewFarmerBiodataScreen:
        return MaterialPageRoute(
          builder: (context) => ViewFarmerBiodataScreen(
            farmerId: settings.arguments as String,
          ),
        );
      case viewFarmsScreen:
        return MaterialPageRoute(builder: (context) => ViewFarmsListScreen());
      case viewSingleFarmScreen:
        return MaterialPageRoute(builder: (context) => ViewSingleFarmScreen());
      case addFarmScreen:
        return MaterialPageRoute(builder: (context) => AddFarmScreen());
      case viewFarmsMapScreen:
        return MaterialPageRoute(builder: (context) => ViewFarmsMapScreen());
      case registeredFarmersScreen:
        return MaterialPageRoute(builder: (context) => RegisteredFarmersScreen());

      default:
        throw UnimplementedError('Route not found');
    }
  }
}
