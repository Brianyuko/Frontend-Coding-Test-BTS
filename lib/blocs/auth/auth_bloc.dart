import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:frontend_bts/env/env.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final http.Client client;
  AuthBloc({
    required this.client,
  }) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await client.post(
        Uri.parse('http://${Env.baseUrl}/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': event.username,
          'password': event.password,
        }),
      );
      final responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          emit(AuthLoaded());
        case 201:
          emit(AuthLoaded());
        case 401:
          emit(AuthError(
            message: responseJson['message'].isEmpty ||
                    responseJson['message'] == null
                ? 'Unauthorized'
                : responseJson['message'],
          ));
        case 403:
          emit(AuthError(
            message: responseJson['message'].isEmpty ||
                    responseJson['message'] == null
                ? 'Forbidden'
                : responseJson['message'],
          ));
        case 404:
          emit(AuthError(
            message: responseJson['message'].isEmpty ||
                    responseJson['message'] == null
                ? 'Not Found'
                : responseJson['message'],
          ));
        default:
          emit(
            AuthError(
              message: responseJson['message'].isEmpty ||
                      responseJson['message'] == null
                  ? 'An error occurred'
                  : responseJson['message'],
            ),
          );
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await client.post(
        Uri.parse('http://${Env.baseUrl}/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': event.email,
          'username': event.username,
          'password': event.password,
        }),
      );
      final responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          emit(AuthLoaded());
        case 201:
          emit(AuthLoaded());
        case 401:
          emit(AuthError(
            message: responseJson['message'].isEmpty ||
                    responseJson['message'] == null
                ? 'Unauthorized'
                : responseJson['message'],
          ));
        case 403:
          emit(AuthError(
            message: responseJson['message'].isEmpty ||
                    responseJson['message'] == null
                ? 'Forbidden'
                : responseJson['message'],
          ));

        case 404:
          emit(AuthError(
            message: responseJson['message'].isEmpty ||
                    responseJson['message'] == null
                ? 'Not Found'
                : responseJson['message'],
          ));
        default:
          emit(
            AuthError(
              message: responseJson['message'].isEmpty ||
                      responseJson['message'] == null
                  ? 'An error occurred'
                  : responseJson['message'],
            ),
          );
      }
    });
  }
}
