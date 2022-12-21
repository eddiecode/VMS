// import 'package:date_field/date_field.dart';
import 'package:dvla/screens/display.dart';
import 'package:dvla/screens/visitor_form.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'DVLA VISITOR MANAGEMENT SYSTEM',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Select any of the two options',
              style: TextStyle(
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VisitorForm(),
                        ),
                        (route) => route.isFirst);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.person_add_alt_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            Text(
                              'New Visitor'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),

              Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Servercall(),
                        ),
                        (route) => false);
                  },
                  // elevation: 5,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Icon(
                            Icons.stacked_bar_chart,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Text(
                        "Visitors' Data".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
