import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/factories/screen_factory.dart';

void main() {
  final screenFactory = ScreenFactory();
  runApp(screenFactory.makeApp());
}