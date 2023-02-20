import 'package:equatable/equatable.dart';

class MoonPhaseStyleModel extends Equatable {
  const MoonPhaseStyleModel({
    required this.moonStyle,
    required this.backgroundStyle,
    required this.backgroundColor,
    required this.headingColor,
    required this.textColor,
  });

  final String moonStyle;
  final String backgroundStyle;
  final String backgroundColor;
  final String headingColor;
  final String textColor;

  @override
  List<Object?> get props => [
        moonStyle,
        backgroundStyle,
        backgroundColor,
        headingColor,
        textColor,
      ];
}
