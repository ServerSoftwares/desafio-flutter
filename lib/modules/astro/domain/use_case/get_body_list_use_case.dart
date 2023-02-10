import '../model/body/body_list_data_model.dart';
import '../repository/astro_repository.dart';

mixin GetBodyListUseCase {
  Future<BodyListDataModel> getBodyList();
}

class GetBodyListUseCaseImpl implements GetBodyListUseCase {
  GetBodyListUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<BodyListDataModel> getBodyList() => _astroRepository.getBodyList();
}
