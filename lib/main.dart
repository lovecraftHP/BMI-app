import 'package:flutter/material.dart';
import 'inputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //si hay un tema por defecto que cumpla con lo que queremos(un tema oscuro en este caso)
      //pero solo queremos cambiar ciertas cosas podemos hacer lo siguiente
      theme: ThemeData.dark().copyWith(
        //creando un tema, normal.
        //TODO: instala colorzilla
        primaryColor: Color(0xFF0A0E21),
        //canvasColor: Colors.red// este es para darle, color al fondo como tal
        //pero si hay un scaffold lo correcto seria darle a esa propiedad
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(//tema pero para las letras
        //   body1: TextStyle(color: Colors.white)
        // )
      ),
      home: InputPage(),
      // routes: {
      //   '/results': (context) => Resultados()
      // },
    );
  }
}

