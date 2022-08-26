import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubit/cubit.dart';
import 'package:tic_tac_toe/cubit/states.dart';
import 'package:tic_tac_toe/module/game_screen.dart';
class DefinePlayerO extends StatelessWidget {
  var playerOController = TextEditingController();
  var fomKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.green,
                                Colors.blue,
                              ],
                            ),
                          ),
                        ),
                        Form(
                          key: fomKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 80),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.circle_outlined,
                                      color: Colors.green[300],
                                      size: 200,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      labelText: 'Enter O player Name',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.name,
                                    controller: playerOController,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      // border: Border.all(
                                      // ),
                                    ),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        if (fomKey.currentState!.validate()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                  context) {
                                                    return
                                                      GameScreen();
                                                  }));
                                          GameCubit.get(context).playerOName=playerOController.text;
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_back,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'GO',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        elevation: 8,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
