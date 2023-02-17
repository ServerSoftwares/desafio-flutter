import 'package:equatable/equatable.dart';

class StarChartViewParametersModel extends Equatable {
  const StarChartViewParametersModel({
    required this.constellation,
  });

  final String constellation;

  @override
  List<Object?> get props => [constellation];
}
