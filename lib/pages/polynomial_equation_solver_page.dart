import 'package:scientific/pages/linear_solver_page.dart';
import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:scientific/pages/quadratic_solver_page.dart';
import 'package:scientific/pages/cubic_solver_page.dart';
import 'package:scientific/components/bottom_nav_bar.dart';
import 'package:scientific/pages/drawer_content.dart';
import 'package:scientific/pages/quartic_solver_page.dart';

class PolynomialSolverPage extends StatefulWidget {
  const PolynomialSolverPage({Key? key}) : super(key: key);

  @override
  State<PolynomialSolverPage> createState() => _PolynomialSolverPageState();
}

class _PolynomialSolverPageState extends State<PolynomialSolverPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const LinearEquationSolverPage(),
    const QuadraticEquationSolverPage(),
    const CubicEquationSolverPage(),
    const QuarticEquationSolverPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(
          "Polynomial Equation Solver",
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
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}


