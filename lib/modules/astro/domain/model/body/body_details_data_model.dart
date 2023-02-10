import 'body_dates_model.dart';
import 'body_observer_model.dart';
import 'table/body_table_model.dart';

class BodyDetailsDataModel {
  BodyDetailsDataModel({
    required this.dates,
    required this.observer,
    required this.table,
  });

  final BodyDatesModel dates;
  final BodyObserverModel observer;
  final BodyTableModel table;
}
