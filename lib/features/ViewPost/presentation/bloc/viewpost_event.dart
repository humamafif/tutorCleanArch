part of 'viewpost_bloc.dart';

abstract class ViewpostEvent extends Equatable {
  const ViewpostEvent();

  @override
  List<Object> get props => [];
}

final class PostEventGetAll extends ViewpostEvent {}
