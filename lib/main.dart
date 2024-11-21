import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internalcap/core/injection.dart';
import 'package:internalcap/features/ViewPost/presentation/bloc/viewpost_bloc.dart';
import 'package:internalcap/features/ViewPost/presentation/pages/post_list_page.dart';

Future<void> main()async {
  await initInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewpostBloc>(
      create: (BuildContext context) => sl()..add(PostEventGetAll()),
      child:const MaterialApp(
        home: PostListPage(),
      ),
    );
  }
}
