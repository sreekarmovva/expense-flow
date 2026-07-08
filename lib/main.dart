//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:hive_flutter/hive_flutter.dart';
//import 'app/app.dart';

//void main() {
// Future<void> main() async {
//  WidgetsFlutterBinding.ensureInitialized();

//await Hive.initFlutter();

//await Hive.openBox('expenses');

//runApp(
//const ProviderScope(
//child: ExpenseFlowApp(),
//),
//);
//}
//}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('expenses');

  debugPrint(Hive.box('expenses').values.toString());
  debugPrint('Expenses box opened successfully');
  runApp(
    const ProviderScope(
      child: ExpenseFlowApp(),
    ),
  );
}
