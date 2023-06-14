import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/features/farms/data/repository/farm_repository.dart';

import '../../../core/utils/utils.dart';

final farmersListControllerProvider = StateNotifierProvider<FarmersListController, AsyncValue>(
  (ref) => FarmersListController(
    farmerRepository: ref.read(farmRepositoryProvider),
  ),
);

class FarmersListController extends StateNotifier<AsyncValue> {
  final FarmRepository farmerRepository;

  FarmersListController({required this.farmerRepository}) : super(AsyncData(null));

  Future<void> getFarmersList() async {
    state = AsyncLoading();

    try {
      final result = await farmerRepository.getFarmersList();

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(parseError(e), StackTrace.current);
    }
  }
}
