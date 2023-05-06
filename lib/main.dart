import 'package:drugger/service/services.dart';
import 'package:flutter/material.dart';

import 'core/app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices() ;
  runApp(const MyApp());
}