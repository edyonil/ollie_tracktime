import 'package:equatable/equatable.dart';

class LoginOrPassowordException extends Equatable implements Exception {
  final String message;

  const LoginOrPassowordException(this.message);

  @override
  List<Object?> get props => [];
}
