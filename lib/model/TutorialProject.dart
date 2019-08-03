import 'package:aqueduct/aqueduct.dart';

class TutorialProject extends ManagedObject<_TutorialProject> implements _TutorialProject {
  bool get isPastDue => dueDate.difference(DateTime.now()).inSeconds < 0;
}

class _TutorialProject  {
  @primaryKey
  int id;

  @Column(indexed: true)
  String name;

  DateTime dueDate;
}
