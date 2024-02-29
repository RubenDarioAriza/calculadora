import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:pro0030/ModalCapital.dart';
import 'package:pro0030/ModalInteres.dart';
import 'package:pro0030/ModalMonto.dart';
import 'package:pro0030/ModalTasaInteres.dart';
import 'package:pro0030/ModalTiempo.dart';

void MenuBottom(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            title: Text("Regresar"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalcularMonto()),
                  );
                },
                child: Text("Monto"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalcularInteres()),
                  );
                },
                child: Text("Interes"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalcularCapital()),
                  );
                },
                child: Text("capital"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalcularTasaInteres()),
                  );
                },
                child: Text("tasa de interes"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalcularTiempo()),
                  );
                },
                child: Text("tiempo"),
              ),
            ),
          ),
        ],
      );
    },
  );
}
