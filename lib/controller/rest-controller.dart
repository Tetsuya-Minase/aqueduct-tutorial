import 'package:aqueduct_tutorial/aqueduct_tutorial.dart';

class RestController extends ResourceController {
  @Operation.get('id')
  Future<Response> getProjectById(@Bind.path("id") int id) async {
    // GET /operation/:id
    print('get by id');
    return Response.ok(id);
  }

  @Operation.post()
  Future<Response> createProject(@Bind.body() Object body) async {
    // POST /operation
    print('post');
    return Response.ok(body);
  }

  @Operation.get()
  Future<Response> getAllProjects({@Bind.query("limit") int limit: 10}) async {
    // GET /operation
    print('get');
    return Response.ok({'result': [1,2,3]});
  }
}
