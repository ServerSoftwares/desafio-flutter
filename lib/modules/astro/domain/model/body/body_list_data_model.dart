import 'package:equatable/equatable.dart';

import 'body_list_model.dart';

class BodyListDataModel extends Equatable {
  const BodyListDataModel({
    required this.data,
  });

  final BodyListModel data;

  @override
  List<Object?> get props => [data];
}
