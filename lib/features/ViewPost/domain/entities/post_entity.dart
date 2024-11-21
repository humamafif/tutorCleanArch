import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? id;
  final String? title;
  final String? body;

  const PostEntity({this.id, this.title, this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        body,
      ];
}
