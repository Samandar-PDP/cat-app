import 'package:bloc/bloc.dart';
import 'package:cat_app/presentation/bloc/cat_event.dart';
import 'package:cat_app/presentation/bloc/cat_state.dart';
import 'package:cat_app/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository _repo = CatRepoImpl();

  CatBloc() : super(InitialState()) {
    on<CatEvent>((event, emit) async {
      if(event is OnGetCats) {
        final response = await _repo.getCats();
        emit(Loading());
        await Future.delayed(const Duration(seconds: 1));
        emit(Success(response));
      }
    });
  }
}