import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: SingleMatrixSolver(),
  ));
}

class SingleMatrixSolver extends StatefulWidget {
  @override
  _SingleMatrixSolverState createState() => _SingleMatrixSolverState();
}

class _SingleMatrixSolverState extends State<SingleMatrixSolver> {
  TextEditingController rowsControllerA = TextEditingController();
  TextEditingController colsControllerA = TextEditingController();
  List<List<TextEditingController>> matrixAControllers = [];
  bool showMatrixFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Matrix A", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 16),
              buildMatrixDimensionsInput(rowsControllerA, colsControllerA),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    matrixAControllers = initializeMatrixControllers();
                    showMatrixFields = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text("Initialize Matrix", style: TextStyle(color: Colors.black)),
              ),
              if (showMatrixFields) ...[
                SizedBox(height: 16),
                buildMatrixInput("Matrix A", matrixAControllers),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement determinant logic here
                  },
                  style: canCalculateDeterminant() ? ElevatedButton.styleFrom(backgroundColor: Colors.white) : _greyedOutButtonStyle(),
                  child: Text("Determinant", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement inverse logic here
                  },
                  style: canCalculateInverse() ? ElevatedButton.styleFrom(backgroundColor: Colors.white) : _greyedOutButtonStyle(),
                  child: Text("Inverse", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement rank logic here
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text("Rank", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement transpose logic here
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text("Transpose", style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 16),
                Text("Results:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 8),
                Container(
                  height: 150, // Set the height as needed
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  bool canCalculateDeterminant() {
    int rowsA = int.tryParse(rowsControllerA.text) ?? 0;
    int colsA = int.tryParse(colsControllerA.text) ?? 0;
    return rowsA == colsA;
  }

  bool canCalculateInverse() {
    int rowsA = int.tryParse(rowsControllerA.text) ?? 0;
    int colsA = int.tryParse(colsControllerA.text) ?? 0;
    return rowsA == colsA;
  }

  List<List<TextEditingController>> initializeMatrixControllers() {
    int rows = int.tryParse(rowsControllerA.text) ?? 0;
    int cols = int.tryParse(colsControllerA.text) ?? 0;

    return List.generate(rows, (i) => List.generate(cols, (j) => TextEditingController()));
  }

  Widget buildMatrixDimensionsInput(TextEditingController rowsController, TextEditingController colsController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: rowsController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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

  ButtonStyle _greyedOutButtonStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.grey,
      textStyle: TextStyle(color: Colors.black),
    );
  }
}
