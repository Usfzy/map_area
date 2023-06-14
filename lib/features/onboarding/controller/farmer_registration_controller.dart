
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/utils/utils.dart';
import 'package:nirsalfo/features/onboarding/data/repository/onboarding_repository.dart';

final farmerRegistrationControllerProvider =
    StateNotifierProvider<FarmerRegistrationController, AsyncValue>(
  (ref) => FarmerRegistrationController(
    onboardingRepository: ref.read(onboardingRepositoryProvider),
  ),
);

class FarmerRegistrationController extends StateNotifier<AsyncValue> {
  final OnboardingRepository onboardingRepository;

  FarmerRegistrationController({required this.onboardingRepository})
      : super(const AsyncData(null));

  Future<void> registerFarmer(Map<String, dynamic> body) async {
    state = AsyncLoading();

    try {
      final result = await onboardingRepository.registerFarmer(body);

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(parseError(e), StackTrace.current);
    }
  }
}
