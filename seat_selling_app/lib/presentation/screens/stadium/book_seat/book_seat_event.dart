part of 'book_seat_bloc.dart';

abstract class BookSeatEvent extends Equatable {
  const BookSeatEvent();

  @override
  List<Object> get props => [];
}

class BookSeatRequestEvent extends BookSeatEvent {
  final SeatEntity seat;

  const BookSeatRequestEvent({required this.seat});
}
