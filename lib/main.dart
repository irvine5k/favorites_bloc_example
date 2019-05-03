import 'package:favorites_app_bloc/blocs/favorites_bloc.dart';
import 'package:favorites_app_bloc/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: FavoriteBloc(),
      child: MaterialApp(
        home: PostScreen(),
      ),
    );
  }
}
