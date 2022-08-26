import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubit/cubit.dart';
import 'package:tic_tac_toe/cubit/states.dart';
import 'package:tic_tac_toe/module/define_player_x.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GameCubit(),
      child: BlocConsumer<GameCubit,GameStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:  DefinePlayerX(),
          );
        },

      ),
    );
  }
}




