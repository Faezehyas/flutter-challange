import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_selling_app/domain/entity/seat_entity.dart';
import 'package:seat_selling_app/presentation/screens/stadium/book_seat/book_seat_bloc.dart';
import 'package:seat_selling_app/presentation/widgets/seat_widget.dart';

class StadiumSeatSelectionScreen extends StatefulWidget {
  final List<SeatEntity> seats;
  final int rowCount;
  final int colCount;

  const StadiumSeatSelectionScreen({
    super.key,
    required this.seats,
    required this.rowCount,
    required this.colCount,
  });

  @override
  State<StadiumSeatSelectionScreen> createState() =>
      _StadiumSeatSelectionScreenState();
}

class _StadiumSeatSelectionScreenState
    extends State<StadiumSeatSelectionScreen> {
  final BookSeatBloc _bookSeatBloc = BookSeatBloc();
  late SeatEntity _selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                'Choose Stadium Seat. Green ones are available',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.purple[900]),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BlocProvider(
                  create: (context) => _bookSeatBloc,
                  child: BlocConsumer<BookSeatBloc, BookSeatState>(
                    listener: (context, state) {
                      if (state is BookSeatSuccess) {
                        ScaffoldMessenger.of(
                                context) // Access ScaffoldMessenger
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              'Seat at (${_selectedSeat.x}, ${_selectedSeat.y}) booked successfully',
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                      setState(() {
                        widget.seats
                            .firstWhere((element) => element == _selectedSeat)
                            .isAvailable = false;
                      });
                    },
                    builder: (context, state) {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //* Adjust based on desired seat layout
                          crossAxisCount: widget.colCount,
                          childAspectRatio: 5,
                          crossAxisSpacing: 8, mainAxisSpacing: 8,
                        ),
                        itemCount: widget.seats.length,
                        itemBuilder: (context, index) {
                          final seat = widget.seats[index];
                          return state is BookSeatLoading
                              ? const CircularProgressIndicator.adaptive()
                              : SeatWidget(
                                  seat: seat,
                                  onTap: (selectedSeat) {
                                    setState(() {
                                      _selectedSeat = selectedSeat;
                                    });
                                    _bookSeatBloc.add(BookSeatRequestEvent(
                                        seat: selectedSeat));
                                  },
                                );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
