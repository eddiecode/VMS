import 'package:flutter/material.dart';
import 'package:harperdb/harperdb.dart';

class Servercall extends StatefulWidget {
  const Servercall({super.key});

  @override
  State<Servercall> createState() => _ServercallState();
}

class _ServercallState extends State<Servercall> {
  final String hDBURL = 'https://visitor-dvla.harperdbcloud.com';
  // This is a global variable for your username
  final String hDBUSER = 'visitor';
  // This is a global variable for your password
  final String hDBPASSWORD = 'admin';

  //This handles your return type, it could be either a List for search queries or an Map for queries that insert
  late List harperData;

  //Just a future called harperAPI
  late Future harperAPI;
  Future<List> loadData() async {
    var show = await harperDB(
      hDBURL,
      hDBUSER,
      hDBPASSWORD,
      {"operation": "sql", "sql": "select * from Visitors.users"},
    );
    debugPrint(
      show.toString(),
    );
    //set the result of the query to your list which will be returned
    setState(() {
      harperData = show;
    });
    // the function type which was stated must be returned
    return harperData;
  }

  @override
  void initState() {
    harperAPI = loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: harperAPI,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: harperData.length,
              itemBuilder: (context, index) {
                return DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('First Name'),
                    ),
                    DataColumn(
                      label: Text('Last Name'),
                    ),
                    DataColumn(
                      label: Text('Company'),
                    ),
                    DataColumn(
                      label: Text('Officer'),
                    ),
                    DataColumn(
                      label: Text('Purpose'),
                    ),
                    DataColumn(
                      label: Text('tag'),
                    ),
                  ],
                  rows: harperData.map((h) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            (h['FirstName']) == null ? 'Null' : h['FirstName'],
                          ),
                        ),
                        DataCell(
                          Text(
                            (h['LastName']) == null ? 'Null' : h['LastName'],
                          ),
                        ),
                        DataCell(
                          Text(
                            (h['Company']) == null ? 'Null' : h['Company'],
                          ),
                        ),
                        DataCell(
                          Text(
                            (h['Officer']) == null ? 'Null' : h['Officer'],
                          ),
                        ),
                        DataCell(
                          Text((h['purpose']) == null ? 'Null' : h['purpose']),
                        ),
                        DataCell(
                          Text((h['Tag']) == null
                              ? 'Null'
                              : h['Tag'].toString()),
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Something is broken'),
            );
          }
        },
      ),
    );
  }
}
