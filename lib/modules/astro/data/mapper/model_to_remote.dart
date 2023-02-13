import '../../domain/model/body/body_model.dart';
import '../../domain/model/moon_phase/moon_phase_model.dart';
import '../../domain/model/star_chart/star_chart_model.dart';
import '../remote/model/request/body/body_request.dart';
import '../remote/model/request/moon_phase/moon_phase_request.dart';
import '../remote/model/request/moon_phase/moon_phase_style/moon_phase_style_request.dart';
import '../remote/model/request/moon_phase/moon_phase_view/moon_phase_view_request.dart';
import '../remote/model/request/observer/observer_request.dart';
import '../remote/model/request/star_chart/parameters/star_chart_view_parameters_request.dart';
import '../remote/model/request/star_chart/star_chart_request.dart';
import '../remote/model/request/star_chart/view/star_chart_view_request.dart';

extension BodyModelToBodyRequest on BodyModel {
  BodyRequest toBodyRequest() => BodyRequest(
        latitude: latitude,
        longitude: longitude,
        fromDate: fromDate,
        toDate: toDate,
        time: time,
        elevation: elevation,
      );
}

extension MoonPhaseModelToMoonPhaseRequest on MoonPhaseModel {
  MoonPhaseRequest toMoonPhaseRequest() => MoonPhaseRequest(
        format: format,
        style: MoonPhaseStyleRequest(
          moonStyle: style.moonStyle,
          backgroundStyle: style.backgroundStyle,
          backgroundColor: style.backgroundColor,
          headingColor: style.headingColor,
          textColor: style.textColor,
        ),
        observer: ObserverRequest(
          latitude: observer.latitude,
          longitude: observer.longitude,
          date: observer.date,
        ),
        view: MoonPhaseViewRequest(
          type: view.type,
          orientation: view.orientation,
        ),
      );
}

extension StarChartModelToStarChartRequest on StarChartModel {
  StarChartRequest toStarChartRequest() => StarChartRequest(
        style: style,
        observer: ObserverRequest(
          latitude: observer.latitude,
          longitude: observer.longitude,
          date: observer.date,
        ),
        view: StarChartViewRequest(
          type: view.type,
          parameters: StarChartViewParametersRequest(
            constellation: view.parameters.constellation,
          ),
        ),
      );
}
