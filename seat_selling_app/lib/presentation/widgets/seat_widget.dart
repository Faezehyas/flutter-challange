import 'package:flutter/material.dart';
import 'package:seat_selling_app/domain/entity/seat_entity.dart';

class SeatWidget extends StatelessWidget {
  final Function(SeatEntity) onTap;
  final SeatEntity seat;
  const SeatWidget({
    super.key,
    required this.onTap,
    required this.seat,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4.0),
      onTap: seat.isAvailable ? () => onTap(seat) : null,
      child: Icon(
        Icons.chair_rounded,
        color: seat.isAvailable ? Colors.green : Colors.purple,
      ),
    );
  }
}
