import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common/common_colors.dart';
import 'package:flutter_ecommerce/app/main_tapview/main_tapbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonColors();

    // 🌞 Light ColorScheme
    final lightColorScheme =
        ColorScheme.fromSeed(
          seedColor: colors.orange,
          brightness: Brightness.light,
        ).copyWith(
          primary: colors.orange,
          secondary: colors.gray,
          tertiary: colors.lightGray,
          surface: Colors.white,
        );

    // 🌙 Dark ColorScheme
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: colors.orange,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      // 🌞 Light Theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.surface,

        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: lightColorScheme.surface,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          titleMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: lightColorScheme.tertiary,
          ),
          bodyMedium: TextStyle(fontSize: 14),
          labelLarge: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: lightColorScheme.secondary,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.surface,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.surface,
          elevation: 0,
        ),
      ),

      // 🌙 Dark Theme
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),

      home: const MainTapbar(),
    );
  }
}
