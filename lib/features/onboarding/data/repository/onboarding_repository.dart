import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/model/general_resp_model.dart';
import 'package:nirsalfo/features/farms/data/model/register_farmer_model.dart';
import 'package:nirsalfo/features/farms/services/farm_service.dart';
import 'package:nirsalfo/features/onboarding/data/model/biodata_model.dart';
import 'package:nirsalfo/features/onboarding/data/model/verify_model.dart';

import '../../../../core/error/exception.dart';

final onboardingRepositoryProvider = Provider(
  (ref) => OnboardingRepository(
    farmService: ref.read(farmServiceProvider),
  ),
);

class OnboardingRepository {
  final FarmService farmService;

  const OnboardingRepository({required this.farmService});

  Future<VerifyModel> verifyFarmer(Map<String, dynamic> body) async {
    final response = await farmService.verifyFarmer(body);
    if (response.isSuccessful) return response.body!;

    throw ServerException(message: response.error);
  }

  Future<RegisterFarmerModel> registerFarmer(Map<String, dynamic> body) async {
    final response = await farmService.registerFarmer(body);
    if (response.isSuccessful) return response.body!;

    throw ServerException(message: response.error);
  }

  Future<BiodataModel> getFarmerBiodata(String farmerId) async {
    final response = await farmService.getFarmerBiodata(farmerId);
    if (response.isSuccessful) return response.body!;

    throw ServerException(message: response.error);
  }
}
