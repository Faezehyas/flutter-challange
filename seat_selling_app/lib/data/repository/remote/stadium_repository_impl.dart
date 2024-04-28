import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/data/source/remote/stadium_data_source.dart';
import 'package:seat_selling_app/domain/repository/stadium_repository.dart';

class StadiumRepositoryImpl implements StadiumRepository {
  @override
  Future<bool> bookSeat(String mapId, int x, int y) {
    return getIt<StadiumDataSource>().bookSeat(mapId: mapId, x: x, y: y);
  }

  @override
  Future<List<List<int>>?> getSeatMap() {
    return getIt<StadiumDataSource>().getSeatMap();
  }

  @override
  Future<List<String>?> getStadiumMap() {
    return getIt<StadiumDataSource>().getStadiumMap();
  }
}
