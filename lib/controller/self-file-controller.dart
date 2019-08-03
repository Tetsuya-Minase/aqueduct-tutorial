import 'package:aqueduct_tutorial/aqueduct_tutorial.dart';

class SelfFileController extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
      print('selfFileController');
      return request;
  }
}
