import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/features/farms/data/repository/farm_repository.dart';

import '../../../core/utils/utils.dart';
import '../data/model/add_farm_model.dart';

final addFarmControllerProvider = StateNotifierProvider<AddFarmController, AsyncValue>(
  (ref) => AddFarmController(
    farmerRepository: ref.read(farmRepositoryProvider),
  ),
);

class AddFarmController extends StateNotifier<AsyncValue> {
  final FarmRepository farmerRepository;

  AddFarmController({required this.farmerRepository}) : super(AsyncData(null));

  Future<void> addFarm(String farmId, AddFarmModel addFarmModel) async {
    state = AsyncLoading();
    try {
      final result = await farmerRepository.addFarm(farmId,addFarmModel);

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(parseError(e), StackTrace.current);
    }
  }
}
