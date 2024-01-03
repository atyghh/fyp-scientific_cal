import 'package:flutter/material.dart';
import 'package:scientific/pages/button_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String number1 = "";
  String operand = "";
  String number2 = "";
  List<String> numberList = [];
  List<String> operandList = [];

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
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // output
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
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "$number1$operand$number2".isEmpty
                        ? "0"
                        : "$number1$operand$number2",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
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
                                                                                                                                          : value == Btn.E
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
                                                                                                                                          : value == Btn.E
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
      Btn.E,
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
    // Complex functions
    print("button pressed: $value");
    // Basic operators
    if (value == Btn.pi) {
      value = "3.14159265359";
    }
    if (value == Btn.delete) {
      delete();
      return;
    }

    if (value == Btn.clear) {
      clear();
      return;
    }

    if (value == Btn.percentage) {
      convertToPercentage();
      return;
    }
    if (value == Btn.equal) {
      calculate();
      return;
    }

    //numbers are pressed
    appendValue(value);
  }

  //Complex operators functions=================================================

  //Basic operators functions---------------------------------------------------
  //delete one from the end
  void delete() {
    if (number2.isNotEmpty) {
      //12233->1223
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {});
  }

  // Clears everything
  void clear() {
    setState(() {
      number1 = "";
      operand = "";
      number2 = "";
    });
  }

  // Converts output to %
  void convertToPercentage() {
    //proper equation exists ex:434+324
    if (number2.isNotEmpty) {
      setState(() {
        number2 = "${(double.parse(number2) / 100)}";
      });
    }

    if (operand.isNotEmpty) {
      //cannot be converted
      return;
    }
    final number = double.parse(number1);
    setState(() {
      number1 = "${(number / 100)}";
    });
  }

  //calculates the result
  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    final double num1 = double.parse(number1);
    final double num2 = double.parse(number2);
    var result = 0.0;
    switch (operand) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.minus:
        result = num1 - num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;
      default:
    }
    setState(() {
      number1 = "$result";

      if (number1.endsWith(".0")) {
        number1 = number1.substring(0, number1.length - 2);
      }

      operand = "";
      number2 = "";
    });
  }

  // Appends value to the end
  void appendValue(String value) {
    // number1 operand number 2
    //if is operand and not "."
    if (value != Btn.decimal && int.tryParse(value) == null) {
      //operand pressed
      if (operand.isNotEmpty && number2.isNotEmpty && value != Btn.minus) {
        calculate();
      }
      if (value == Btn.minus) {
        if (number1.isEmpty) {
          number1 = value;
        } else if (operand.isEmpty && number1 != Btn.minus) {
          operand = value;
        } else if (number2.isEmpty && operand.isNotEmpty) {
          number2 = value;
        } else if (number2 != Btn.minus) {
          calculate();
          operand = value;
        } else {
          return;
        }
      } else {
        operand = value;
      }
    }
    // Assign value to number1
    else if (number1.isEmpty || operand.isEmpty) {
      //check if value is "."
      //avoid double dot
      if (value == Btn.decimal && number1.contains(Btn.decimal)) {
        return;
      }
      if (value == Btn.decimal && (number1.isEmpty || number1 == Btn.n0)) {
        // Case: number1="" | "0"
        value = "0.";
      }
      // Case when number1 = 0 append 123 ->  number1 = 0123
      if (number1 == "0") {
        number1 = "";
      }
      number1 += value;
    } // Assign value to number2
    else if (number2.isEmpty || operand.isNotEmpty) {
      //check if value is "."
      //avoid double dot
      if (value == Btn.decimal && number2.contains(Btn.decimal)) {
        return;
      }
      if (value == Btn.decimal && (number2.isEmpty || number2 == Btn.n0)) {
        // number2="" | "0"
        value = "0.";
      }
      if (number2 == "0") {
        number2 = "";
      }
      number2 += value;
    }
    setState(() {});
  }
}
