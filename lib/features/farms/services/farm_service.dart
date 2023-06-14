import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/model/general_resp_model.dart';
import 'package:nirsalfo/features/farms/data/model/farmer_model.dart';
import 'package:nirsalfo/features/onboarding/data/model/biodata_model.dart';
import 'package:nirsalfo/features/onboarding/data/model/verify_model.dart';

import '../../../core/service/chopper.dart';

part 'farm_service.chopper.dart';

final farmServiceProvider = Provider<FarmService>(
  (ref) => FarmService.create(chopperClient),
);

@ChopperApi(baseUrl: '/farmers')
abstract class FarmService extends ChopperService {
  static FarmService create([ChopperClient? client]) {
    return _$FarmService(client);
  }

  @Post(path: '/verify')
  Future<Response<VerifyModel>> verifyFarmer(@Body() Map<String, dynamic> body);

  @Post(path: '/register')
  Future<Response<GeneralResponseModel>> registerFarmer(
    @Body() Map<String, dynamic> body,
  );

  @Get(path: '/{farmerId}')
  Future<Response<BiodataModel>> getFarmerBiodata(@Path() String farmerId);

  @Get(path: '/')
  Future<Response<FarmerModel>> getFarmersList();
}
