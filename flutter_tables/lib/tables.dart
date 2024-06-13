import 'package:flutter/material.dart';
import 'package:flutter_tables/tableRow.dart';

class TablesView extends StatefulWidget {
  const TablesView({super.key});

  @override
  State<TablesView> createState() => _TablesViewState();
}

class _TablesViewState extends State<TablesView> {
  bool sortAscending = true;
  int sortColumnIndex = 0;

  final List<Map<String, dynamic>> _rows = [
    {'name': 'John', 'age': 20, 'score': 90},
    {'name': 'Jane', 'age': 22, 'score': 85},
    {'name': 'Bob', 'age': 25, 'score': 95},
    {'name': 'Alice', 'age': 23, 'score': 88},
    {'name': 'Mark', 'age': 21, 'score': 92},
    {'name': 'Emma', 'age': 24, 'score': 87},
    {'name': 'Chris', 'age': 26, 'score': 91},
    {'name': 'Olivia', 'age': 22, 'score': 89},
    {'name': 'David', 'age': 20, 'score': 85},
    {'name': 'Sophia', 'age': 23, 'score': 93},
    {'name': 'Daniel', 'age': 21, 'score': 86},
    {'name': 'Isabella', 'age': 24, 'score': 94},
    {'name': 'Michael', 'age': 25, 'score': 90},
    {'name': 'Mia', 'age': 22, 'score': 88},
    {'name': 'Joshua', 'age': 26, 'score': 87},
    {'name': 'Emily', 'age': 20, 'score': 89},
    {'name': 'Matthew', 'age': 23, 'score': 91},
    {'name': 'Ava', 'age': 21, 'score': 85},
    {'name': 'James', 'age': 24, 'score': 92},
    {'name': 'Charlotte', 'age': 25, 'score': 93},
  ];

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> d) getField,
      int columnIndex, bool ascending) {
    setState(() {
      _rows.sort((a, b) {
        if (!ascending) {
          final Map<String, dynamic> c = a;
          a = b;
          b = c;
        }
        final Comparable<T> aValue = getField(a);
        final Comparable<T> bValue = getField(b);
        return Comparable.compare(aValue, bValue);
      });
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Tables'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push( 
                context,
                MaterialPageRoute(
                  builder: (context) => Tablerow(),
                ),
              );
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(children: [
            DataTable(
              columnSpacing: 20,
              sortColumnIndex: sortColumnIndex,
              sortAscending: sortAscending,
              columns: [
                DataColumn(
                  label: Text('Name'),
                  onSort: (int columnIndex, bool ascending) =>
                      _sort<String>((d) => d['name'], columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('Age'),
                  numeric: true,
                  onSort: (int columnIndex, bool ascending) =>
                      _sort<num>((d) => d['age'], columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('Score'),
                  numeric: true,
                  onSort: (int columnIndex, bool ascending) =>
                      _sort<num>((d) => d['score'], columnIndex, ascending),
                ),
              ],
              rows: _rows.map((row) {
                return DataRow(
                  cells: [
                    DataCell(Text(row['name'].toString())),
                    DataCell(Text(row['age'].toString())),
                    DataCell(Text(row['score'].toString())),
                  ],
                );
              }).toList(),
            ),
          ]),
        ),
      ),
    );
  }
}
