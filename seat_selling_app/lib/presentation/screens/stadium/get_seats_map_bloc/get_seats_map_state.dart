part of 'get_seats_map_bloc.dart';

abstract class GetSeatsMapState extends Equatable {
  const GetSeatsMapState();

  @override
  List<Object> get props => [];
}

class GetSeatsMapInitial extends GetSeatsMapState {}

class GetSeatsMapLoading extends GetSeatsMapState {}

class GetSeatsMapLoaded extends GetSeatsMapState {
  final List<SeatEntity> seatMap;
  final int rowCount;
  final int colCount;

  const GetSeatsMapLoaded({
    required this.seatMap,
    required this.rowCount,
    required this.colCount,
  });
}

class GetSeatsMapError extends GetSeatsMapState {
  final String message;

  const GetSeatsMapError({required this.message});
}
