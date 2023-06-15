import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/model/general_resp_model.dart';
import 'package:nirsalfo/features/farms/data/model/add_farm_model.dart';
import 'package:nirsalfo/features/farms/data/model/farmer_model.dart';
import 'package:nirsalfo/features/farms/services/farm_service.dart';

import '../../../../core/error/exception.dart';
import '../model/farm_details_model.dart';

final farmRepositoryProvider = Provider(
  (ref) => FarmRepository(
    farmService: ref.read(farmServiceProvider),
  ),
);

class FarmRepository {
  final FarmService farmService;

  const FarmRepository({required this.farmService});

  Future<FarmerModel> getFarmersList() async {
    final response = await farmService.getFarmersList();
    if (response.isSuccessful) return response.body!;

    throw ServerException(message: response.error);
  }

  Future<FarmDetailsModel> getFarmList(String farmId) async {
    final response = await farmService.getFarmList(farmId);
    if (response.isSuccessful) return response.body!;

    throw ServerException(message: response.error);
  }

  Future<GeneralResponseModel> addFarm(String farmId, AddFarmModel addFarmModel) async {
    final response = await farmService.addFarm(farmId, addFarmModel.toJson());
    if (response.isSuccessful) return response.body!;

    throw ServerException(message: response.error);
  }
}
