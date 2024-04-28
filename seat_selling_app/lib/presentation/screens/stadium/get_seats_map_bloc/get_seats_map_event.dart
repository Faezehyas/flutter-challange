part of 'get_seats_map_bloc.dart';

abstract class GetSeatsMapEvent extends Equatable {
  const GetSeatsMapEvent();

  @override
  List<Object> get props => [];
}

class GetSeatsMapRequestEvent extends GetSeatsMapEvent {}
