import 'package:flutter/material.dart';

/// Paleta de colores suaves (rubrica: "evitar estridencias").
class AppColors {
  static const Color fondo = Color(0xFFFAF6F0);
  static const Color primario = Color(0xFF7A6A8F);
  static const Color primarioSuave = Color(0xFFE9E3F0);
  static const Color acento = Color(0xFFC98B8B);
  static const Color salvia = Color(0xFF8FAE9B);
  static const Color texto = Color(0xFF3A3340);
  static const Color textoSuave = Color(0xFF8A8290);
  static const Color borde = Color(0xFFEDE6DC);
  static const Color estrella = Color(0xFFE0A85C);
  static const Color tarjeta = Color(0xFFFFFFFF);
}

/// Estilos de texto reutilizables.
class AppText {
  static const String serif = 'serif';

  static const TextStyle titulo = TextStyle(
    fontFamily: serif,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.texto,
  );

  static const TextStyle seccion = TextStyle(
    fontFamily: serif,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.texto,
  );

  static const TextStyle subtitulo = TextStyle(
    fontSize: 14,
    color: AppColors.textoSuave,
  );

  static const TextStyle cuerpo = TextStyle(
    fontSize: 16,
    height: 1.7,
    color: AppColors.texto,
  );
}

class AppTheme {
  static ThemeData get claro {
    final esquema = ColorScheme.fromSeed(
      seedColor: AppColors.primario,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.primario,
      secondary: AppColors.acento,
      surface: AppColors.fondo,
    );

    final base = ThemeData(useMaterial3: true, colorScheme: esquema);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.fondo,
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.texto,
        displayColor: AppColors.texto,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.fondo,
        foregroundColor: AppColors.texto,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: AppText.serif,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.texto,
        ),
      ),
    );
  }
}
