class Cliente {
  String _rut, _nombre, _apellido, _comuna, _direccion, _correo, _clave;
  int _numeroTarjeta, _numeroCasa, _celular;

  Cliente(
    String rut,
    String nombre,
    String apellido,
    String comuna,
    int numeroTarjeta,
    String direcion,
    int numeroCasa,
    String clave,
    int celular,
  ) {
    this._rut = rut;
    this._nombre = nombre;
    this._apellido = apellido;
    this._comuna = comuna;
    this._numeroTarjeta = numeroTarjeta;
    this._direccion = direcion;
    this._numeroCasa = numeroCasa;
    this._correo = correo;
    this._clave = clave;
    this._celular = celular;
  }

  String get rut => _rut;
  String get nombre => _nombre;
  String get apellido => _apellido;
  String get comuna => _comuna;
  int get numeroTarjeta => _numeroTarjeta;
  String get direccion => _direccion;
  int get numeroCasa => _numeroCasa;
  String get correo => _correo;
  String get clave => _clave;
  int get celular => _celular;
}
