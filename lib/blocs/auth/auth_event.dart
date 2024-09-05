part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {}

final class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}

final class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        username,
      ];
}
