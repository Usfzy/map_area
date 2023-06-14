import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/features/onboarding/data/repository/onboarding_repository.dart';

import '../../../core/utils/utils.dart';

final farmerBiodataControllerProvider =
    StateNotifierProvider<FarmerBiodataController, AsyncValue>(
  (ref) => FarmerBiodataController(
    onboardingRepository: ref.read(onboardingRepositoryProvider),
  ),
);

class FarmerBiodataController extends StateNotifier<AsyncValue> {
  final OnboardingRepository onboardingRepository;
  FarmerBiodataController({required this.onboardingRepository})
      : super(const AsyncData(null));

  Future<void> getFarmerBiodata(String farmerId) async {
    state = AsyncLoading();

    try {
      final result = await onboardingRepository.getFarmerBiodata(farmerId);

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(parseError(e), StackTrace.current);
    }
  }
}
