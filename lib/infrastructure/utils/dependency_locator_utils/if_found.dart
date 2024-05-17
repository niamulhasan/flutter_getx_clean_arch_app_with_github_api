import 'dart:developer';

T? ifFound<T>(List dependencies, Function callback, [Function? elseCallback]) {
  if (dependencies.isEmpty || dependencies.contains(null)) {
    log("\n");
    log("⚠️ Skipping callback as no dependencies were provided.");
    log("Dependencies: ${_prettifyDependenciesPrint(dependencies)}");
    log("Callback Type: ${callback.toString().split("=>")[1]}");
    if (elseCallback != null) {
      elseCallback();
    }
    return null;
  }
  return callback();
}

String _prettifyDependenciesPrint(List<Object?>? instances) {
  if (instances == null) return "null";
  return instances.map((e) => e.runtimeType.toString()).join(", ");
}
