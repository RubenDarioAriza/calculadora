import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:core';

class CalcularInteres extends StatefulWidget {
  @override
  _CalcularInteresState createState() => _CalcularInteresState();
}

class _CalcularInteresState extends State<CalcularInteres> {
  int anos = 0;
  int meses = 0;
  int dias = 0;
  double capital = 0.0;
  double tasainteres = 0.0;
  double interes = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interes"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese el capital',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      capital = double.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese la cantidad de años',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      anos = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese la cantidad de meses',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      meses = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese la cantidad de dias',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      dias = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese la tasa de interes',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      tasainteres = double.parse(value);
                    });
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    interes = capital *
                        (tasainteres / 100) *
                        (anos + meses / 12 + dias / 360);
                    interes = double.parse((interes).toStringAsFixed(2));
                  });

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        // Contenido del BottomSheet
                        child: Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Intereses:$interes'),

                              // Agrega aquí los widgets que desees mostrar en el BttomSheet
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Calcular'),
              ),

              // Agrega aquí los widgets que desees mostrar en el BottomSheet
            ],
          ),
        ),
      ),
    );
  }
}
