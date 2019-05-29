import 'dart:math';

class ResultBrain{
  final int peso;
  final int altura;

  ResultBrain({this.peso,this.altura});
  double bmi;
  String calcularBMI(int peso,int altura){
       //la forma para calcular el IMC es peso/altura^2

      //es necesario pasar esta altura a cm
      bmi = peso/pow(altura/100,2);//el ultimo numero es el exponente
     return bmi.toStringAsFixed(1);// de esta forma solo muestro 1 solo decimal y lo paso a cadena claro
  }

  String getResult(){
    if(bmi>=25){
      return 'Sobrepeso';
    }else if (bmi>18){
      return 'Normal';
    }else{
      return 'Peso bajo';
    }
  }

  String getMensaje(){
    if(bmi>=25){
      return 'Tienes mas peso del normal. Intenta hacer mas ejercicio';
    }else if (bmi>18){
      return 'Tu peso es el normal. Bien echo!';
    }else{
      return 'Tienes un peso mas bajo del normal. Intenta comer un poco mas';
    }
  }
}