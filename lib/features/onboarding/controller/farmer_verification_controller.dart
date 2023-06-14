import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/features/onboarding/data/repository/onboarding_repository.dart';

import '../../../core/utils/utils.dart';

final farmerVerificationControllerProvider =
    StateNotifierProvider<FarmerVerificationController, AsyncValue>(
  (ref) => FarmerVerificationController(
    onboardingRepository: ref.read(onboardingRepositoryProvider),
  ),
);

class FarmerVerificationController extends StateNotifier<AsyncValue> {
  final OnboardingRepository onboardingRepository;

  FarmerVerificationController({required this.onboardingRepository})
      : super(const AsyncData(null));

  Future<void> verifyFarmer(String identityNumber, String identityType) async {
    state = AsyncLoading();

    try {
      final result = await onboardingRepository
          .verifyFarmer({'id_type': identityType, 'id_number': identityNumber});

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(parseError(e), StackTrace.current);
    }
  }
}
