import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'modules/astro/constants/astro_constant_fonts.dart';
import 'modules/astro/presentation/common/constants/astro_constant_colors.dart';
import 'modules/astro/presentation/page/moon_phase_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Astro App',
        theme: ThemeData(
          fontFamily: AstroConstantFonts.roboto,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AstroConstantColors.primaryColor,
            secondary: AstroConstantColors.secondaryColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MoonPhasePage(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      );
}
