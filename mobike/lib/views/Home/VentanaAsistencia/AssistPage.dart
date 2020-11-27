import 'package:flutter/material.dart';
import 'package:mobike/utils/constantes.dart';
import 'package:mobike/utils/responsivo.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistPage extends StatelessWidget {
  const AssistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            popPage(context);
          },
        ),
        centerTitle: true,
        title: Text("Asistencia"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CuerpoAsistencia(),
      ),
    );
  }
}

class CuerpoAsistencia extends StatefulWidget {
  @override
  createState() {
    return _CuerpoAsistenciaState();
  }
}

class _CuerpoAsistenciaState extends State<CuerpoAsistencia> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = '';
  String dropdownValue2 = '';
  double _valorSliderActual = 0;

  @override
  Widget build(BuildContext context) {
    final responsivo = Responsivo.of(context);
    return SizedBox(
      width: double.infinity,
      child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/sos.png"),
                      title: Text(
                        'NECESITO COMUNICARME CON LAS AUTORIDADES AHORA',
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: responsivo.diagonalPantalla(2)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Slider(
                          onChangeEnd: (double) {
                            print('por implementar');
                          },
                          activeColor: Color.fromRGBO(108, 99, 255, 1),
                          value: _valorSliderActual,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          label: _valorSliderActual.round().toString(),
                          onChanged: (double value) {
                            //_hacerLLamada(_valorSliderActual);
                            setState(() {
                              _valorSliderActual = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('RAZON: '),
                  Container(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Color.fromRGBO(108, 99, 255, 1),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Color.fromRGBO(108, 99, 255, 1),
                      ),
                      underline: Container(
                        height: 2,
                        color: Color.fromRGBO(108, 99, 255, 1),
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
                  ),
                ],
              ),

              ///
              /// SEGUNDA LISTA EN PANTALLA
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ID BICICLETA: '),
                  DropdownButton<String>(
                    value: dropdownValue2,
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Color.fromRGBO(108, 99, 255, 1),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: Color.fromRGBO(108, 99, 255, 1),
                    ),
                    underline: Container(
                      height: 2,
                      color: Color.fromRGBO(108, 99, 255, 1),
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
              introduccionContexto(dropdownValue),
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(108, 99, 255, 1),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.phonelink_ring),
                          onPressed: () {
                            launch('tel://+56957789533');
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
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
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextFormField(
          enabled: false,
          decoration: new InputDecoration(
            hintText: 'Ingrese el contexto  (opcional)',
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(20.0),
              borderSide: new BorderSide(),
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor ingrese un contexto';
            }
            return null;
          },
        ),
      );
    }
  }

  Widget introduccionContexto(String value) {
    if (value == 'Otro') {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text('Contexto', style: TextStyle(fontSize: 40.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: TextFormField(
              decoration: new InputDecoration(
                  hintText: 'Escriba el contexto',
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide())),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese un contexto';
                }
                return null;
              },
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Text('Contexto'),
          TextFormField(
            enabled: false,
            decoration: new InputDecoration(
                hintText: 'Escriba el Contexto',
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide())),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor ingrese un contexto';
              }
              return null;
            },
          ),
        ],
      );
    }
  }
}
