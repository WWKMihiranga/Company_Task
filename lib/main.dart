import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'screens/home_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider( // Use ChangeNotifierProvider to provide ItemProvider instance.
      create: (context) => ItemProvider(), // Create an instance of ItemProvider.
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Company Task',

        theme: ThemeData( // Define the theme
          primarySwatch: PastelColors.pastel, // Primary color swatch.
          scaffoldBackgroundColor: PastelColors.pastel[50], // Scaffold background color.
          appBarTheme: AppBarTheme( // Theme for app bar.
            color: PastelColors.pastel[300], // Background color of app bar.
            centerTitle: true, // Center the title of app bar.
          ),

          elevatedButtonTheme: ElevatedButtonThemeData( // Theme for elevated buttons.
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,  // Text color of elevated buttons.
              backgroundColor: PastelColors.pastel[400], // Background color of elevated buttons.
            ),
          ),

          inputDecorationTheme: InputDecorationTheme( // Theme for input decorations.
            border: OutlineInputBorder(), // Border for text input fields.
            filled: true,
            fillColor: PastelColors.pastel[50],
          ),

        ),
        home: HomeScreen(),
      ),
    );
  }
}
