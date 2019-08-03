import 'package:aqueduct_tutorial/aqueduct_tutorial.dart';

class NextFileController extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    print('nextFileController');
    return Response.ok(null);
  }
}
