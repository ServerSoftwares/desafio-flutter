import 'package:equatable/equatable.dart';

import 'body_table_rows_model.dart';

class BodyTableModel extends Equatable {
  const BodyTableModel({
    required this.rows,
  });

  final List<BodyTableRowsModel> rows;

  @override
  List<Object?> get props => [rows];
}
