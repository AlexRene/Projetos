import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasa_apod_app/app_widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}
