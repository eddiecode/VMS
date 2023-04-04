// ignore_for_file: prefer_const_constructors

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              // Handle the case where there are no routes in the Navigator's history.
            }
          },
        ),
        foregroundColor: Color.fromARGB(255, 10, 157, 49),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: harperAPI,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                      child: DataTable(
                        columns: const [
                          DataColumn(
                            label: Text('First Name'),
                          ),
                          DataColumn(
                            label: Text('Last Name'),
                          ),
                          DataColumn(
                            label: Text('Phone Number'),
                          ),
                          DataColumn(
                            label: Text('Company/ Institution'),
                          ),
                          DataColumn(
                            label: Text('Officer To See'),
                          ),
                          DataColumn(
                            label: Text('Department'),
                          ),
                          DataColumn(
                            label: Text('Purpose'),
                          ),
                          DataColumn(
                            label: Text('Tag'),
                          ),
                          DataColumn(
                            label: Text('Check In'),
                          ),
                          DataColumn(
                            label: Text('Check Out'),
                          ),
                          DataColumn(
                            label: Text('Action'),
                          ),
                        ],
                        rows: harperData.map((h) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  (h['FirstName']) == null
                                      ? 'Null'
                                      : h['FirstName'],
                                ),
                              ),
                              DataCell(
                                Text(
                                  (h['LastName']) == null
                                      ? 'Null'
                                      : h['LastName'],
                                ),
                              ),
                              DataCell(
                                Text(
                                  (h['PhoneNumber']) == null
                                      ? 'Null'
                                      : h['PhoneNumber'],
                                ),
                              ),
                              DataCell(
                                Text(
                                  (h['Company']) == null
                                      ? 'Null'
                                      : h['Company'],
                                ),
                              ),
                              DataCell(
                                Text(
                                  (h['Officer']) == null
                                      ? 'Null'
                                      : h['Officer'],
                                ),
                              ),
                              DataCell(
                                Text((h['department']) == null
                                    ? 'Null'
                                    : h['department']),
                              ),
                              DataCell(
                                Text((h['purpose']) == null
                                    ? 'Null'
                                    : h['purpose']),
                              ),
                              DataCell(
                                Text((h['Tag']) == null
                                    ? 'Null'
                                    : h['Tag'].toString()),
                              ),
                              DataCell(
                                Text((h['check_in_date']) == null
                                    ? 'Null'
                                    : h['check_in_date'].toString()),
                              ),
                              DataCell(
                                Text((h['check_out_date']) == null
                                    ? 'Null'
                                    : h['check_out_date'].toString()),
                              ),
                              DataCell(Row(
                                children: [
                                  if (h['check_out_date'] == null) ...[
                                    GestureDetector(
                                      onTap: () async {
                                        await harperDB(
                                          hDBURL,
                                          hDBUSER,
                                          hDBPASSWORD,
                                          {
                                            "operation": "sql",
                                            "sql":
                                                "UPDATE Visitors.users SET check_out_date = '${DateTime.now().toString()}' WHERE id = '${h["id"]}'"
                                          },
                                        );
                                      },
                                      child: Text('Update Check out'),
                                    )
                                  ]
                                ],
                              )),
                            ],
                          );
                        }).toList(),
                        // rows:  [
                        //   DataRow(
                        //     cells: [
                        //       DataCell(
                        //         Text(
                        //           (harperData[index]['FirstName']) == null
                        //               ? 'Null'
                        //               : harperData[index]['FirstName'],
                        //         ),
                        //       ),
                        //       DataCell(
                        //         Text(
                        //           (harperData[index]['LastName']) == null
                        //               ? 'Null'
                        //               : harperData[index]['LastName'],
                        //         ),
                        //       ),
                        //       DataCell(
                        //         Text(
                        //           (harperData[index]['Company']) == null
                        //               ? 'Null'
                        //               : harperData[index]['Company'],
                        //         ),
                        //       ),
                        //       DataCell(
                        //         Text(
                        //           (harperData[index]['Officer']) == null
                        //               ? 'Null'
                        //               : harperData[index]['Officer'],
                        //         ),
                        //       ),
                        //       DataCell(
                        //         Text((harperData[index]['purpose']) == null
                        //             ? 'Null'
                        //             : harperData[index]['purpose']),
                        //       ),
                        //       DataCell(
                        //         Text((harperData[index]['Tag']) == null
                        //             ? 'Null'
                        //             : harperData[index]['Tag'].toString()),
                        //       ),
                        //     ],
                        //   )
                        // ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Something is broken'),
              );
            }
          },
        ),
      ),

      // body: data == null
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemCount: data!.length,
      //         itemBuilder: (context, index) {
      //           return DataTable(
      //             columns: const [
      //               DataColumn(
      //                 label: Text('First Name'),
      //               ),
      //               DataColumn(
      //                 label: Text('Last Name'),
      //               ),
      //               DataColumn(
      //                 label: Text('Company'),
      //               ),
      //               DataColumn(
      //                 label: Text('Officer'),
      //               ),
      //               DataColumn(
      //                 label: Text('Purpose'),
      //               ),
      //               DataColumn(
      //                 label: Text('tag'),
      //               ),
      //             ],
      //             rows: [
      //               DataRow(
      //                 cells: [
      //                   DataCell(data![index]['FirstName']),
      //                   DataCell(data![index]['LastName']),
      //                   DataCell(data![index]['Company']),
      //                   DataCell(data![index]['Officer']),
      //                   DataCell(data![index]['purpose']),
      //                   DataCell(data![index]['Tag']),
      //                 ],
      //               )
      //             ],
      //           );
      //         },
      //       )
    );
  }
}
