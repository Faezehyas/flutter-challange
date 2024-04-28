import 'package:seat_selling_app/domain/entity/seat_entity.dart';

class Constants {
  static const String baseApiUrl = 'www.google.com';
  static const String apiKey = 'API_KEY';
  static const int timeoutDuration = 30;
  // variables to help running project without the need for api
  static bool isLoggedIn = false;
  static String mapId = '';
  static List<SeatEntity> seatMap = [];
  static int rowCount = 0;
  static int columnCount = 0;
}
