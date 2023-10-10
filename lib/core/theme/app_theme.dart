// import 'package:flutter/material.dart';

// class AppTheme {
//   AppTheme();

//   static const String fontFamily = 'Montserrat';

//   ThemeData get data {
//     const double borderInputRadius = 14.0;

//     return ThemeData.light().copyWith(
//       scaffoldBackgroundColor: ColorConstants.backgroundColor,
//       primaryColor: ColorConstants.accent,
//       primaryColorLight: ColorConstants.accent,
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: ColorConstants.accent,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//         ),
//       ),
//       splashColor: ColorConstants.accent.withOpacity(0.1),
//       highlightColor: ColorConstants.accent.withOpacity(0.01),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: ColorConstants.backgroundColor,
//         titleTextStyle: TextStyle(fontSize: 30.0, color: ColorConstants.textColor, fontWeight: FontWeight.w600, fontFamily: fontFamily),
//         centerTitle: false,
//         elevation: 0,
//         shadowColor: ColorConstants.shadowColor,
//         toolbarHeight: 64,
//         titleSpacing: 24.0,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           disabledBackgroundColor: ColorConstants.blackColor,
//           textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, height: 1.0, fontFamily: fontFamily),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//           backgroundColor: ColorConstants.blackColor,
//           shadowColor: Colors.transparent,
//           elevation: 0.0,
//           padding: const EdgeInsets.all(16.0),
//         ),
//       ),
//       textTheme: const TextTheme(
//         displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600, color: ColorConstants.textColor, fontFamily: fontFamily, height: 1.0),
//         displayMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600, color: ColorConstants.textColor, fontFamily: fontFamily, height: 1.0),
//         displaySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: ColorConstants.textGrayColor, fontFamily: fontFamily, height: 1.0),
//         titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: ColorConstants.textColor, fontFamily: fontFamily, height: 1.0),
//         titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: ColorConstants.textColor, fontFamily: fontFamily, height: 1.2),
//         titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: ColorConstants.textGrayColor, fontFamily: fontFamily, height: 1.3),
//         bodyLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600, color: ColorConstants.textColor, fontFamily: fontFamily, height: 1.0),
//         bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: ColorConstants.textColor, fontFamily: fontFamily),
//         bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: ColorConstants.textColor, fontFamily: fontFamily, height: 1.0, letterSpacing: 0.3),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderInputRadius), borderSide: const BorderSide(color: Colors.red, width: 0.0)),
//         disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderInputRadius), borderSide: const BorderSide(color: Colors.transparent, width: 0.0)),
//         enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderInputRadius), borderSide: const BorderSide(color: Colors.transparent, width: 0.0)),
//         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderInputRadius), borderSide: const BorderSide(color: ColorConstants.lightGrayColor, width: 0.0)),
//         errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderInputRadius), borderSide: BorderSide(color: ColorConstants.lightGrayColor.withOpacity(0.8), width: 0.0)),
//         focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderInputRadius), borderSide: const BorderSide(color: ColorConstants.lightGrayColor, width: 0.0)),
//         fillColor: ColorConstants.lightGrayColor,
//         filled: true,
//         labelStyle: const TextStyle(fontSize: 14.0, color: ColorConstants.darkGrayColor, fontWeight: FontWeight.w400, fontFamily: fontFamily),
//         floatingLabelStyle: const TextStyle(fontSize: 10.0, height: 6.0, color: ColorConstants.darkGrayColor, fontWeight: FontWeight.w400, fontFamily: fontFamily),
//         hintStyle: const TextStyle(fontSize: 14.0, color: ColorConstants.darkGrayColor, fontWeight: FontWeight.w400, fontFamily: fontFamily),
//         errorStyle: const TextStyle(fontSize: 14.0, color: ColorConstants.rRedColor, fontWeight: FontWeight.w400, fontFamily: fontFamily),
//         helperStyle: const TextStyle(fontSize: 14.0, color: ColorConstants.darkGrayColor, fontWeight: FontWeight.w400, fontFamily: fontFamily),
//       ),
//       colorScheme: const ColorScheme.light(background: ColorConstants.backgroundColor).copyWith(secondary: ColorConstants.accent, primary: ColorConstants.accent),
//     );
//   }
// }