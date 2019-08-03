import 'package:aqueduct_tutorial/aqueduct_tutorial.dart';

class ProjectController extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    if (request.raw.headers.value("x-secret-key") == "secret!") {
      return request;
    }

    return Response.badRequest();
  }
}
