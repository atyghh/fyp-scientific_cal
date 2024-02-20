import 'package:flutter/material.dart';
import 'package:equations/equations.dart';

class SimultaneousEquationsSolverPage extends StatefulWidget {
  @override
  _SimultaneousEquationsSolverPageState createState() =>
      _SimultaneousEquationsSolverPageState();
}

class _SimultaneousEquationsSolverPageState
    extends State<SimultaneousEquationsSolverPage> {
  int numEquations = 2; // Default number of equations
  List<List<TextEditingController>> controllers = [];
  String result = '';

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    controllers = List.generate(
      numEquations,
          (i) => List.generate(
        numEquations + 1,
            (j) => TextEditingController(),
      ),
    );
  }

  void solveSystem() {
    try {
      final matrixData = List.generate(
        numEquations,
            (i) => List.generate(
          numEquations + 1,
              (j) => double.tryParse(controllers[i][j].text) ?? 0,
        ),
      );

      final knownValues = List.generate(
        numEquations,
            (i) => double.tryParse(controllers[i][numEquations].text) ?? 0,
      );

      final matrix =
      RealMatrix.fromData(rows: numEquations, columns: numEquations + 1, data: matrixData);
      final solver = GaussianElimination(matrix: matrix, knownValues: knownValues);

      final solution = solver.solve();
      setState(() {
        result = 'Solution: ' + solution.map((x) => x.toStringAsFixed(2)).join(', ');
      });
    } catch (e) {
      setState(() {
        result = 'Error: ${e.toString()}';
      });
    }
  }

  Widget buildEquationInput(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: List.generate(
          numEquations + 1,
              (i) {
            if (i < numEquations) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTextField(controllers[index][i], getVariableLabel(i, index)),
                ),
              );
            } else {
              return Text(' = '); // Display equal sign for the last column
            }
          },
        ),
      ),
    );
  }

  String getVariableLabel(int variableIndex, int equationIndex) {
    final variables = ['x', 'y', 'z', 'v', 'u'];
    return '${variables[variableIndex]}${equationIndex + 1}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simultaneous Equations Solver"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: numEquations,
                items: [2, 3, 4, 5].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('$value Equations'),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    numEquations = newValue ?? 2;
                    _initControllers();
                  });
                },
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: List.generate(numEquations, (index) => buildEquationInput(index)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: solveSystem,
                child: Text('Solve'),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      keyboardType: TextInputType.number,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SimultaneousEquationsSolverPage(),
  ));
}


