import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/domain/repository/stadium_repository.dart';

class StadiumUseCase {
  Future<List<String>?> getStadiumMap() async {
    return getIt<StadiumRepository>().getStadiumMap();
  }

  Future<List<List<int>>?> getSeatMap() async {
    return getIt<StadiumRepository>().getSeatMap();
  }

  Future<bool> bookSeat(String mapId, int x, int y) async {
    return getIt<StadiumRepository>().bookSeat(mapId, x, y);
  }
}
