import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistPage extends StatefulWidget {
  @override
  createState() {
    return _AssistPageState();
  }
}

class _AssistPageState extends State<AssistPage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = '';
  String dropdownValue2 = '';
  double _valorSliderActual = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            //////
            /// APPBAR
            ///
            ///
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Asistencia',
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.deepOrange])),
              ),
            ),
            body: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                        child: Column(
                      children: <Widget>[
                        ListTile(
                            leading: Image.asset("assets/sos.png"),
                            title: Center(
                                child: Text(
                                    'NECESITO COMUNICARME CON LAS AUTORIDADES AHORA'))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Slider(
                                onChangeEnd: (double) {
                                  print('por implementar');
                                },
                                activeColor: Colors.red,
                                value: _valorSliderActual,
                                min: 0,
                                max: 100,
                                divisions: 100,
                                label: _valorSliderActual.round().toString(),
                                onChanged: (double value) {
                                  _hacerLLamada(_valorSliderActual);
                                  setState(() {
                                    _valorSliderActual = value;
                                  });
                                })
                          ],
                        )
                      ],
                    )),
                    Row(
                      children: [
                        Text('Razón: '),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              //CAMBIAR ESTO A POSTERIOR, SOLO ES UN PLACEHOLDER
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            '',
                            'Malfuncionamiento',
                            'Sufrí un robo',
                            'No puedo desbloquear',
                            'Otro'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Text(
                      'Contexto',
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Ingrese el contexto(opcional)',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor ingrese un contexto';
                        }
                        return null;
                      },
                    ),

                    ///
                    /// SEGUNDA LISTA EN PANTALLA
                    ///
                    Row(
                      children: [
                        Text('ID BICICLETA: '),
                        DropdownButton<String>(
                          value: dropdownValue2,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              //CAMBIAR ESTO A POSTERIOR, SOLO ES UN PLACEHOLDER
                              dropdownValue2 = newValue;
                            });
                          },
                          items: <String>[
                            '',
                            'Utilizar el del ultimo viaje',
                            'Introducir'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    introduccionDatos(dropdownValue2),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              //CAMBIAR ESTO A POSTERIOR, SOLO ES UN PLACEHOLDER
                              dropdownValue2 = '';
                              dropdownValue = '';
                            });
                            // Process data.
                          }
                        },
                        child: Text('Enviar'),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget introduccionDatos(String value) {
    if (value == 'Introducir') {
      return TextFormField(
        decoration: const InputDecoration(
          hintText: 'Ingrese el id de la bicicleta(opcional)',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Por favor ingrese un contexto';
          }
          return null;
        },
      );
    } else {
      return TextFormField(
        enabled: false,
        decoration: const InputDecoration(
          hintText: 'Ingrese el contexto(opcional)',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Por favor ingrese un contexto';
          }
          return null;
        },
      );
    }
  }

  void _hacerLLamada(double porcentaje) {
    if (porcentaje == 100) {
      launch("tel:+56981746116");
    }
  }
}
