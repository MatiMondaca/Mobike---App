import 'package:mobike/Controllers/controladorFirebase.dart';
import 'package:mobike/Controllers/controladorAlmacenamiento.dart';
import 'package:mobike/Controllers/controladorUsuario.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<ControladorFirebase>(ControladorFirebase());
  locator.registerSingleton<ControladorAlmacenamiento>(ControladorAlmacenamiento());
  locator.registerSingleton<UserController>(UserController());
}
