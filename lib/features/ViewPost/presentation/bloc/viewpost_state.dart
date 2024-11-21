part of 'viewpost_bloc.dart';

abstract class ViewpostState extends Equatable {
  const ViewpostState();  

  @override
  List<Object> get props => [];
}
class ViewpostInitial extends ViewpostState {}

class PostStateLoading extends ViewpostState {}

class PostStateLoaded extends ViewpostState {
  final List<PostEntity> posts;

  PostStateLoaded( this.posts);

  @override
  List<Object> get props => [posts];
}

class PostStateError extends ViewpostState {
  final String message;

  PostStateError( this.message);

  @override
  List<Object> get props => [message];
}