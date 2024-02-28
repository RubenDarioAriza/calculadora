import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class InteresSimple extends StatefulWidget {
  @override
  _InteresSimpleState createState() => _InteresSimpleState();
}

class _InteresSimpleState extends State<InteresSimple> {
  double capital = 0.0;
  double tasainteres = 0.0;
  int tiempo = 0;
  double interes = 0.0;

  @override
  Widget build(BuildContext context) {
    var child;
    return Scaffold(
      appBar: AppBar(
        title: Text('Interes Simple'),
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
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese el tiempo(años)',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      tiempo = int.parse(value);
                    });
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    interes = (capital * tasainteres * tiempo) / 100;
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
                              Text('Interes simple: $interes'),

                              // Agrega aquí los widgets que desees mostrar en el BottomSheet
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
