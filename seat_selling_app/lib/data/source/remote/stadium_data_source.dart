import 'dart:developer';

import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/core/utils/constants.dart';
import 'package:seat_selling_app/core/utils/functions.dart';
import 'package:seat_selling_app/core/utils/request.dart';

abstract class StadiumDataSource {
  Future<List<String>?> getStadiumMap();
  Future<List<List<int>>?> getSeatMap();
  Future<bool> bookSeat({
    required String mapId,
    required int x,
    required int y,
  });
}

class StadiumDataSourceImpl extends StadiumDataSource {
  @override
  Future<bool> bookSeat({
    required String mapId,
    required int x,
    required int y,
  }) async {
    try {
      final Request request = getIt<Request>();
      final response = await request.post(
        '/map/$mapId/ticket',
        // data: {x: x, y: y},
        //* request body should be passed in a json format after the backend services been implemented
      );
      if (response.statusCode == 200) {
        // check validations needed and return response
        return true;
      } else {
        // check for other status codes
      }
    } catch (error) {
      log('StadiumDataSourceImpl error:$error');
    }
    return false;
  }

  @override
  Future<List<List<int>>?> getSeatMap() async {
    ///Get the list of map ids. You should use this endpoint
    /// to get the list and choose one of the stadium maps randomly
    List<String> a = await getStadiumMap() ?? [];
    Constants.mapId = getRandomItem(a);
    try {
      final Request request = getIt<Request>();
      final response = await request.get('/map/${Constants.mapId}');
      if (response.statusCode == 200) {
        // check validations needed and return response
      } else {
        // check for other status codes
      }
    } catch (error) {
      log('StadiumDataSourceImpl error:$error');
    }
    return null;
  }

  @override
  Future<List<String>?> getStadiumMap() async {
    try {
      final Request request = getIt<Request>();
      final response = await request.get('/map');
      if (response.statusCode == 200) {
        // check validations needed and return response
      } else {
        // check for other status codes
      }
    } catch (error) {
      log('StadiumDataSourceImpl error:$error');
    }
    return null;
  }
}
