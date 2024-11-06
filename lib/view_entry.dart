


import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'entry_form.dart';
import 'hive_functions.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart'; // Ensure correct import
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
class FormListPage extends StatefulWidget {
  const FormListPage({super.key});

  @override
  State<FormListPage> createState() => _FormListPageState();
}

class _FormListPageState extends State<FormListPage> {
  List myHiveData = [];

  getHiveData() {
    myHiveData = HiveFunctions.getAllUsers();
    setState(() {});
  }

  @override
  void initState() {

    super.initState();
    getHiveData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.download_for_offline),
              onPressed: () {
                // Handle the press
              //  exportToExcel();
                exportToPDF();
              },
            ),

          ],
          title: const Text("Form View"),
        ),


        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myHiveData.isEmpty // To show when no data is stored
              ? const Center(
              child: Text(
                "No Data is Stored",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ))
          // To show when data is stored
              :
          ListView.builder(
            itemCount: myHiveData.length,
            itemBuilder: (context, index) {
              final userData = myHiveData[index];
              return Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Stall No. :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["stallNumber"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Con. Person Name :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["contactPersonName"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Company Name :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["companyName"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Phone :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["phoneNumber"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Email :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["emailAddress"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Contact Person Name :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["contactPersonName"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Company Address :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["companyAddress"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Topic Interested :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["topicInterested"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Meeting Schedule :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["meetingSchedule"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Meeting Location :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["meetingLocation"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Probability :  ", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                              Text("${userData["probability"] ?? 'N/A'}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -8,
                      right: -8,
                      child: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          HiveFunctions.deleteUser(userData["key"]);
                          getHiveData();
                          print('Icon pressed');
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));

  }
  /*void exportToExcel() async {
    List<Map<String, dynamic>> data = await fetchHiveData();
    await saveDataToExcel(data);
  }*/
  Future<List<Map<String, dynamic>>> fetchHiveData() async {
    var box = await Hive.openBox('formData');
    List<Map<String, dynamic>> data = [];
    for (var key in box.keys) {
      data.add(box.get(key));
    }
    return data;
  }


  Future<void> exportToPDF() async {
    List data = myHiveData;
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Form Data', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              ...data.map((item) => pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Stall No.: ${item["stallNumber"] ?? "N/A"}'),
                  pw.Text('Contact Person Name: ${item["contactPersonName"] ?? "N/A"}'),
                  pw.Text('Company Name: ${item["companyName"] ?? "N/A"}'),
                  pw.Text('Phone: ${item["phoneNumber"] ?? "N/A"}'),
                  pw.Text('Email: ${item["emailAddress"] ?? "N/A"}'),
                  pw.Text('Company Address: ${item["companyAddress"] ?? "N/A"}'),
                  pw.Text('Topic Interested: ${item["topicInterested"] ?? "N/A"}'),
                  pw.Text('Meeting Schedule: ${item["meetingSchedule"] ?? "N/A"}'),
                  pw.Text('Meeting Location: ${item["meetingLocation"] ?? "N/A"}'),
                  pw.Text('Probability: ${item["probability"] ?? "N/A"}'),
                  pw.SizedBox(height: 20),
                ],
              ))
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/hive_data.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    print('PDF file saved at $path');
  }

/*  void exportToExcel() async {
    List<Map<String, dynamic>> data = await fetchHiveData();
    await saveDataToExcel(data);
  }

  Future<void> saveDataToExcel(List<Map<String, dynamic>> data) async {
    var excel = Excel.createExcel(); // Create a new Excel file
    Sheet sheet = excel['Sheet1']; // Add a sheet

    // Add headers
    sheet.appendRow(['ID', 'Stall Number', 'Company Name', 'Contact Person Name', 'Phone Number', 'Email Address', 'Company Address', 'Topic Interested', 'Meeting Schedule', 'Meeting Location', 'Probability']);

    // Add data rows
    for (var item in data) {
      sheet.appendRow([
        item['id'],
        item['stallNumber'],
        item['companyName'],
        item['contactPersonName'],
        item['phoneNumber'],
        item['emailAddress'],
        item['companyAddress'],
        item['topicInterested'],
        item['meetingSchedule'],
        item['meetingLocation'],
        item['probability']
      ]);
    }

    // Save the file
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/hive_data.xlsx';
    var file = File(path);
    file.writeAsBytesSync(excel.save()!);

    print('Excel file saved at $path');
  }*/
}
