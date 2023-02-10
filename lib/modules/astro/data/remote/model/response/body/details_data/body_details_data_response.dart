import 'package:json_annotation/json_annotation.dart';

import '../body_observer/body_observer_response.dart';
import '../dates/body_dates_response.dart';
import '../table/body_table_response.dart';

part 'body_details_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyDetailsDataResponse {
  BodyDetailsDataResponse({
    this.dates,
    this.observer,
    this.table,
  });

  factory BodyDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyDetailsDataResponseFromJson(json);

  final BodyDatesResponse? dates;
  final BodyObserverResponse? observer;
  final BodyTableResponse? table;

  Map<String, dynamic> toJson() => _$BodyDetailsDataResponseToJson(this);
}
