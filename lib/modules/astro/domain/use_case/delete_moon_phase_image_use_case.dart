import '../repository/astro_repository.dart';

mixin DeleteMoonPhaseImageUseCase {
  Future<void> call(String id);
}

class DeleteMoonPhaseImageUseCaseImpl implements DeleteMoonPhaseImageUseCase {
  DeleteMoonPhaseImageUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<void> call(String id) async =>
      _astroRepository.deleteMoonPhaseImage(id);
}
