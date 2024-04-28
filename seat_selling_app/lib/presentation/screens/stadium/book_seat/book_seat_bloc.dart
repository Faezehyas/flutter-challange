import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/core/utils/constants.dart';
import 'package:seat_selling_app/domain/entity/seat_entity.dart';
import 'package:seat_selling_app/domain/usecase/stadium_usecase.dart';

part 'book_seat_event.dart';
part 'book_seat_state.dart';

class BookSeatBloc extends Bloc<BookSeatEvent, BookSeatState> {
  BookSeatBloc() : super(BookSeatInitial()) {
    on<BookSeatEvent>((event, emit) async {
      if (event is BookSeatRequestEvent) {
        emit(BookSeatLoading());
        try {
          final result = await getIt<StadiumUseCase>().bookSeat(
            Constants.mapId,
            event.seat.x,
            event.seat.y,
          );
          if (result) {
            emit(BookSeatSuccess());
          } else {
            emit(const BookSeatError(message: 'Server Error'));
          }
        } catch (e) {
          emit(BookSeatError(message: e.toString()));
        }
      }
    });
  }
}
