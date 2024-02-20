import 'dart:math';

import 'package:flutter/material.dart';
import 'button_values.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:scientific/pages/drawer_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = "0";
  String result = "0";
  String expression = "";
  String answer = "";
  String setVar = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  Map<String, String> varMap = {
    "A": "0",
    "B": "0",
    "C": "0",
    "D": "0",
  };
  List<String> varList = [];
  bool degMod = true;
  bool lastEqual = false;
  bool firstVar = false;
  bool setVarMode = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          'Scientific Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },),
        ),
      ),
      drawer: SearchDrawer(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // equation
            Container(
              height: screenSize.height /
                  3, // Adjust the height for the output area
              width: screenSize.width, // Adjust the width for the output area
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Color(
                    0xFF7B8B6F), // Set the background color for the calculator screen
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.3), // Set the shadow color
                    spreadRadius: 2, // Set the spread radius
                    blurRadius: 5, // Set the blur radius
                    offset: Offset(0, 3), // Set the shadow offset
                  ),
                ],
              ),
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: (Text(
                          degMod ? "Deg" : "Rad",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        )),
                      ),
                      Text(
                        equation,
                        style: TextStyle(
                          fontSize: equationFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        setVarMode ? "$setVar = $result" : result,
                        style: TextStyle(
                          fontSize: resultFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ),
              ),
            ),
            // output
            // buttons
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: value == Btn.mode
                          ? screenSize.width / 6
                          : value == Btn.percentage
                              ? screenSize.width / 6
                              : value == Btn.inverse
                                  ? screenSize.width / 6
                                  : value == Btn.factorial
                                      ? screenSize.width / 6
                                      : value == Btn.power
                                          ? screenSize.width / 6
                                          : value == Btn.root
                                              ? screenSize.width / 6
                                              : value == Btn.fraction
                                                  ? screenSize.width / 6
                                                  : value == Btn.conversion
                                                      ? screenSize.width / 6
                                                      : value == Btn.log2
                                                          ? screenSize.width / 6
                                                          : value ==
                                                                  Btn
                                                                      .exponential
                                                              ? screenSize
                                                                      .width /
                                                                  6
                                                              : value ==
                                                                      Btn
                                                                          .naturallog
                                                                  ? screenSize
                                                                          .width /
                                                                      6
                                                                  : value ==
                                                                          Btn
                                                                              .exppower
                                                                      ? screenSize
                                                                              .width /
                                                                          6
                                                                      : value ==
                                                                              Btn.logarithm
                                                                          ? screenSize.width / 6
                                                                          : value == Btn.negative
                                                                              ? screenSize.width / 6
                                                                              : value == Btn.combination
                                                                                  ? screenSize.width / 6
                                                                                  : value == Btn.permutation
                                                                                      ? screenSize.width / 6
                                                                                      : value == Btn.calculation
                                                                                          ? screenSize.width / 6
                                                                                          : value == Btn.constant
                                                                                              ? screenSize.width / 6
                                                                                              : value == Btn.sine
                                                                                                  ? screenSize.width / 6
                                                                                                  : value == Btn.cosine
                                                                                                      ? screenSize.width / 6
                                                                                                      : value == Btn.tangent
                                                                                                          ? screenSize.width / 6
                                                                                                          : value == Btn.sineinv
                                                                                                              ? screenSize.width / 6
                                                                                                              : value == Btn.cosinv
                                                                                                                  ? screenSize.width / 6
                                                                                                                  : value == Btn.taninv
                                                                                                                      ? screenSize.width / 6
                                                                                                                      : value == Btn.openbracket
                                                                                                                          ? screenSize.width / 6
                                                                                                                          : value == Btn.closebracket
                                                                                                                              ? screenSize.width / 6
                                                                                                                              : value == Btn.A
                                                                                                                                  ? screenSize.width / 6
                                                                                                                                  : value == Btn.B
                                                                                                                                      ? screenSize.width / 6
                                                                                                                                      : value == Btn.D
                                                                                                                                          ? screenSize.width / 6
                                                                                                                                          : value == Btn.comma
                                                                                                                                              ? screenSize.width / 6
                                                                                                                                              : (screenSize.width / 5),
                      height: value == Btn.mode
                          ? screenSize.height / 20
                          : value == Btn.percentage
                              ? screenSize.height / 20
                              : value == Btn.inverse
                                  ? screenSize.height / 20
                                  : value == Btn.factorial
                                      ? screenSize.height / 20
                                      : value == Btn.power
                                          ? screenSize.height / 20
                                          : value == Btn.root
                                              ? screenSize.height / 20
                                              : value == Btn.fraction
                                                  ? screenSize.height / 20
                                                  : value == Btn.conversion
                                                      ? screenSize.height / 20
                                                      : value == Btn.log2
                                                          ? screenSize.height /
                                                              20
                                                          : value ==
                                                                  Btn
                                                                      .exponential
                                                              ? screenSize
                                                                      .height /
                                                                  20
                                                              : value ==
                                                                      Btn
                                                                          .naturallog
                                                                  ? screenSize
                                                                          .height /
                                                                      20
                                                                  : value ==
                                                                          Btn
                                                                              .exppower
                                                                      ? screenSize
                                                                              .height /
                                                                          20
                                                                      : value ==
                                                                              Btn
                                                                                  .logarithm
                                                                          ? screenSize.height /
                                                                              20
                                                                          : value == Btn.negative
                                                                              ? screenSize.height / 20
                                                                              : value == Btn.combination
                                                                                  ? screenSize.height / 20
                                                                                  : value == Btn.permutation
                                                                                      ? screenSize.height / 20
                                                                                      : value == Btn.calculation
                                                                                          ? screenSize.height / 20
                                                                                          : value == Btn.constant
                                                                                              ? screenSize.height / 20
                                                                                              : value == Btn.sine
                                                                                                  ? screenSize.height / 20
                                                                                                  : value == Btn.cosine
                                                                                                      ? screenSize.height / 20
                                                                                                      : value == Btn.tangent
                                                                                                          ? screenSize.height / 20
                                                                                                          : value == Btn.sineinv
                                                                                                              ? screenSize.height / 20
                                                                                                              : value == Btn.cosinv
                                                                                                                  ? screenSize.height / 20
                                                                                                                  : value == Btn.taninv
                                                                                                                      ? screenSize.height / 20
                                                                                                                      : value == Btn.openbracket
                                                                                                                          ? screenSize.height / 20
                                                                                                                          : value == Btn.closebracket
                                                                                                                              ? screenSize.height / 20
                                                                                                                              : value == Btn.A
                                                                                                                                  ? screenSize.height / 20
                                                                                                                                  : value == Btn.B
                                                                                                                                      ? screenSize.height / 20
                                                                                                                                      : value == Btn.D
                                                                                                                                          ? screenSize.height / 20
                                                                                                                                          : value == Btn.comma
                                                                                                                                              ? screenSize.height / 20
                                                                                                                                              : (screenSize.height / 15),
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getBtnColor(value) {
    return [
      Btn.mode,
      Btn.percentage,
      Btn.inverse,
      Btn.factorial,
      Btn.power,
      Btn.root,
      Btn.openbracket,
      Btn.closebracket,
      Btn.fraction,
      Btn.conversion,
      Btn.log2,
      Btn.exponential,
      Btn.naturallog,
      Btn.exppower,
      Btn.logarithm,
      Btn.negative,
      Btn.combination,
      Btn.permutation,
      Btn.calculation,
      Btn.constant,
      Btn.sine,
      Btn.cosine,
      Btn.tangent,
      Btn.sineinv,
      Btn.cosinv,
      Btn.taninv,
      Btn.A,
      Btn.B,
      Btn.D,
      Btn.comma,
    ].contains(value)
        ? Colors.blueGrey
        : [
            Btn.n0,
            Btn.n1,
            Btn.n2,
            Btn.n3,
            Btn.n4,
            Btn.n5,
            Btn.n6,
            Btn.n7,
            Btn.n8,
            Btn.n9,
            Btn.delete,
            Btn.clear,
            Btn.multiply,
            Btn.divide,
            Btn.add,
            Btn.minus,
            Btn.decimal,
            Btn.pi,
            Btn.answer,
            Btn.equal,
          ].contains(value)
            ? Colors.orange
            : Colors.black87;
  }

  void onBtnTap(String value) {
    // Implement your button tap logic here
    setState(() {
      if (lastEqual &&
          value != Btn.equal &&
          value != Btn.calculation &&
          !setVarMode) {
        if (value == Btn.add ||
            value == Btn.minus ||
            value == Btn.multiply ||
            value == Btn.divide ||
            value == Btn.percentage) {
          equation = Btn.answer;
        } else {
          equation = "0";
        }
        lastEqual = false;
      }
      if (value == Btn.mode) {
        degMod = !degMod;
        return;
      }
      if (value == Btn.delete) {
        delete();
        return;
      }

      if (value == Btn.clear) {
        clear();
        return;
      }

      if (value == Btn.calculation) {
        varCalculate();
        return;
      }

      if (value == Btn.equal) {
        calculate();
        return;
      } else {
        if (Btn.valToDisplay.containsKey(value)) {
          value = Btn.valToDisplay[value]!;
        }
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (setVar.isEmpty) {
          if (equation == "0" &&
              value != Btn.decimal &&
              value != Btn.percentage &&
              value != "!" &&
              !varList.contains(value)) {
            equation = value;
          } else {
            equation = equation + value;
          }
        } else {
          firstVar ? result = value : result = result + value;
          firstVar = false;
        }
      }
    });
  }

  //Functions---------------------------------------------------
  //delete one from the end
  void delete() {
    equationFontSize = 48.0;
    resultFontSize = 38.0;
    if (setVar.isEmpty) {
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
    } else {
      if (result.isEmpty) {
        return;
      }
      result = result.substring(0, result.length - 1);
    }
  }

  // Clears everything
  void clear() {
    equation = "0";
    result = "0";
    equationFontSize = 38.0;
    resultFontSize = 48.0;
    lastEqual = false;
    setVarMode = false;
    setVar = "";
  }

  void varCalculate() {
    equationFontSize = 48.0;
    resultFontSize = 38.0;
    for (String key in varMap.keys) {
      if (equation.contains(key)) {
        varList.add(key);
      }
    }
    if (varList.isEmpty) {
      calculate();
      return;
    }
    setVar = varList.removeLast();
    setVarMode = true;
    firstVar = true;
    result = varMap[setVar]!;
  }

  void calculate() {
    //handle parenthesis
    addParenthesis();
    if (setVarMode) {
      expression = replaceForCal(result);
    } else {
      lastEqual = true;
      expression = replaceForCal(equation);
      equationFontSize = 38.0;
      resultFontSize = 48.0;
    }
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      Variable py = Variable("π");
      ContextModel cm = ContextModel()..bindVariable(py, Number(pi));
      result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      answer = result;
      if (result == "-0.0") {
        result = "0.0";
      }
      if (setVar.isNotEmpty) {
        varMap[setVar] = result;
        if (varList.isNotEmpty) {
          setVar = varList.removeLast();
          result = varMap[setVar]!;
          firstVar = true;
        } else {
          setVar = "";
          setVarMode = false;
          calculate();
        }
      }
    } catch (e) {
      result = "Error";
    }
  }

  void addParenthesis() {
    String equationCopy1 = equation;
    String equationCopy2 = equation;
    int openCount = equationCopy1.split('(').length - 1;
    int closeCount = equationCopy2.split(')').length - 1;
    while (openCount - closeCount > 0) {
      equation += ")";
      openCount -= 1;
    }
  }

  String replaceForCal(String expression) {
    expression = expression.replaceAll('Ans', answer);
    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('÷', '/');
    //handle pi and variables
    for (int i = 0; i <= 9; i++) {
      expression = expression.replaceAll('$iπ', '$i*π');
      expression = expression.replaceAll('$i' 'A', '$i*A');
      expression = expression.replaceAll('$i' 'B', '$i*B');
      expression = expression.replaceAll('$i' 'C', '$i*D');
      expression = expression.replaceAll('A' '$i', '$i*A');
      expression = expression.replaceAll('B' '$i', '$i*B');
      expression = expression.replaceAll('D' '$i', '$i*D');
    }
    //handling variables
    expression = expression.replaceAll("A", varMap["A"]!);
    expression = expression.replaceAll("B", varMap["B"]!);
    expression = expression.replaceAll("D", varMap["D"]!);
    //handling trigo
    expression = expression.replaceAll("sin^-1", "sAin");
    expression = expression.replaceAll("cos^-1", "cAos");
    expression = expression.replaceAll("tan^-1", "tAan");
    if (degMod) {
      expression = expression.replaceAll('cos(', 'cos(π/180*');
      expression = expression.replaceAll('sin(', 'sin(π/180*');
      expression = expression.replaceAll('tan(', 'tan(π/180*');
    }
    expression =
        expression.replaceAll("sAin", degMod ? "180/π*arcsin" : "arcsin");
    expression =
        expression.replaceAll("cAos", degMod ? "180/π*arccos" : "arccos");
    expression =
        expression.replaceAll("tAan", degMod ? "180/π*arctan" : "arctan");

    //handle problem like 8(9+7)
    for (int i = 0; i <= 9; i++) {
      expression = expression.replaceAll('$i(', '$i*(');
    }
    expression = expression.replaceAll('Ans(', 'Ans*(');

    expression = expression.replaceAll("%", "/100");
    return expression;
  }
}
