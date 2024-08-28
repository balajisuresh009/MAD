import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:excel/excel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excel CRUD Operations',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: StudentOperationsScreen(),
    );
  }
}

class StudentOperationsScreen extends StatefulWidget {
  @override
  _StudentOperationsScreenState createState() => _StudentOperationsScreenState();
}

class _StudentOperationsScreenState extends State<StudentOperationsScreen> {
  late Excel excel;
  String rollNoInput = '';
  String searchResult = '';
  List<List<Data?>> allData = [];

  @override
  void initState() {
    super.initState();
    loadExcelFromAssets();
  }

  Future<void> loadExcelFromAssets() async {
    ByteData data = await rootBundle.load("assets/Student_details.xlsx");
    List<int> bytes = data.buffer.asUint8List();
    excel = Excel.decodeBytes(bytes);
  }

  void deleteStudent(String rollNo) {
    var sheet = excel.sheets[excel.tables.keys.first];
    for (int i = 1; i < sheet!.rows.length; i++) {
      if (sheet.rows[i][1]?.value.toString() == rollNo) {
        sheet.removeRow(i);
        break;
      }
    }
    saveExcel();
  }

  void searchStudent(String rollNo) {
    var sheet = excel.sheets[excel.tables.keys.first];
    searchResult = '';
    for (var row in sheet!.rows) {
      if (row[1]?.value.toString() == rollNo) {
        setState(() {
          searchResult = row.map((e) => e?.value.toString()).join(', ');
        });
        break;
      }
    }
    if (searchResult.isEmpty) {
      setState(() {
        searchResult = 'Student not found';
      });
    }
  }

  void viewAllStudents() {
    var sheet = excel.sheets[excel.tables.keys.first];
    allData = [];
    for (var row in sheet!.rows) {
      setState(() {
        allData.add(row.map((e) => e).toList());
      });
    }
  }

  Future<void> saveExcel() async {
    var directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "/Student_details.xlsx";
    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);
    print("Excel file saved at $path");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Operations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                rollNoInput = value;
              },
              decoration: InputDecoration(labelText: 'Enter Roll No'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    deleteStudent(rollNoInput);
                  },
                  child: Text('Delete by RollNo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    searchStudent(rollNoInput);
                  },
                  child: Text('Search by RollNo'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Search Result: $searchResult'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewAllStudents,
              child: Text('View All'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return Text(allData[index].map((e) => e?.value.toString()).join(', '));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Catherine',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
   
