import 'package:equatable/equatable.dart';

class NoResultException extends Equatable implements Exception {
  @override
  String toString() {
    return 'No Result';
  }

  @override
  List<Object?> get props => [];
}
