import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/core/utils/constants.dart';
import 'package:seat_selling_app/domain/entity/seat_entity.dart';
import 'package:seat_selling_app/domain/usecase/stadium_usecase.dart';

part 'get_seats_map_event.dart';
part 'get_seats_map_state.dart';

class GetSeatsMapBloc extends Bloc<GetSeatsMapEvent, GetSeatsMapState> {
  GetSeatsMapBloc() : super(GetSeatsMapInitial()) {
    on<GetSeatsMapEvent>((event, emit) async {
      if (event is GetSeatsMapRequestEvent) {
        emit(GetSeatsMapLoading());
        try {
          final result = await getIt<StadiumUseCase>().getSeatMap();
          if (result != null) {
            List<SeatEntity> seatsList = [];
            int rowCount = result.length;
            int colCount = 0;
            for (int i = 0; i < result.length; i++) {
              colCount = result[i].length;
              for (int j = 0; j < colCount; j++) {
                seatsList.add(
                  SeatEntity(
                      x: i + 1, y: j + 1, isAvailable: result[i][j] == 0),
                );
              }
            }
            Constants.seatMap = seatsList;
            Constants.rowCount = rowCount;
            Constants.columnCount = colCount;
            emit(GetSeatsMapLoaded(
              seatMap: seatsList,
              rowCount: rowCount,
              colCount: colCount,
            ));
          } else {
            emit(const GetSeatsMapError(message: 'Server Error'));
          }
        } catch (e) {
          emit(GetSeatsMapError(message: e.toString()));
        }
      }
    });
  }
}
