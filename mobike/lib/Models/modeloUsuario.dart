class ModeloUsuario {
  String uid = '';
  String rut,
      displayName,
      apellido,
      comuna,
      direccion,
      correo,
      clave,
      avatarUrl;
  int numeroTarjeta, celular;
  ModeloUsuario(
    this.uid, {
    this.rut,
    this.displayName,
    this.avatarUrl,
    this.apellido,
    this.comuna,
    this.direccion,
    this.correo,
    this.clave,
  });
}
