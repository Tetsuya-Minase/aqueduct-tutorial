import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

class TodoConfig extends Configuration {
  TodoConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
  int port;
}
