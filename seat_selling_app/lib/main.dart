import 'package:flutter/material.dart';
import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/core/utils/constants.dart';
import 'package:seat_selling_app/presentation/screens/auth/auth_screen.dart';
import 'package:seat_selling_app/presentation/screens/stadium/stadium_seat_selection_screen.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volleyball Ticket App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Constants.isLoggedIn
          ? StadiumSeatSelectionScreen(
              seats: Constants.seatMap,
              rowCount: Constants.rowCount,
              colCount: Constants.columnCount,
            )
          : const LoginScreen(),
    );
  }
}
