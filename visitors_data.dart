import 'package:flutter/material.dart';

import 'api_call.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Page 2',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}














  late Future<Users> users;

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
   // users = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Visitors Data'),
            centerTitle: true,
          ),
          body: Center(child: FutureBuilder<Users>(
              future: users,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data!.id),
                      Text(snapshot.data!.first_name),
                      Text(snapshot.data!.last_name),
                      Text(snapshot.data!.phone_number),
                      Text(snapshot.data!.purpose),
                      Text(snapshot.data!.company),
                      Text(snapshot.data!.officer_to_see),
                      Text(snapshot.data!.tag),
                      Text(snapshot.data!.time),

                    ],
                  );
                }else if (snapshot.hasError){
                  return Text(snapshot.error.toString());
                }else{
                  return const CircularProgressIndicator();
                }
              }
          ),),
        ));
  }
