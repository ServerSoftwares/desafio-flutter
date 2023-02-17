import '../repository/astro_repository.dart';

mixin VerifyIfImageIsSavedUseCase {
  Future<bool> call(String id);
}

class VerifyIfImageIsSavedUseCaseImpl implements VerifyIfImageIsSavedUseCase {
  VerifyIfImageIsSavedUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<bool> call(String id) async =>
      _astroRepository.verifyIfImageIsSaved(id);
}
