class Btn {
  static const String mode = "Deg/Rad";
  static const String percentage = "%";
  static const String inverse = "x^-1";
  static const String factorial = "x!";
  static const String power = "x^y";
  static const String root = "y√x";
  static const String openbracket = "(";
  static const String closebracket = ")";
  static const String fraction = "a/b";
  static const String conversion = "S→D";
  static const String log2 = "log2";
  static const String exponential = "10^x";
  static const String naturallog = "ln";
  static const String exppower = "e^x";
  static const String logarithm = "log(a)x";
  static const String negative = "(-)";
  static const String combination = "nCr";
  static const String permutation = "nPr";
  static const String calculation = "Calc";
  static const String constant = "Const";
  static const String sine = "sin";
  static const String cosine = "cos";
  static const String tangent = "tan";
  static const String sineinv = "sin^-1";
  static const String cosinv = "cos^-1";
  static const String taninv = "tan^-1";
  static const String A = "A";
  static const String B = "B";
  static const String D = "D";
  static const String comma = ",";
  static const String delete = "Del";
  static const String clear = "C";
  static const String multiply = "x";
  static const String divide = "÷";
  static const String add = "+";
  static const String minus = "-";
  static const String decimal = ".";
  static const String pi = "π";
  static const String answer = "Ans";
  static const String equal = "=";

  static const String n0 = "0";
  static const String n1 = "1";
  static const String n2 = "2";
  static const String n3 = "3";
  static const String n4 = "4";
  static const String n5 = "5";
  static const String n6 = "6";
  static const String n7 = "7";
  static const String n8 = "8";
  static const String n9 = "9";

  static const List<String> buttonValues = [
    mode,
    percentage,
    inverse,
    factorial,
    power,
    root,
    fraction,
    conversion,
    log2,
    exponential,
    naturallog,
    exppower,
    logarithm,
    negative,
    combination,
    permutation,
    calculation,
    constant,
    sine,
    cosine,
    tangent,
    sineinv,
    cosinv,
    taninv,
    openbracket,
    closebracket,
    A,
    B,
    D,
    comma,
    n7,
    n8,
    n9,
    delete,
    clear,
    n4,
    n5,
    n6,
    multiply,
    divide,
    n1,
    n2,
    n3,
    add,
    minus,
    n0,
    decimal,
    pi,
    answer,
    equal,
  ];

  static const Map<String, String> valToDisplay = {
    "x!": "!",
    "(-)": "-",
    "sin": "sin(",
    "cos": "cos(",
    "tan": "tan(",
    "sin^-1": "sin^-1(",
    "cos^-1": "cos^-1(",
    "tan^-1": "tan^-1(",
    "x^-1": "^-1",
    "x^y": "^",
    "y√x": "nrt(y,x)",
    "log2": "log(2,",
    "10^x": "10^",
    "ln": "ln(",
    "e^x": "e^",
    "log(a)x": "log(",
  };
}
