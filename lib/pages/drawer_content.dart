import 'package:flutter/material.dart';

class SearchDrawer extends StatefulWidget {
  @override
  _SearchDrawerState createState() => _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {
  late TextEditingController _searchController;
  List<String> items = [
    'Home',
    'Units Conversion',
    'Complex Numbers',
    'Matrices',
    'Polynomial Equation Solver',
    'Simultaneous Equation Solver',
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredItems.addAll(items);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    filteredItems.clear();
    if (query.isNotEmpty) {
      items.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          filteredItems.add(item);
        }
      });
    } else {
      filteredItems.addAll(items);
    }
    setState(() {});
  }

  void _navigateToPage(String pageName) {
    // Use the Navigator to push the respective route
    switch (pageName) {
      case 'Home':
        Navigator.pushReplacementNamed(context, '/home_page');
        break;
      case 'Units Conversion':
        Navigator.pushReplacementNamed(context, '/unitsConversion');
        break;
      case 'Complex Numbers':
        Navigator.pushReplacementNamed(context, '/complex_equation_solver');
        break;
      case 'Matrices':
        Navigator.pushReplacementNamed(context, '/matrix_solver');
        break;
      case 'Polynomial Equation Solver':
        Navigator.pushReplacementNamed(context, '/polynomial_equation_solver_page');
        break;
      case 'Simultaneous Equation Solver':
        Navigator.pushReplacementNamed(context, '/simultaneous_equation_solver');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset('lib/images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _searchController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              onChanged: _filterItems,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    filteredItems[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Add bold style
                    ),
                  ),
                  onTap: () => _navigateToPage(filteredItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        drawer: SearchDrawer(),
      ),
    ),
  );
}
