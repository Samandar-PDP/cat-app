import 'package:equatable/equatable.dart';

import '../../model/cat_response.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object?> get props => [];
}
class InitialState extends CatState {}
class ErrorState extends CatState {
  final String message;
  const ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
class Loading extends CatState {}

class Success extends CatState {
  final List<CatResponse> cats;

  const Success(this.cats);

  @override
  List<Object?> get props => [cats];
}