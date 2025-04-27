import 'package:flutter/material.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/presentation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  runApp(const App());
}
