import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubit/states.dart';

class GameCubit extends Cubit<GameStates> {
  GameCubit() : super(GameInitialState());
  static GameCubit get(context) => BlocProvider.of(context);

  late String playerXName;
  late String playerOName;

   bool playerXWin=false;
   bool playerYWin=false;
   bool draw=false;

   bool isXTurn=true;

    String? box1FilledBy=null;
    String? box2FilledBy=null;
    String? box3FilledBy=null;
    String? box4FilledBy=null;
    String? box5FilledBy=null;
    String? box6FilledBy=null;
    String? box7FilledBy=null;
    String? box8FilledBy=null;
    String? box9FilledBy=null;

    int xWins=0;
    int yWins=0;

    String? lineDir = null;

    void changeTurn(){
      isXTurn= ! isXTurn;
      emit(GameChangeTurnState());
    }

    bool? checkWin(){
      if( box1FilledBy=='x' &&  box2FilledBy=='x' && box3FilledBy== 'x') {
      playerXWin = true;
      xWins+=1;
      lineDir='top';
      emit(GamePlayerWinState());
      return true;
    }
    if( box1FilledBy=='o' &&  box2FilledBy=='o' && box3FilledBy== 'o') {
      playerYWin = true;
      yWins+=1;
      lineDir='top';
      emit(GamePlayerWinState());
      return true;
    }

      if( box4FilledBy=='x' &&  box5FilledBy=='x' && box6FilledBy== 'x') {
        playerXWin = true;
        xWins+=1;
        lineDir='centerH';
        emit(GamePlayerWinState());
        return true;
      }
      if( box4FilledBy=='o' &&  box5FilledBy=='o' && box6FilledBy== 'o') {
        playerYWin = true;
        yWins+=1;
        lineDir='centerH';
        emit(GamePlayerWinState());
        return true;
      }

      if( box7FilledBy=='x' &&  box8FilledBy=='x' && box9FilledBy== 'x') {
        playerXWin = true;
        xWins+=1;
        lineDir='bottom';
        emit(GamePlayerWinState());
        return true;
      }
      if( box7FilledBy=='o' &&  box8FilledBy=='o' && box9FilledBy== 'o') {
        playerYWin = true;
        yWins+=1;
        lineDir='bottom';
        emit(GamePlayerWinState());
        return true;
      }

      if( box1FilledBy=='x' &&  box5FilledBy=='x' && box9FilledBy== 'x') {
        playerXWin = true;
        xWins+=1;
        lineDir='d1';
        emit(GamePlayerWinState());
        return true;
      }
      if( box1FilledBy=='o' &&  box5FilledBy=='o' && box9FilledBy== 'o') {
        playerYWin = true;
        yWins+=1;
        lineDir='d1';
        emit(GamePlayerWinState());
        return true;
      }

      if( box3FilledBy=='x' &&  box5FilledBy=='x' && box7FilledBy== 'x') {
        playerXWin = true;
        xWins+=1;
        lineDir='d2';
        emit(GamePlayerWinState());
        return true;
      }
      if( box3FilledBy=='o' &&  box5FilledBy=='o' && box7FilledBy== 'o') {
        playerYWin = true;
        yWins+=1;
        lineDir='d2';
        emit(GamePlayerWinState());
        return true;
      }
      if( box1FilledBy=='x' &&  box4FilledBy=='x' && box7FilledBy== 'x') {
        playerXWin = true;
        xWins+=1;
        lineDir='left';
        emit(GamePlayerWinState());
        return true;
      }
      if( box1FilledBy=='o' &&  box4FilledBy=='o' && box7FilledBy== 'o') {
        playerYWin = true;
        yWins+=1;
        lineDir='left';
        emit(GamePlayerWinState());
        return true;
      }

      if( box2FilledBy=='x' &&  box5FilledBy=='x' && box8FilledBy== 'x') {
        playerXWin = true;
        xWins+=1;
        lineDir='centerV';
        emit(GamePlayerWinState());
        return true;
      }
      if( box2FilledBy=='o' &&  box5FilledBy=='o' && box8FilledBy== 'o') {
        playerYWin = true;
        yWins+=1;
        lineDir='centerV';
        emit(GamePlayerWinState());
        return true;
      }
      if( box3FilledBy=='x' &&  box6FilledBy=='x' && box9FilledBy== 'x') {
        playerXWin = true;
        xWins+=1;
        lineDir='right';
        emit(GamePlayerWinState());
        return true;
      }
      if( box3FilledBy=='o' &&  box6FilledBy=='o' && box9FilledBy== 'o') {
        playerYWin = true;
        yWins+=1;
        lineDir='right';
        emit(GamePlayerWinState());
        return true;
      }

  }

  void reset(){
     box1FilledBy=null;
     box2FilledBy=null;
     box3FilledBy=null;
     box4FilledBy=null;
     box5FilledBy=null;
     box6FilledBy=null;
     box7FilledBy=null;
     box8FilledBy=null;
     box9FilledBy=null;
      playerXWin=false;
      playerYWin=false;
      draw=false;
      lineDir=null;
      emit(GameResetState());
  }

  void checkDraw(){
      if( box1FilledBy != null && box2FilledBy != null && box3FilledBy != null && box4FilledBy != null && box5FilledBy != null && box6FilledBy != null && box7FilledBy != null &&box8FilledBy != null &&box9FilledBy != null )
        {
          if(playerXWin==false && playerYWin==false){
            draw=true;
            emit(GamePlayerDrawState());
          }
        }

  }

}
