import 'package:first_game/game_controller.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async{
  Util flameUtil =Util ();
  //ignores status bar at the top of App
  await flameUtil.fullScreen();
  //locks the devices at portrait
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  GameController gamecontroller = GameController();
  
  runApp(gamecontroller.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown =gamecontroller.onTapDown;
  flameUtil.addGestureRecognizer(tapper);

}