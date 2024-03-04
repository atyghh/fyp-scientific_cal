import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scientific/pages/drawer_content.dart';

void main() {
  runApp(MaterialApp(
    home: MatrixCalculator(),
  ));
}

enum Operation {
  Addition,
  Subtraction,
  Multiplication,
  DotProduct,
}

class MatrixCalculator extends StatefulWidget {
  @override
  _MatrixCalculatorState createState() => _MatrixCalculatorState();
}

class _MatrixCalculatorState extends State<MatrixCalculator> {
  TextEditingController rowsControllerA = TextEditingController();
  TextEditingController colsControllerA = TextEditingController();
  TextEditingController rowsControllerB = TextEditingController();
  TextEditingController colsControllerB = TextEditingController();
  List<List<TextEditingController>> matrixAControllers = [];
  List<List<TextEditingController>> matrixBControllers = [];
  TextEditingController resultController = TextEditingController();
  bool showMatrices = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      drawer: SearchDrawer(),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildMatrixDimensionsInput("Matrix A", rowsControllerA, colsControllerA),
                SizedBox(height: 16),
                buildMatrixDimensionsInput("Matrix B", rowsControllerB, colsControllerB),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      matrixAControllers = initializeMatrixControllers(rowsControllerA, colsControllerA);
                      matrixBControllers = initializeMatrixControllers(rowsControllerB, colsControllerB);
                      showMatrices = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Set the background color to white
                  ),
                  child: Text("Initialize Matrices", style: TextStyle(color: Colors.black)),
                ),
                if (showMatrices) ...[
                  SizedBox(height: 16),
                  if (matrixAControllers.isNotEmpty) buildMatrixInput("Matrix A", matrixAControllers),
                  if (matrixBControllers.isNotEmpty) buildMatrixInput("Matrix B", matrixBControllers),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      calculateMatrix(Operation.Addition);
                    },
                    style: canAddSubtract() ? ElevatedButton.styleFrom(backgroundColor: Colors.white) : _greyedOutButtonStyle(),
                    child: Text("Addition", style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      calculateMatrix(Operation.Subtraction);
                    },
                    style: canAddSubtract() ? ElevatedButton.styleFrom(backgroundColor: Colors.white) : _greyedOutButtonStyle(),
                    child: Text("Subtraction", style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      calculateMatrix(Operation.Multiplication);
                    },
                    style: canMultiply() ? ElevatedButton.styleFrom(backgroundColor: Colors.white) : _greyedOutButtonStyle(),
                    child: Text("Multiplication", style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      calculateMatrix(Operation.DotProduct);
                    },
                    style: canDotProduct() ? ElevatedButton.styleFrom(backgroundColor: Colors.white) : _greyedOutButtonStyle(),
                    child: Text("Dot Product", style: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 150, // Adjust the height as needed
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Result:\n${resultController.text}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool canAddSubtract() {
    int rowsA = int.tryParse(rowsControllerA.text) ?? 0;
    int colsA = int.tryParse(colsControllerA.text) ?? 0;
    int rowsB = int.tryParse(rowsControllerB.text) ?? 0;
    int colsB = int.tryParse(colsControllerB.text) ?? 0;

    return rowsA == rowsB && colsA == colsB;
  }

  bool canMultiply() {
    int colsA = int.tryParse(colsControllerA.text) ?? 0;
    int rowsB = int.tryParse(rowsControllerB.text) ?? 0;
    return colsA == rowsB;
  }

  bool canDotProduct() {
    int rowsA = int.tryParse(rowsControllerA.text) ?? 0;
    int colsB = int.tryParse(colsControllerB.text) ?? 0;
    return rowsA == colsB;
  }

  List<List<TextEditingController>> initializeMatrixControllers(TextEditingController rowsController, TextEditingController colsController) {
    int rows = int.tryParse(rowsController.text) ?? 0;
    int cols = int.tryParse(colsController.text) ?? 0;

    return List.generate(rows, (i) => List.generate(cols, (j) => TextEditingController()));
  }

  Widget buildMatrixDimensionsInput(String label, TextEditingController rowsController, TextEditingController colsController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: rowsController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(1)],
                decoration: InputDecoration(
                  labelText: "Number of Rows",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: colsController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(1)],
                decoration: InputDecoration(
                  labelText: "Number of Columns",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMatrixInput(String label, List<List<TextEditingController>> controllers) {
    int rows = controllers.length;
    int cols = controllers.isNotEmpty ? controllers[0].length : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 8),
        for (int i = 0; i < rows; i++)
          Row(
            children: [
              for (int j = 0; j < cols; j++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: controllers[i][j],
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: '[$i, $j]',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }

  void calculateMatrix(Operation operation) {
    try {
      List<List<double>> matrixA = getMatrixValues(matrixAControllers);
      List<List<double>> matrixB = getMatrixValues(matrixBControllers);

      List<List<double>> result;

      switch (operation) {
        case Operation.Addition:
          result = addMatrices(matrixA, matrixB);
          break;
        case Operation.Subtraction:
          result = subtractMatrices(matrixA, matrixB);
          break;
        case Operation.Multiplication:
          result = multiplyMatrices(matrixA, matrixB);
          break;
        case Operation.DotProduct:
          result = dotProduct(matrixA, matrixB);
          break;
      }

      resultController.text = matrixToString(result);
    } catch (e) {
      resultController.text = "Error: $e";
    }
  }

  List<List<double>> getMatrixValues(List<List<TextEditingController>> controllers) {
    return controllers.map((row) {
      return row.map((controller) {
        return double.tryParse(controller.text) ?? 0.0;
      }).toList();
    }).toList();
  }

  String matrixToString(List<List<double>> matrix) {
    String result = "";

    for (List<double> row in matrix) {
      result += row.join(", ") + ";\n";
    }

    return result;
  }

  List<List<double>> addMatrices(List<List<double>> matrixA, List<List<double>> matrixB) {
    return performMatrixOperation(matrixA, matrixB, (a, b) => a + b);
  }

  List<List<double>> subtractMatrices(List<List<double>> matrixA, List<List<double>> matrixB) {
    return performMatrixOperation(matrixA, matrixB, (a, b) => a - b);
  }

  List<List<double>> multiplyMatrices(List<List<double>> matrixA, List<List<double>> matrixB) {
    int rowsA = matrixA.length;
    int colsA = matrixA.isNotEmpty ? matrixA[0].length : 0;
    int rowsB = matrixB.length;
    int colsB = matrixB.isNotEmpty ? matrixB[0].length : 0;

    if (colsA != rowsB) {
      throw "Incompatible matrices for multiplication";
    }

    List<List<double>> result = List.generate(rowsA, (i) => List.filled(colsB, 0.0));

    for (int i = 0; i < rowsA; i++) {
      for (int j = 0; j < colsB; j++) {
        for (int k = 0; k < colsA; k++) {
          result[i][j] += matrixA[i][k] * matrixB[k][j];
        }
      }
    }

    return result;
  }

  List<List<double>> dotProduct(List<List<double>> matrixA, List<List<double>> matrixB) {
    return performMatrixOperation(matrixA, matrixB, (a, b) => a * b);
  }

  List<List<double>> performMatrixOperation(List<List<double>> matrixA, List<List<double>> matrixB, double Function(double, double) operation) {
    int rows = matrixA.length;
    int cols = matrixA.isNotEmpty ? matrixA[0].length : 0;

    if (matrixB.length != rows || (matrixB.isNotEmpty && matrixB[0].length != cols)) {
      throw "Incompatible matrices for the operation";
    }

    List<List<double>> result = List.generate(rows, (i) => List.filled(cols, 0.0));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result[i][j] = operation(matrixA[i][j], matrixB[i][j]);
      }
    }

    return result;
  }

  ButtonStyle _greyedOutButtonStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.grey,
      textStyle: TextStyle(color: Colors.black),
    );
  }
}



