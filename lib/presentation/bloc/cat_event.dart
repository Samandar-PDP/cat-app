import 'package:equatable/equatable.dart';

abstract class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object?> get props => [];
}

class OnGetCats extends CatEvent {}