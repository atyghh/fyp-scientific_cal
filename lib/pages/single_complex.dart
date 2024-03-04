import 'package:flutter/material.dart';

class ComplexSingleSolverPage extends StatefulWidget {
  const ComplexSingleSolverPage({super.key});

  @override
  State<ComplexSingleSolverPage> createState() =>
      _ComplexSingleSolverState();
}

class _ComplexSingleSolverState extends State<ComplexSingleSolverPage> {
  final TextEditingController ReController = TextEditingController();
  final TextEditingController ImController = TextEditingController();
  String dropdownValue = '+';
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 25),
                Row(
                  children: [
                    // Text input for 'a'
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: buildTextField("Enter Re", ReController),
                    ),
                    SizedBox(width: 8), // Add some space between 'a' and the dropdown
                    // Dropdown for operator selection
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              style: TextStyle(
                                color: Colors.black, // Color of the dropdown items
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              selectedItemBuilder: (BuildContext context) {
                                return <String>['+', '-'].map<Widget>((String value) {
                                  return Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: Colors.white, // Color of the selected value
                                        fontWeight: FontWeight.bold,
                                        fontSize: dropdownValue == value ? 30 : 16,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },
                              items: <String>['+', '-']
                                  .map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(width: 8), // Add some space between the dropdown and 'b'
                    // Text input for 'b'
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: buildTextField("Enter Im", ImController),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: Text(
                        "i",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9), // Added padding
                SizedBox(height: 9),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Call the function to solve the quadratic equation
                    solveComplexEquation();
                  },
                  child: Text("Solve Equation"),
                ),
                SizedBox(height: 16),
                Text(
                  "Results",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white, // Color of the underline
                    decorationThickness: 2.0, // Thickness of the underline
                  ),
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 20), // Added padding
                Row(
                  children: [
                    Text(
                      "Real Value:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ), // Added padding
                Row(
                  children: [
                    Text(
                      "Imaginary Value:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Magnitude:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Argument:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Call the function to solve the quadratic equation
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                        ),
                      ),
                      child: Text("Polar"),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Call the function to solve the quadratic equation
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                        ),
                      ),
                      child: Text("Exponential"),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Call the function to solve the quadratic equation
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                        ),
                      ),
                      child: Text("Conjugate"),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity, // Takes the full width
                  height: 160, // Set the height as needed
                  color: Colors.white,
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
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildResultBox() {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          "Your result here",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void solveComplexEquation() {
    // Implement your quadratic equation solving logic here
    // Use the values from aController, bController, and cController
    // Update the resultText and x1, x2 accordingly
    setState(() {
      resultText = "Your result here"; // Update with your actual result
    });

  }
}
