import '../../constants/null_constants.dart';
import '../../domain/model/body/body_details_data_model.dart';
import '../../domain/model/body/body_details_model.dart';
import '../../domain/model/body/body_list_data_model.dart';
import '../../domain/model/body/body_list_model.dart';
import '../../domain/model/body/table/body_altitude_model.dart';
import '../../domain/model/body/table/body_distance_from_earth_model.dart';
import '../../domain/model/body/table/body_distance_model.dart';
import '../../domain/model/body/table/body_position_horizonal_model.dart';
import '../../domain/model/body/table/body_position_model.dart';
import '../../domain/model/body/table/body_table_cells_model.dart';
import '../../domain/model/body/table/body_table_model.dart';
import '../../domain/model/body/table/body_table_rows_model.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/image_url/image_model.dart';
import '../remote/model/response/body/details/body_details_response.dart';
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

extension BodyDetailsResponseToBodyDetailsModel on BodyDetailsResponse {
  BodyDetailsModel toBodyDetailsModel() => BodyDetailsModel(
        data: BodyDetailsDataModel(
          table: BodyTableModel(
            rows: data?.table?.rows
                    ?.map(
                      (row) => BodyTableRowsModel(
                        cells: row.cells
                                ?.map(
                                  (cell) => BodyTableCellsModel(
                                    date: cell.date ??
                                        NullResponseConstants
                                            .nullStringResponse,
                                    distance: BodyDistanceModel(
                                      fromEarth: BodyDistanceFromEarthModel(
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
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    )
                    .toList() ??
                [],
          ),
        ),
      );
}

// extension BodyDetailsDataResponseToBodyDetailsDataModel
//     on BodyDetailsDataResponse {
//   BodyDetailsDataModel toBodyDetailsDataModel() => BodyDetailsDataModel(
//         table: BodyTableModel(
//           rows: table?.rows
//                   ?.map(
//                     (row) => BodyTableRowsModel(
//                       cells: row.cells
//                               ?.map(
//                                 (cell) => BodyTableCellsModel(
//                                   date: cell.date ??
//                                       NullResponseConstants.nullStringResponse,
//                                   distance: BodyDistanceModel(
//                                     fromEarth: BodyDistanceFromEarthModel(
//                                       km: cell.distance?.fromEarth?.km ??
//                                           NullResponseConstants
//                                               .nullStringResponse,
//                                     ),
//                                   ),
//                                   position: BodyPositionModel(
//                                     horizonal: BodyPositionHorizonalModel(
//                                       altitude: BodyAltitudeModel(
//                                         degrees: cell.position?.horizonal
//                                                 ?.altitude?.degrees ??
//                                             NullResponseConstants
//                                                 .nullStringResponse,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                               .toList() ??
//                           [],
//                     ),
//                   )
//                   .toList() ??
//               [],
//         ),
//       );
// }
