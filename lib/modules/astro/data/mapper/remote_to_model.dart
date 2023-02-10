import 'package:observador_app/modules/astro/domain/model/body/table/body_altitude_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_distance_from_earth_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_distance_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_position_model.dart';

import '../../constants/null_constants.dart';
import '../../domain/model/body/body_dates_model.dart';
import '../../domain/model/body/body_details_data_model.dart';
import '../../domain/model/body/body_list_data_model.dart';
import '../../domain/model/body/body_list_model.dart';
import '../../domain/model/body/body_location_model.dart';
import '../../domain/model/body/body_observer_model.dart';
import '../../domain/model/body/table/body_position_horizonal_model.dart';
import '../../domain/model/body/table/body_table_cells_model.dart';
import '../../domain/model/body/table/body_table_entry_model.dart';
import '../../domain/model/body/table/body_table_model.dart';
import '../../domain/model/body/table/body_table_rows_model.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/image_url/image_model.dart';
import '../remote/model/response/body/details_data/body_details_data_response.dart';
import '../remote/model/response/body/list_data/body_list_data_response.dart';
import '../remote/model/response/image_url/data/image_data_response.dart';

extension ImageDataResponseToImageDataModel on ImageDataResponse {
  ImageDataModel toImageDataModel() => ImageDataModel(
        data: ImageModel(
            imageUrl:
                data?.imageUrl ?? NullResponseConstants.nullStringResponse),
      );
}

extension BodyListDataResponseToBodyListDataModel on BodyListDataResponse {
  BodyListDataModel toBodyListDataModel() => BodyListDataModel(
        data: BodyListModel(
            bodies: data?.bodies?.map((body) => body).toList() ?? []),
      );
}

extension BodyDetailsDataResponseToBodyDetailsDataModel
    on BodyDetailsDataResponse {
  BodyDetailsDataModel toBodyDetailsDataModel() => BodyDetailsDataModel(
        dates: BodyDatesModel(
          from: dates?.from ?? NullResponseConstants.nullStringResponse,
          to: dates?.to ?? NullResponseConstants.nullStringResponse,
        ),
        observer: BodyObserverModel(
          location: BodyLocationModel(
            longitude: observer?.location?.longitude ??
                NullResponseConstants.nullDoubleResponse,
            latitude: observer?.location?.latitude ??
                NullResponseConstants.nullDoubleResponse,
            elevation: observer?.location?.elevation ??
                NullResponseConstants.nullIntResponse,
          ),
        ),
        table: BodyTableModel(
          header: table?.header?.map((element) => element).toList() ?? [],
          rows: table?.rows
                  ?.map(
                    (row) => BodyTableRowsModel(
                      cells: row.cells
                              ?.map(
                                (cell) => BodyTableCellsModel(
                                  date: cell.date ??
                                      NullResponseConstants.nullStringResponse,
                                  id: cell.id ??
                                      NullResponseConstants.nullStringResponse,
                                  name: cell.name ??
                                      NullResponseConstants.nullStringResponse,
                                  distance: BodyDistanceModel(
                                    fromEarth: BodyDistanceFromEarthModel(
                                      au: cell.distance?.fromEarth?.au ??
                                          NullResponseConstants
                                              .nullStringResponse,
                                      km: cell.distance?.fromEarth?.km ??
                                          NullResponseConstants
                                              .nullStringResponse,
                                    ),
                                  ),
                                  position: BodyPositionModel(
                                    horizonal: BodyPositionHorizonalModel(
                                      altitude: BodyAltitudeModel(
                                        degrees: cell.position?.horizonal
                                                ?.altitude?.degrees ??
                                            NullResponseConstants
                                                .nullStringResponse,
                                        string: cell.position?.horizonal
                                                ?.altitude?.string ??
                                            NullResponseConstants
                                                .nullStringResponse,
                                      ),
                                      azimuth: BodyAltitudeModel(
                                        degrees: cell.position?.horizonal
                                                ?.altitude?.degrees ??
                                            NullResponseConstants
                                                .nullStringResponse,
                                        string: cell.position?.horizonal
                                                ?.altitude?.string ??
                                            NullResponseConstants
                                                .nullStringResponse,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                      entry: BodyTableEntryModel(
                        id: row.entry?.id ??
                            NullResponseConstants.nullStringResponse,
                        name: row.entry?.name ??
                            NullResponseConstants.nullStringResponse,
                      ),
                    ),
                  )
                  .toList() ??
              [],
        ),
      );
}
