import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/model/general_resp_model.dart';
import 'package:nirsalfo/features/farms/data/model/farmer_model.dart';
import 'package:nirsalfo/features/onboarding/data/model/biodata_model.dart';
import 'package:nirsalfo/features/onboarding/data/model/verify_model.dart';

import '../../../core/service/chopper.dart';
import '../data/model/farm_details_model.dart';

part 'farm_service.chopper.dart';

final farmServiceProvider = Provider<FarmService>(
  (ref) => FarmService.create(chopperClient),
);

@ChopperApi()
abstract class FarmService extends ChopperService {
  static FarmService create([ChopperClient? client]) {
    return _$FarmService(client);
  }

  @Post(path: '/farmers/verify')
  Future<Response<VerifyModel>> verifyFarmer(@Body() Map<String, dynamic> body);

  @Post(path: '/farmers/register')
  Future<Response<GeneralResponseModel>> registerFarmer(
    @Body() Map<String, dynamic> body,
  );

  @Get(path: '/farmers/{farmerId}')
  Future<Response<BiodataModel>> getFarmerBiodata(@Path() String farmerId);

  @Get(path: '/farmers/')
  Future<Response<FarmerModel>> getFarmersList();

  @Get(path: '/farm/{farmId}')
  Future<Response<FarmDetailsModel>> getFarmDetails(String farmId);
}
