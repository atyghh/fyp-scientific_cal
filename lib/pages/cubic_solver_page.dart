import 'package:flutter/material.dart';
import 'package:equations/equations.dart' as eq;

class CubicEquationSolverPage extends StatefulWidget {
  const CubicEquationSolverPage({Key? key});

  @override
  State<CubicEquationSolverPage> createState() =>
      _CubicEquationSolverState();
}

class _CubicEquationSolverState
    extends State<CubicEquationSolverPage> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController cController = TextEditingController();
  final TextEditingController dController = TextEditingController();
  List<eq.Complex> solutions = [];
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Cubic Equation Solver",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "ax³ + bx² + cx + d",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                buildTextField("Enter a", aController),
                SizedBox(height: 8),
                buildTextField("Enter b", bController),
                SizedBox(height: 8),
                buildTextField("Enter c", cController),
                SizedBox(height: 8),
                buildTextField("Enter d", dController),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Call the function to solve the cubic equation
                    solveCubicEquation();
                  },
                  child: Text("Solve Equation"),
                ),
                SizedBox(height: 4),
                Text(
                  "Results:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "x1:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(child: buildResultBox(0)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "x2:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(child: buildResultBox(1)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "x3:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(child: buildResultBox(2)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Container(
      height: 60, // Adjust the height as needed
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }


  Widget buildResultBox(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          solutions.length > index ? solutions[index].toString() : "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void solveCubicEquation() {
    if (aController.text.isEmpty ||
        bController.text.isEmpty ||
        cController.text.isEmpty ||
        dController.text.isEmpty) {
      setState(() {
        resultText = "Please enter all coefficients";
      });
      return;
    }

    final equation = eq.Cubic(
      a: eq.Complex(double.tryParse(aController.text) ?? 0, 0),
      b: eq.Complex(double.tryParse(bController.text) ?? 0, 0),
      c: eq.Complex(double.tryParse(cController.text) ?? 0, 0),
      d: eq.Complex(double.tryParse(dController.text) ?? 0, 0),
    );

    setState(() {
      solutions = equation.solutions();
      resultText =
      'Roots:\n x1 = ${solutions[0]},\n x2 = ${solutions[1]},\n x3 = ${solutions[2]}';
    });
  }
}




