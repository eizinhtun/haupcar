import 'package:flutter/material.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const App());
}
