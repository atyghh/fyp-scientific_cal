import 'package:flutter/material.dart';
import 'package:scientific/pages/length_converter.dart';
import 'package:scientific/pages/area_converter.dart';
import 'package:scientific/pages/volume_converter.dart';
import 'package:scientific/pages/time_converter.dart';
import 'package:scientific/pages/speed_converter.dart';
import 'package:scientific/pages/drawer_content.dart';
import 'package:scientific/pages/acceleration_converter.dart';

void main() {
  runApp(const MaterialApp(
    home: UnitListPage(),
  ));
}

class UnitListPage extends StatelessWidget {
  const UnitListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text(
            'Unit List',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true, // Center the title text
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),// Set elevation to 0
        ),
      ),
      drawer: SearchDrawer(),
      body: ListView(
        children: [
          _buildUnitButton(context, 'Length', Icons.straighten, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LengthConverterPage()),
            );
          }),
          _buildUnitButton(context, 'Area', Icons.crop_square, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AreaConverterPage()),
            );
          }),
          _buildUnitButton(context, 'Volume', Icons.line_weight, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VolumeConverterPage()),
            );
          }),
          _buildUnitButton(context, 'Time', Icons.access_time, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimeConverterPage()),
            );
          }),
          _buildUnitButton(context, 'Speed', Icons.speed, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpeedConverterPage()),
            );
          }),
          _buildUnitButton(context, 'Acceleration', Icons.flash_on, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccelerationConverterPage()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildUnitButton(BuildContext context, String text, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

