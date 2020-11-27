class ModeloUsuario {
  String uid;
  String rut;
  String displayName;

  String comuna;
  String direccion;
  String correo;
  String clave;
  String avatarUrl;
  String numeroTarjeta;
  String celular;

  String get getUid => uid;
  set setUid(String uid) => this.uid = uid;
  String get getRut => rut;
  set setRut(String rut) => this.rut = rut;
  String get getDisplayName => displayName;
  set setDisplayName(String displayName) => this.displayName = displayName;

  String get getComuna => comuna;
  set setComuna(String comuna) => this.comuna = comuna;
  String get getDireccion => direccion;
  set setDireccion(String direccion) => this.direccion = direccion;
  String get getCorreo => correo;
  set setCorreo(String correo) => this.correo = correo;
  String get getClave => clave;
  set setClave(String clave) => this.clave = clave;
  String get getAvatarUrl => avatarUrl;
  set setAvatarUrl(String avatarUrl) => this.avatarUrl = avatarUrl;
  String get getCelular => celular;
  set setCelular(String celular) => this.celular = celular;

  ModeloUsuario({
    this.uid,
    this.rut,
    this.displayName,
    this.avatarUrl,
    this.comuna,
    this.direccion,
    this.correo,
    this.clave,
  });
}
