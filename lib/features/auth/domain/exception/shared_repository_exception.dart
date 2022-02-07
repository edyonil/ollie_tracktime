import 'package:equatable/equatable.dart';

class SharedRepositoryException extends Equatable implements Exception {
  final String message;

  const SharedRepositoryException(this.message);

  @override
  List<Object?> get props => [];
}
