import 'package:calculadora/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget{
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _historial="";
  String _expression = "";
  void clear(String text){
    setState(() {
      _expression ="";//Esto es para limpiar      
    });

  }

  void allClear(String text){
    setState(() {
      _historial ="";
      _expression ="";      
    });

  }
  //funcion que nos va permitir hacer los calculos
  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _historial =_expression;
      _expression=exp.evaluate(EvaluationType.REAL, cm).toString
      ();
    });
  }

  void numClick(String text){
    setState(() {
      _expression+=text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: const Color(0xB1035B96),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child:  Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _historial,
                  style: GoogleFonts.rubik(
                    textStyle: 
                    const TextStyle(fontSize: 24,color:
                   Color(0xFFFFFFFF))),
                   ),
                ),
              ),
              Container(
                //decoration: BoxDecoration(
                //      color: Color.fromARGB(178, 3, 91, 150),
                //      borderRadius: BorderRadius.circular(20),
                //        ),
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: (
                    Text(_expression,style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white
                        )
                    ), )
                  ),
                  ),
              ),
              Row(//cada row se refiere a cada fila
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    bgcolor: 0xFFfa070d,
                    text: "AC",
                    callback: allClear,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xFFf2676a,
                    text: "C",
                    callback: clear,//pasamos lo que se ba limpiar
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "%",
                    callback: numClick,//esto se pasa desde la funcion
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xFFefa333,
                    text: "/",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "7",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "8",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "9",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xFFefa333,
                    text: "*",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "4",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "5",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "6",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xFFefa333,
                    text: "-",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "1",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "2",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "3",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xFFefa333,
                    text: "+",
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: ".",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "0",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "00",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xFF27cf55,
                    text: "=",
                    callback: evaluate,
                    textSize: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}