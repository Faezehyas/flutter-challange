import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_selling_app/core/utils/validators.dart';
import 'package:seat_selling_app/presentation/screens/auth/bloc/auth_bloc.dart';
import 'package:seat_selling_app/presentation/screens/stadium/get_seats_map_bloc/get_seats_map_bloc.dart';
import 'package:seat_selling_app/presentation/screens/stadium/stadium_seat_selection_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameCtrlr = TextEditingController();

  final TextEditingController _passwordCtrlr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameCtrlr,
                    validator: (value) => usernameValidator(value),
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextFormField(
                    controller: _passwordCtrlr,
                    validator: (value) => passwordValidator(value),
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  BlocProvider(
                    create: (context) => GetSeatsMapBloc(),
                    child: BlocListener<GetSeatsMapBloc, GetSeatsMapState>(
                      listener: (context, state) {
                        if (state is GetSeatsMapLoaded) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StadiumSeatSelectionScreen(
                                seats: state.seatMap,
                                rowCount: state.rowCount,
                                colCount: state.colCount,
                              ),
                            ),
                          );
                        }
                      },
                      child: BlocConsumer<AuthBloc, AuthState>(
                        bloc: _authBloc,
                        listener: (context, state) {
                          if (state is AuthLoaded) {
                            BlocProvider.of<GetSeatsMapBloc>(context).add(
                              GetSeatsMapRequestEvent(),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  _authBloc.add(LoginEvent(
                                    username: _usernameCtrlr.text,
                                    password: _passwordCtrlr.text,
                                  ));
                                }
                              },
                              child: state is AuthLoading
                                  ? const CircularProgressIndicator(
                                      // color: Colors.white,
                                      // strokeWidth: 3,
                                      )
                                  : const Text('Login'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
