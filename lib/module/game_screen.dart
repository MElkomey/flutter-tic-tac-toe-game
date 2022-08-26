import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tic_tac_toe/cubit/cubit.dart';
import 'package:tic_tac_toe/cubit/states.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = GameCubit.get(context);
    return BlocConsumer<GameCubit, GameStates>(
      listener: (context, state) {
        if (state is GamePlayerDrawState) {
          Fluttertoast.showToast(
              msg: "Draw",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb:2,
              backgroundColor: Colors.blueGrey,
              textColor: Colors.white,
              fontSize: 30.0);
        }
        if (cubit.playerYWin == true) {
          Fluttertoast.showToast(
              msg: "${cubit.playerOName} Wins",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              fontSize: 30.0);
        }
        if (cubit.playerXWin == true) {
          Fluttertoast.showToast(
              msg: "${cubit.playerXName} Wins",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              fontSize: 30.0);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
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
                      Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Container(
                                  color:
                                      cubit.isXTurn ? Colors.cyanAccent : null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${cubit.playerXName}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: Colors.blue.shade900,
                                          size: 50,
                                        ),
                                      ),
                                      Text(
                                        '${cubit.xWins} wins',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          Row(
                                            children: [
                                              Builder(builder: (context) {
                                                if (cubit.box1FilledBy ==
                                                    null) {
                                                  if (cubit.playerXWin ==
                                                          true ||
                                                      cubit.playerYWin ==
                                                          true) {
                                                    return buildEmptyNoFill();
                                                  }
                                                  return buildEmptyCell(
                                                      1, cubit);
                                                } else {
                                                  return buildFilledCell(
                                                      filledWith:
                                                          '${cubit.box1FilledBy}');
                                                }
                                              }),
                                              Builder(builder: (context) {
                                                if (cubit.box2FilledBy ==
                                                    null) {
                                                  if (cubit.playerXWin ==
                                                          true ||
                                                      cubit.playerYWin ==
                                                          true) {
                                                    return buildEmptyNoFill();
                                                  }
                                                  return buildEmptyCell(
                                                      2, cubit);
                                                } else {
                                                  return buildFilledCell(
                                                      filledWith:
                                                          '${cubit.box2FilledBy}');
                                                }
                                              }),
                                              Builder(builder: (context) {
                                                if (cubit.box3FilledBy ==
                                                    null) {
                                                  if (cubit.playerXWin ==
                                                          true ||
                                                      cubit.playerYWin ==
                                                          true) {
                                                    return buildEmptyNoFill();
                                                  }
                                                  return buildEmptyCell(
                                                      3, cubit);
                                                } else {
                                                  return buildFilledCell(
                                                      filledWith:
                                                          '${cubit.box3FilledBy}');
                                                }
                                              }),
                                            ],
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Builder(builder: (context) {
                                            if (cubit.box4FilledBy == null) {
                                              if (cubit.playerXWin == true ||
                                                  cubit.playerYWin == true) {
                                                return buildEmptyNoFill();
                                              }
                                              return buildEmptyCell(4, cubit);
                                            } else {
                                              return buildFilledCell(
                                                  filledWith:
                                                      '${cubit.box4FilledBy}');
                                            }
                                          }),
                                          Builder(builder: (context) {
                                            if (cubit.box5FilledBy == null) {
                                              if (cubit.playerXWin == true ||
                                                  cubit.playerYWin == true) {
                                                return buildEmptyNoFill();
                                              }
                                              return buildEmptyCell(5, cubit);
                                            } else {
                                              return buildFilledCell(
                                                  filledWith:
                                                      '${cubit.box5FilledBy}');
                                            }
                                          }),
                                          Builder(builder: (context) {
                                            if (cubit.box6FilledBy == null) {
                                              if (cubit.playerXWin == true ||
                                                  cubit.playerYWin == true) {
                                                return buildEmptyNoFill();
                                              }
                                              return buildEmptyCell(6, cubit);
                                            } else {
                                              return buildFilledCell(
                                                  filledWith:
                                                      '${cubit.box6FilledBy}');
                                            }
                                          }),
                                        ],
                                      )),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Builder(builder: (context) {
                                            if (cubit.box7FilledBy == null) {
                                              if (cubit.playerXWin == true ||
                                                  cubit.playerYWin == true) {
                                                return buildEmptyNoFill();
                                              }
                                              return buildEmptyCell(7, cubit);
                                            } else {
                                              return buildFilledCell(
                                                  filledWith:
                                                      '${cubit.box7FilledBy}');
                                            }
                                          }),
                                          Builder(builder: (context) {
                                            if (cubit.box8FilledBy == null) {
                                              if (cubit.playerXWin == true ||
                                                  cubit.playerYWin == true) {
                                                return buildEmptyNoFill();
                                              }
                                              return buildEmptyCell(8, cubit);
                                            } else {
                                              return buildFilledCell(
                                                  filledWith:
                                                      '${cubit.box8FilledBy}');
                                            }
                                          }),
                                          Builder(builder: (context) {
                                            if (cubit.box9FilledBy == null) {
                                              if (cubit.playerXWin == true ||
                                                  cubit.playerYWin == true) {
                                                return buildEmptyNoFill();
                                              }
                                              return buildEmptyCell(9, cubit);
                                            } else {
                                              return buildFilledCell(
                                                  filledWith:
                                                      '${cubit.box9FilledBy}');
                                            }
                                          }),
                                        ],
                                      )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            if (cubit.lineDir == 'left')
                                            Expanded(
                                                child: Container(
                                              width: 5,
                                              color: Colors.yellowAccent,
                                            )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            if (cubit.lineDir == 'centerV')
                                            Expanded(
                                                child: Container(
                                              width: 5,
                                              color: Colors.yellowAccent,
                                            )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            if (cubit.lineDir == 'right')
                                            Expanded(
                                                child: Container(
                                              width: 5,
                                              color: Colors.yellowAccent,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            if (cubit.lineDir == 'top')
                                              Expanded(
                                                  child: Container(
                                                height: 5,
                                                color: Colors.yellowAccent,
                                              )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            if (cubit.lineDir == 'centerH')
                                              Expanded(
                                                  child: Container(
                                                height: 5,
                                                color: Colors.yellowAccent,
                                              )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            if (cubit.lineDir == 'bottom')
                                              Expanded(
                                                  child: Container(
                                                height: 5,
                                                color: Colors.yellowAccent,
                                              )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (cubit.lineDir == 'd1')
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60.0, top: 70),
                                      child: Transform(
                                        transform: Matrix4.rotationZ(-.7),
                                        child: Container(
                                          width: 5,
                                          color: Colors.yellowAccent,
                                        ),
                                      ),
                                    ),
                                  if (cubit.lineDir == 'd2')
                                    Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 60.0, top: 70),
                                        child: Transform(
                                          transform: Matrix4.rotationZ(0.7),
                                          child: Container(
                                            width: 5,
                                            color: Colors.yellowAccent,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: cubit.isXTurn == false
                                    ? Colors.cyanAccent
                                    : null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (cubit.playerXWin == true ||
                                        cubit.playerYWin == true ||
                                        cubit.draw == true)
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: MaterialButton(
                                              onPressed: () {
                                                cubit.reset();
                                              },
                                              padding: EdgeInsets.zero,
                                              child: Icon(
                                                Icons.restart_alt_rounded,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text('Reset'),
                                        ],
                                      ),
                                    Text(
                                      '${cubit.playerOName}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Icon(
                                        Icons.circle_outlined,
                                        color: Colors.green.shade900,
                                        size: 50,
                                      ),
                                    ),
                                    Text(
                                      '${cubit.yWins} wins',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildEmptyCell(int boxNumber, cubit) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          if (cubit.playerXWin == false ||
              cubit.playerYWin == false ||
              cubit.draw == false) {
            if (boxNumber == 1) {
              if (cubit.isXTurn == true)
                cubit.box1FilledBy = 'x';
              else
                cubit.box1FilledBy = 'o';
            }

            if (boxNumber == 2) {
              if (cubit.isXTurn == true)
                cubit.box2FilledBy = 'x';
              else
                cubit.box2FilledBy = 'o';
            }
            if (boxNumber == 3) {
              if (cubit.isXTurn == true)
                cubit.box3FilledBy = 'x';
              else
                cubit.box3FilledBy = 'o';
            }
            if (boxNumber == 4) {
              if (cubit.isXTurn == true)
                cubit.box4FilledBy = 'x';
              else
                cubit.box4FilledBy = 'o';
            }
            if (boxNumber == 5) {
              if (cubit.isXTurn == true)
                cubit.box5FilledBy = 'x';
              else
                cubit.box5FilledBy = 'o';
            }
            if (boxNumber == 6) {
              if (cubit.isXTurn == true)
                cubit.box6FilledBy = 'x';
              else
                cubit.box6FilledBy = 'o';
            }
            if (boxNumber == 7) {
              if (cubit.isXTurn == true)
                cubit.box7FilledBy = 'x';
              else
                cubit.box7FilledBy = 'o';
            }
            if (boxNumber == 8) {
              if (cubit.isXTurn == true)
                cubit.box8FilledBy = 'x';
              else
                cubit.box8FilledBy = 'o';
            }
            if (boxNumber == 9) {
              if (cubit.isXTurn == true)
                cubit.box9FilledBy = 'x';
              else
                cubit.box9FilledBy = 'o';
            }
            cubit.changeTurn();
            cubit.checkWin();
            cubit.checkDraw();
          }
        },
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(.5),
          child: Container(),
        ),
      ),
    ));
  }

  Widget buildFilledCell({
    required String filledWith,
  }) =>
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: filledWith == 'x' ? Colors.blue[300] : Colors.green[300],
          ),
          child: Icon(
            filledWith == 'x' ? Icons.close_rounded : Icons.circle_outlined,
            color: Colors.white,
            size: 100,
          ),
        ),
      ));

  Widget buildEmptyNoFill() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withOpacity(.5),
        child: Container(),
      ),
    ));
  }
}
