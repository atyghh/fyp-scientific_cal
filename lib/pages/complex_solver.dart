import 'double_complex.dart';
import 'package:flutter/material.dart';
import 'single_complex.dart';
import 'package:scientific/components/bottom_nav2.dart';
import 'package:scientific/pages/drawer_content.dart';

class ComplexSolverPage extends StatefulWidget {
  const ComplexSolverPage({Key? key}) : super(key: key);

  @override
  State<ComplexSolverPage> createState() => _ComplexSolverPageState();
}

class _ComplexSolverPageState extends State<ComplexSolverPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ComplexSingleSolverPage(),
    const ComplexDoubleSolverPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(
          "Complex Equation Solver",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: SearchDrawer(),
      bottomNavigationBar: MyBottom2NavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}


