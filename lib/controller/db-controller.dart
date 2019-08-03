import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct_tutorial/model/TutorialProject.dart';

class DbController extends ResourceController {
  DbController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllProjects() async {
    final query = Query<TutorialProject>(context);

    final results = await query.fetch();

    return Response.ok(results);
  }
}
