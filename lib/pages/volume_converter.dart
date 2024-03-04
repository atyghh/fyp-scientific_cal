import 'package:flutter/material.dart';
import 'package:scientific/pages/functions.dart';

class VolumeConverterPage extends StatefulWidget {
  @override
  _VolumeConverterPageState createState() => _VolumeConverterPageState();
}

class _VolumeConverterPageState extends State<VolumeConverterPage> {
  String? selectedUnit1;
  String? selectedUnit2;
  String result = 'Result';
  String? inputVolume;
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Volume Converter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: inputController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Volume',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedUnit1,
                    hint: Text('Select unit'),
                    style: TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != selectedUnit2) {
                          selectedUnit1 = newValue!;
                        } else {
                          _showErrorDialog('Units cannot be the same.');
                        }
                      });
                    },
                    items: <String>['mm³', 'cm³', 'm³', 'km³']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      final temp = selectedUnit1;
                      selectedUnit1 = selectedUnit2;
                      selectedUnit2 = temp;
                    });
                  },
                  icon: Icon(
                    Icons.swap_horiz,
                    color: Colors.white,
                    size: 45.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedUnit2,
                    hint: Text('Select unit'),
                    style: TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != selectedUnit1) {
                          selectedUnit2 = newValue!;
                        } else {
                          _showErrorDialog('Units cannot be the same.');
                        }
                      });
                    },
                    items: <String>['mm³', 'cm³', 'm³', 'km³']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.white,
              child: Center(
                child: Text(
                  result,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (inputController.text.isEmpty ||
                        selectedUnit1 == null ||
                        selectedUnit2 == null) {
                      _showErrorDialog('Please enter volume and select units.');
                    } else {
                      inputVolume = inputController.text;
                      try {
                        convertFunctions functions = convertFunctions();
                        setState(() {
                          result = functions.unitConvertor(
                              "volume",
                              double.parse(inputVolume!),
                              selectedUnit1!,
                              selectedUnit2!);
                        });
                      } catch (e) {
                        print("Invalid input!");
                      }
                    }
                  },
                  child: SizedBox(
                    width: 120,
                    child: Center(
                      child: Text('Convert'),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      inputController.clear();
                      selectedUnit1 = null; // Reset dropdown values
                      selectedUnit2 = null; // Reset dropdown values
                      result = "Result";
                    });
                  },
                  child: SizedBox(
                    width: 120,
                    child: Center(
                      child: Text('Reset'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
