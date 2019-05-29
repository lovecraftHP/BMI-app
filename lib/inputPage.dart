import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/reusableCard.dart';
import 'package:bmi_calculator/widgets/buttonBottom.dart';

import 'pages/resultados.dart';
import 'pages/resultBrain.dart';

/**
 * IMPORTANTE PARA RECORDAR!
 * existe un widget que es RawMaterialButton, que sirver para hacer cualquier cantidad
 * de botones como los que yo quiera,BUSCALO
 */
const colors = Color(0xff1d1e33);
//siempre me preguntaba como hacer algo que estuviera o no activo...pues facil
//le cambias el color cuando lo presionan y ya
const inActiveColor = Color(0xff111328);
const containerColor = 0xffeb1555;
const TextStyle titleStyle = TextStyle(fontSize: 20.0);
const TextStyle numberStyle =
    TextStyle(fontWeight: FontWeight.w900, fontSize: 50);
enum Genre { male, female } // para un futuro refactoring

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genre _selectGenre;
  int _height = 180;
  int _weight = 60;
  int _edad = 20;
  ResultBrain _result = ResultBrain();

  Widget _genreIcons(IconData icono, String texto) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: new Icon(
          icono,
          size: 80.0,
          color: Color(0xff8d8e98),
        )),
        SizedBox(
          height: 10.0,
        ),
        Center(
            child: new Text(
          texto.toUpperCase(),
          style: TextStyle(fontSize: 15.0),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*
             *aqui hay varias cosas que aclarar
             1. es necesario poner un expanded, para que ocupe toda la sona de arriba
             2. como quiero que sean 2 elementos (uno al lado del otro) pongo un Row
             3. cada uno de esos elementos quiero que ocupe el maximo espacio, por lo que llevan otro Expanded
             4. ahora si pon el container
             */
            new Expanded(
                child: new Row(
              children: <Widget>[
                new Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      _selectGenre = Genre.male;
                    });
                  },
                  colour: _selectGenre == Genre.male ? colors : inActiveColor,
                  cardChild: _genreIcons(FontAwesomeIcons.mars, 'Masculino'),
                )),
                new Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      _selectGenre = Genre.female;
                    });
                  },
                  colour: _selectGenre == Genre.female ? colors : inActiveColor,
                  cardChild: _genreIcons(FontAwesomeIcons.venus, 'Femenino'),
                )),
              ],
            )),
            new Expanded(
              child: new ReusableCard(
                colour: colors,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text('Altura'.toUpperCase(), style: titleStyle),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .baseline, //para poner todo en la misma base
                      //pero dara error por lo que hay que poner este parametro
                      textBaseline: TextBaseline
                          .alphabetic, //este, si fuera numeros hay otro parametro
                      children: <Widget>[
                        new Text(
                          '$_height',
                          style: numberStyle,
                        ),
                        new Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      //con este widget se puede personalizar el slider
                      data: SliderTheme.of(context).copyWith(
                          //es lo mismo que con os otros temas
                          //de echo es mejor, porque este parametro necesita como 20 parametros
                          //asi que de esta forma solo modificariamos lo necesario

                          //simplemente para darle un color a la barra diferente al thum
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xffeb1555),
                          overlayColor:
                              Color(0x29eb1555), //el color del overlay
                          //con este podemos cambiar el tamaño del thumb
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0), // por defecto es 6.0
                          //ahora si lo que quiero es que tenga una especie de efecto alrededor del thumb
                          //cuando lo selecciono, uso overlayShape
                          overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 32.0) //por defecto es 16
                          ),
                      child: new Slider(
                        value: _height.toDouble(),
                        min: 120.0, //altura minima
                        max: 240.0, //altura maxima
                        inactiveColor: Color(0xff8d8e98),
                        onChanged: (double value) {
                          //espera un valor tipo doble
                          setState(() {
                            _height = value.round(); //porque es un entero
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Expanded(
                child: new Row(
              children: <Widget>[
                new Expanded(
                    child: ReusableCard(
                  colour: colors,
                  cardChild: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'PESO',
                        style: titleStyle,
                      ),
                      new Text(
                        '$_weight',
                        style: numberStyle,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              if (_weight >= 0) {
                                setState(() {
                                  _weight++;
                                });
                              }
                            },
                          ),
                          new RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                _weight = _weight <= 0 ? 0 : _weight - 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                new Expanded(
                    child: ReusableCard(
                  colour: colors,
                  cardChild: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'EDAD',
                        style: titleStyle,
                      ),
                      new Text(
                        '$_edad',
                        style: numberStyle,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              if (_weight >= 0) {
                                setState(() {
                                  _edad++;
                                });
                              }
                            },
                          ),
                          new RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                _edad = _edad <= 0 ? 0 : _edad - 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )),
            new Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Color(containerColor),
              width: double
                  .infinity, //el ancho de la pantalla de cualquier dispositivo
              height: 70.0,
              child: Center(
                child: ButtonBottom(
                  title: 'Calcular BMI',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => new Resultados(
                            resultado: _result.calcularBMI(_weight, _height),
                            mensaje: _result.getResult(),
                            info: _result.getMensaje(),
                            )));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//pasa que al tener muchos floatingactionButtons ocurre un error porque todos tienen
//el mismo tagHero que los identifica, ese tag debe ser unico, asi que la mejor manera
//de arreglar esa pendejada es crear un boton propio bien simpaticon
//para eso usare RawMaterialButton que es un widget que te permite crear un boton como uno quiera

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xff4c4f5e), //color
      shape: CircleBorder(), //forma...busca la clase ShapeBorder
      //no existe un tamaño sino constrains
      constraints: BoxConstraints.tightFor(
        //ajustado porque sino saldria una vaina enorme
        width:
            56.0, //asi como esta seria un perfecto cuadrado, pero tenermos en el shape que sea circular
        height: 56.0,
      ),
      onPressed: onPress,
      elevation: 6.0,
      child: new Icon(icon),
    );
  }
}

/**
 * //si queremos agregarle un tema a un widget en especifico
      //simplemente es necesario agrega un widget Theme y agregar lo que queremos 
      //a la propiedad data
      floatingActionButton: new Theme(
        data: ThemeData(
          accentColor: Colors.purpleAccent//o podriamos poner ThemeData.ligth y cambiar el color al tema claro
        ),
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
        ),
      ),
 */
