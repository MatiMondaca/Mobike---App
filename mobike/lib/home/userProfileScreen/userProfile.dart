import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: new Text(
            "Perfil",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.all(10.0),
             
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Icon(
                  Icons.person,
                  size: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Saldo:'),
                ),
                
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: TextFormField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                        labelText: '                 1000' ,
                        enabled: false,),

                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("Rut:"),
                ),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  
                  decoration: InputDecoration(
                  
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      labelText: '     25.123.568-9',
                      enabled: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Nombre:"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      labelText: '     Juan',
                      enabled: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Apellido:"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      labelText: '     Fernandez',
                      enabled: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Correo:"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70)),
                      labelText: '     Ejemplo@gmail.com',
                      enabled: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Contraseña:"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70)),
                    labelText: '     ***********',
                    enabled: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Confirmar Contraseña:"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70)),
                      labelText: '     25253698',
                      enabled: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text("        Actualizar Contraseña        ")),
                ),
                
              ],
            ),
          ),
        
      ),
      ),
    );
  }
}
