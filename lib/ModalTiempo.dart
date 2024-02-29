import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:core';

class CalcularTiempo extends StatefulWidget {
  @override
  _CalcularTiempoState createState() => _CalcularTiempoState();
}

class _CalcularTiempoState extends State<CalcularTiempo> {
  double anos = 0.0;
  double meses = 0.0;
  double dias = 0.0;
  double tiempo = 0.0;
  double tiempototal = 0.0;
  double tasainteres = 0.0;
  double intereses = 0.0;
  double capital = 0.0;
  double parteFraccionaria = 0.0;
  double diasRestantes = 0;
  double diasFinales = 0.0;
  double parteEntera = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiempo"),
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
                    hintText: 'Ingrese los intereses',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      intereses = double.parse(value);
                    });
                  },
                ),
              ),
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
                    tiempo = intereses / (capital * (tasainteres / 100));
                    tiempototal = double.parse(tiempo.toStringAsFixed(9));

                    parteEntera = tiempototal.floorToDouble();
                    parteFraccionaria = (tiempototal - parteEntera);

                    dias = (parteFraccionaria * 360).roundToDouble();
                    anos = (dias / 365).roundToDouble();
                    diasRestantes = (dias % 365);

                    meses = (diasRestantes / 30).floorToDouble();
                    diasFinales = diasRestantes % 30;
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
                              Text('tiempo:$tiempototal'),
                              Text(
                                  'Equivale a :años$anos,meses$meses,dias$diasFinales')

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
