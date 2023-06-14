import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/features/farms/data/repository/farm_repository.dart';

import '../../../core/utils/utils.dart';

final farmListControllerProvider = StateNotifierProvider<FarmListController,AsyncValue>(
  (ref) => FarmListController(
    farmerRepository: ref.read(farmRepositoryProvider),
  ),
);

class FarmListController extends StateNotifier<AsyncValue> {
  final FarmRepository farmerRepository;

  FarmListController({required this.farmerRepository}) : super(AsyncData(null));

  Future<void> getFarmDetails(String farmId) async {
    state = AsyncValue.loading();

    try {
      final result = await farmerRepository.getFarmDetails(farmId);

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(parseError(e), StackTrace.current);
    }
  }
}
