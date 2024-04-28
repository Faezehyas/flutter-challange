abstract class StadiumRepository {
  Future<List<String>?> getStadiumMap();
  Future<List<List<int>>?> getSeatMap();
  Future<bool> bookSeat(String mapId, int x, int y);
}
