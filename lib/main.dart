import 'package:flutter/material.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/presentation.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await configureDependencies();

  runApp(const App());
}
