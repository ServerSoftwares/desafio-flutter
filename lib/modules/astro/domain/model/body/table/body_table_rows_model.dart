import 'body_table_cells_model.dart';
import 'body_table_entry_model.dart';

class BodyTableRowsModel {
  BodyTableRowsModel({
    required this.cells,
    required this.entry,
  });

  final List<BodyTableCellsModel> cells;
  final BodyTableEntryModel entry;
}
