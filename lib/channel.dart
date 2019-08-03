import 'package:aqueduct_tutorial/controller/rest-controller.dart';

import 'aqueduct_tutorial.dart';
import 'controller/next-file-controller.dart';
import 'controller/project-controller.dart';
import 'controller/self-file-controller.dart';
import 'todo-config.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class AqueductTutorialChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    TodoConfig config = TodoConfig(options.configurationFilePath);

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    // projects/1, projects/2などにマッチする
    router
        .route("/projects/[:id]")
        .link(() => ProjectController());

    // `/file/`から始まる全パスにマッチする
    router
        .route("/file/*")
        .link(() => SelfFileController())
        .link(() => NextFileController());

    // /healthにマッチする
    router
        .route("/health")
        .linkFunction((req) async => Response.ok(null));

    router
        .route("/operation")
        .link(() => RestController());
    router
        .route("/operation/:id")
        .link(() => RestController());

    return router;
  }
}
