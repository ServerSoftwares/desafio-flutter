import 'package:equatable/equatable.dart';

import 'body_table_cells_model.dart';

class BodyTableRowsModel extends Equatable {
  const BodyTableRowsModel({
    required this.cells,
  });

  final List<BodyTableCellsModel> cells;

  @override
  List<Object?> get props => [cells];
}
