// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:harperdb/harperdb.dart';

class Servercall extends StatefulWidget {
  const Servercall({super.key});

  @override
  State<Servercall> createState() => _ServercallState();
}

class _ServercallState extends State<Servercall> {
  List? data;

  final String hDBURL = 'https://visitor-dvla.harperdbcloud.com';
  // This is a global variable for your username
  final String hDBUSER = 'visitor';
  // This is a global variable for your password
  final String hDBPASSWORD = 'admin';

  //This handles your return type, it could be either a List for search queries or an Map for queries that insert
  late List harperData;

  //Just a future called harperAPI
  late Future harperAPI;
  Future //function type is stated as a future
      <List> // the fucntion will return future in this case but it can also be set to map in other cases, all you have to do is change <List> to <Map<String, dynamic>>
      loadData() //the function name
  async // it has to be asynchronous
  {
    var show = await harperDB(
      //A variable called show is assigned the result ot the function
      hDBURL,
      hDBUSER,
      hDBPASSWORD,
      {"operation": "sql", "sql": "select * from Visitors.users"},
    );
    //this shows you if the query ran properly. The result of your search will be shown in the terminal
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
        // the widget is used to show data after it has gotten the result
        future: harperAPI,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //This block of code states what is to happen while waiting for the result from the database, in this case it is meant to show a circular progress widget
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            //This block of code explains what to do when it has gotten the data from the database
            return ListView.builder(
              itemCount: harperData.length,
              itemBuilder: (context, index) {
                return MaterialApp(
                  home: Scaffold(
                    body: data == null
                        // ignore: prefer_const_constructors
                        ? Center(child: CircularProgressIndicator())
                        : DataTable(
                            // ignore: prefer_const_literals_to_create_immutables
                            columns: [
                              const DataColumn(label: Text('First Name')),
                              const DataColumn(label: Text('Last Name')),
                              const DataColumn(label: Text('Company')),
                              const DataColumn(label: Text('Officer')),
                              const DataColumn(label: Text('Purpose')),
                              const DataColumn(label: Text('Tag')),
                            ],
                            rows: data!
                                .map(
                                  (item) => DataRow(cells: [
                                    DataCell(
                                        Text(harperData[index]['FirstName'])),
                                    DataCell(
                                        Text(harperData[index]['LastName'])),
                                    DataCell(Text(
                                      harperData[index]['PhoneNumber']
                                          .toString(),
                                    )),
                                    DataCell(
                                        Text(harperData[index]['Company'])),
                                    DataCell(
                                        Text(harperData[index]['Officer'])),
                                    DataCell(Text(
                                      harperData[index]['Purpose'].toString(),
                                    )),
                                    DataCell(Text(
                                      harperData[index]['Tag'].toString(),
                                    ))
                                  ]),
                                )
                                .toList(),
                          ),
                  ),
                );

                // var dataColumn = const DataColumn(label: Text('Phone Number'));
                // return SingleChildScrollView(
                //   child: DataTable(
                //     columns: [
                //       const DataColumn(label: Text('First Name')),
                //       const DataColumn(label: Text('Last Name')),
                //       dataColumn,
                //       const DataColumn(label: Text('Company')),
                //       const DataColumn(label: Text('Officer')),
                //       const DataColumn(label: Text('Purpose')),
                //       const DataColumn(label: Text('Tag')),
                //     ],
                //     rows: data.then((value) {
                //       return value
                //           .map(
                //             (item) => DataRow(cells: [
                //               DataCell(Text(harperData[index]['FirstName'])),
                //               DataCell(Text(harperData[index]['LastName'])),
                //               DataCell(Text(
                //                 harperData[index]['PhoneNumber'].toString(),
                //               )),
                //               DataCell(Text(harperData[index]['Company'])),
                //               DataCell(Text(harperData[index]['Officer'])),
                //               DataCell(Text(
                //                 harperData[index]['Purpose'].toString(),
                //               )),
                //               DataCell(Text(
                //                 harperData[index]['Tag'].toString(),
                //               )),
                //             ]),
                //           )
                //           .toList();
                //     }),
                //   ),
                // );

                // return Card(
                //   child: Column(
                //     children: [
                //       ListTile(
                //         title: Text(harperData[index]['FirstName'] +
                //             ' ' +
                //             harperData[index]['LastName']),
                //         subtitle: Text(harperData[index]['Company']),
                //         trailing: Text(
                //           harperData[index]['PhoneNumber'].toString(),
                //         ),
                //       ),
                //       ListTile(
                //         title: Text(harperData[index]['Officer']),
                //         trailing: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Chip(
                //               label: Text(
                //                 harperData[index]['Tag'].toString(),
                //               ),
                //             ),
                //             const SizedBox(width: 4),
                //             Chip(
                //               label: Text(
                //                 harperData[index]['purpose'].toString(),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // );
                // return ListTile(
                //   // leading: Text(
                //   //   harperData[index]['FirstName'],
                //   // ),
                //   // subtitle: Text(harperData[index]['LastName']),
                //   // title: Text(
                //   //   harperData[index]['PhoneNumber'].toString(),
                //   //   textAlign: TextAlign.justify,
                //   // ),
                //   // trailing: Text(harperData[index]['Company']),
                // );
              },
            );
          } else {
            //This block of code will tell what to do if theres an error
            return const Center(child: Text("Something went wrong."));
          }
        },
      ),
    );
  }
}
