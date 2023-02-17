import 'package:equatable/equatable.dart';

import 'table/body_table_model.dart';

class BodyDetailsDataModel extends Equatable {
  const BodyDetailsDataModel({
    required this.table,
  });

  final BodyTableModel table;

  @override
  List<Object?> get props => [table];
}
