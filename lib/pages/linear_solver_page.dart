import 'package:flutter/material.dart';
import 'package:equations/equations.dart' as eq;

class LinearEquationSolverPage extends StatefulWidget {
  const LinearEquationSolverPage({Key? key});

  @override
  State<LinearEquationSolverPage> createState() => _LinearEquationSolverState();
}

class _LinearEquationSolverState extends State<LinearEquationSolverPage> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
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
                SizedBox(height: 8),
                Text(
                  "Linear Equation Solver",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  "ax + b = 0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                buildTextField("Enter a", aController),
                SizedBox(height: 8), // Added padding
                SizedBox(height: 8),
                buildTextField("Enter b", bController),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Call the function to solve the quadratic equation
                    solveLinearEquation();
                  },
                  child: Text("Solve Equation"),
                ),
                SizedBox(height: 16),
                Text(
                  "Results:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8), // Added padding
                Row(
                  children: [
                    Expanded(child: buildResultBox(resultText)),
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
    return TextField(
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
    );
  }

  Widget buildResultBox(String result) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          result,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void solveLinearEquation() {
    if (aController.text.isEmpty || bController.text.isEmpty) {
      setState(() {
        resultText = "Please enter all coefficients";
      });
      return;
    }

    final equation = eq.Linear(
      a: eq.Complex(double.tryParse(aController.text) ?? 0, 0),
      b: eq.Complex(double.tryParse(bController.text) ?? 0, 0),
    );

    setState(() {
      List<eq.Complex> solutions = equation.solutions();
      if (solutions.isNotEmpty) {
        resultText = '${solutions[0].real}';
      } else {
        resultText = 'No real roots';
      }
    });
  }
}


