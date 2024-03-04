import 'package:scientific/pages/matrix_equation_solver_page.dart';
import 'package:scientific/pages/single_matrix_equations.dart';
import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:scientific/pages/matrix_solver.dart';
import 'package:scientific/components/bottom_nav3.dart';
import 'package:scientific/pages/drawer_content.dart';

class MatrixSolverPage extends StatefulWidget {
  const MatrixSolverPage({Key? key}) : super(key: key);

  @override
  State<MatrixSolverPage> createState() => _MatrixSolverPageState();
}

class _MatrixSolverPageState extends State<MatrixSolverPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    SingleMatrixSolver(),
    MatrixCalculator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(
          "Matrix Solver",
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


