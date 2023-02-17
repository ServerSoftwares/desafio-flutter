import 'package:equatable/equatable.dart';

import 'body_details_data_model.dart';

class BodyDetailsModel extends Equatable {
  const BodyDetailsModel({
    required this.data,
  });

  final BodyDetailsDataModel data;

  @override
  List<Object?> get props => [data];
}
