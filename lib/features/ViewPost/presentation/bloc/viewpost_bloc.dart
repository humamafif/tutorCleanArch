import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internalcap/features/ViewPost/domain/entities/post_entity.dart';
import 'package:internalcap/features/ViewPost/domain/usecases/post_usecase.dart';

part 'viewpost_event.dart';
part 'viewpost_state.dart';

class ViewpostBloc extends Bloc<ViewpostEvent, ViewpostState> {
  final GetPostUseCase getPostUseCase;
  ViewpostBloc(this.getPostUseCase) : super(ViewpostInitial()) {
    on<PostEventGetAll>(_onGetAll);
  }

  FutureOr<void> _onGetAll(
      PostEventGetAll event, Emitter<ViewpostState> emit) async {
    emit(PostStateLoading());
    var data = await getPostUseCase();
    data.fold(
      (l) => emit(PostStateError(l.message)),
      (r) => emit(PostStateLoaded(r)),
    );
  }
}
