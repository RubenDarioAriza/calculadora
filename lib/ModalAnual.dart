import 'dart:math';

import 'package:flutter/material.dart';

class Anualidades extends StatefulWidget {
  @override
  _AnualidadesState createState() => _AnualidadesState();
}

class _AnualidadesState extends State<Anualidades> {
  double capital = 0.0;
  double tasainteres = 0.0;
  int tiempoA = 0;
  double valorAnualidad = 0.0;

  TextEditingController capitalController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();
  TextEditingController tiempoAController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anualidades'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _createSecondaryButtons('Anticipada');
                },
                child: Text('Anticipada'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Datos para anualidad diferida
                  _createSecondaryButtons('Diferida');
                },
                child: Text('Diferida'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Datos para anualidad vencida
                  _createSecondaryButtons('Vencida');
                },
                child: Text('Vencida'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Datos para anualidad ordinaria
                  _createSecondaryButtons('Ordinaria');
                },
                child: Text('Ordinaria'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para crear los cuatro botones secundarios
  void _createSecondaryButtons(String selectedAnnuityType) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(selectedAnnuityType),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Ingresar datos para Anualidad Simple'),
                            content: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      capital = double.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText:
                                          'Capital o ValorPresente si vas a calcular VF'),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      tasainteres = double.parse(value) /
                                          100; // Convertir porcentaje a fracción
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Tasa de Interés (%)'),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      tiempoA = int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Tiempo (Años)'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Cálculo del Valor Presente de la Anualidad Simple con los datos ingresados
                                    double factor =
                                        pow(1 + tasainteres, -tiempoA)
                                            .toDouble();
                                    valorAnualidad =
                                        capital * (1 - factor) / tasainteres;

                                    // Muestra el resultado
                                    Navigator.pop(
                                        context); // Cierra el diálogo de entrada de datos
                                    _showResult(
                                        'Valor Presente de la Anualidad Simple',
                                        valorAnualidad);
                                  },
                                  child: Text('Calcular VA'),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    // Cálculo del Valor Presente de la Anualidad Simple con los datos ingresados
                                    double factor =
                                        pow(1 + tasainteres, tiempoA)
                                            .toDouble();
                                    double valorFuturo = capital * factor;

                                    // Muestra el resultado
                                    Navigator.pop(
                                        context); // Cierra el diálogo de entrada de datos
                                    _showResult(
                                        'Valor Futuro de la Anualidad Simple',
                                        valorFuturo);
                                  },
                                  child: Text('Calcular VF'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Simple'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Ingresar datos para Anualidad Cierta'),
                            content: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      capital = double.parse(value);
                                    });
                                  },
                                  decoration:
                                      InputDecoration(labelText: 'Capital'),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      tasainteres = double.parse(value) /
                                          100; // Convertir porcentaje a fracción
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Tasa de Interés (%)'),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      tiempoA = int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Tiempo (Años)'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Cálculo del Valor Presente de la Anualidad Simple con los datos ingresados
                                    double factor =
                                        pow(1 + tasainteres, -tiempoA)
                                            .toDouble();
                                    double valorPresente =
                                        capital * ((1 - factor) / tasainteres);

                                    // Muestra el resultado
                                    Navigator.pop(
                                        context); // Cierra el diálogo de entrada de datos
                                    _showResult(
                                        'Valor Presente de la Anualidad Cierta',
                                        valorPresente);
                                  },
                                  child: Text('Calcular VA'),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    // Cálculo del Valor Presente de la Anualidad Simple con los datos ingresados
                                    double factor =
                                        pow(1 + tasainteres, tiempoA)
                                            .toDouble();
                                    double valorFuturo =
                                        capital * ((factor - 1) / tasainteres);

                                    // Muestra el resultado
                                    Navigator.pop(
                                        context); // Cierra el diálogo de entrada de datos
                                    _showResult(
                                        'Valor Presente de la Anualidad Cierta',
                                        valorFuturo);
                                  },
                                  child: Text('Calcular VF'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Cierta'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                Text('Ingresar datos para Anualidad Inmediata'),
                            content: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      capital = double.parse(value);
                                    });
                                  },
                                  decoration:
                                      InputDecoration(labelText: 'Capital'),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      tasainteres = double.parse(value) /
                                          100; // Convertir porcentaje a fracción
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Tasa de Interés (%)'),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      tiempoA = int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Tiempo (Años)'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Cálculo del Valor Presente de la Anualidad Inmediata con los datos ingresados
                                    double factor = 1 / (1 + tasainteres);
                                    double valorActual = capital *
                                        (1 - pow(factor, tiempoA)) /
                                        tasainteres;

                                    // Muestra el resultado
                                    Navigator.pop(
                                        context); // Cierra el diálogo de entrada de datos
                                    _showResult(
                                        'Valor Presente de la Anualidad Inmediata',
                                        valorActual);
                                  },
                                  child: Text('Calcular VA'),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    double factor =
                                        pow(1 + tasainteres, tiempoA)
                                            .toDouble();
                                    double valorFuturo =
                                        capital * ((factor - 1) / tasainteres);
                                    // Muestra el resultado
                                    Navigator.pop(
                                        context); // Cierra el diálogo de entrada de datos
                                    _showResult(
                                        'Monto de la Anualidad Inmediata',
                                        valorFuturo);
                                  },
                                  child: Text('Calcular VF'),
                                ),
                                // Método para calcular el valor futuro de la anualidad anticipada inmediata
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Inmediata'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// Método para mostrar el resultado en un diálogo
  void _showResult(String title, double result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text('Resultado: $result'),
        );
      },
    );
  }
  // Método para calcular el valor de la anualidad según el tipo seleccionado

// Método para calcular anualidad ordinaria según el tipo secundario
}
