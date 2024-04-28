import 'dart:developer';

import 'package:seat_selling_app/data/source/remote/stadium_data_source.dart';

class StadiumDataSourceMockImpl extends StadiumDataSource {
  @override
  Future<bool> bookSeat({
    required String mapId,
    required int x,
    required int y,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    log('Seat at ($x, $y) booked successfully (mocked)');
    return true;
  }

  @override
  Future<List<List<int>>?> getSeatMap() async {
    return [
      [0, 0, 1, 0],
      [0, 1, 0, 0],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
    ];
  }

  @override
  Future<List<String>?> getStadiumMap() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['m213', 'm654', 'm63', 'm6888'];
  }
}
