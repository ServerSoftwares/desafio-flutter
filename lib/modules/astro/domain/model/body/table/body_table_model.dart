import 'body_table_rows_model.dart';

class BodyTableModel {
  BodyTableModel({
    required this.header,
    required this.rows,
  });

  final List<String>? header;
  final List<BodyTableRowsModel>? rows;
}
