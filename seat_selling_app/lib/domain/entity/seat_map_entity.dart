import 'package:seat_selling_app/domain/entity/seat_entity.dart';

class SeatMapEntity {
  final List<List<SeatEntity>> seats;

  const SeatMapEntity({
    required this.seats,
  });
}
