part of 'book_seat_bloc.dart';

abstract class BookSeatState extends Equatable {
  const BookSeatState();

  @override
  List<Object> get props => [];
}

class BookSeatInitial extends BookSeatState {}

class BookSeatLoading extends BookSeatState {}

class BookSeatSuccess extends BookSeatState {}

class BookSeatError extends BookSeatState {
  final String message;

  const BookSeatError({required this.message});
}
