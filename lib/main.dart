import 'package:scientific/pages/complex_solver.dart';
import 'package:scientific/pages/intro_page.dart';
import 'package:scientific/pages/polynomial_equation_solver_page.dart';
import 'package:flutter/material.dart';
import 'package:scientific/pages/home_page.dart';
import 'package:scientific/pages/matrix_solver.dart';
import 'package:scientific/pages/single_complex.dart';
import 'package:scientific/pages/simultaneous_equation_solver.dart';
import 'package:scientific/pages/single_matrix_equations.dart';
import 'package:scientific/pages/matrix_equation_solver_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/home_page': (context) => HomePage(),
        '/polynomial_equation_solver_page': (context) => PolynomialSolverPage(),
        '/matrix_solver': (context) => MatrixSolverPage(),
        '/complex_equation_solver': (context) => ComplexSolverPage(),
        '/simultaneous_equation_solver': (context) => SimultaneousEquationsSolverPage(),
      },
    );
  }
}
