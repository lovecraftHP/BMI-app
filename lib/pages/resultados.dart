import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:bmi_calculator/widgets/buttonBottom.dart';

const colors = Color(0xff1d1e33);

class Resultados extends StatefulWidget {
  final String resultado;
  final String mensaje;
  final String info;

  Resultados({this.resultado, this.mensaje,this.info});

  @override
  _ResultadosState createState() => _ResultadosState();
}

class _ResultadosState extends State<Resultados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20.0, left: 10.0),
                child: new Text(
                  'Resultados',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50.0),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: colors,
                cardChild: Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, //para darle espaciado vertical
                    children: <Widget>[
                      new Text(
                        widget.mensaje,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      ),
                      new Text(widget.resultado,
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 90.0)),
                      new Text(
                        widget.info,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ButtonBottom(
              title: 'Re-Calcular BMI',
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
