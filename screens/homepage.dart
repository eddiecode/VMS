import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String logo = "assets/images/driver.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 480) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(logo),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
                'VISITORS MANAGEMENT SYSTEM',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
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
              SizedBox(
                width: 400,
                height: 200,
                child: InkWell(
                  onTap: ()=> showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        title: Text(
                            'Visitor Information'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800
                          ),
                          textAlign: TextAlign.left,
                        ),
                        content: SizedBox(
                          width: 800,
                          height: 700,
                          child: Padding(
                            
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          
                          
                        ],
                      )
                  ),
                  child: Card(
                   elevation: 5,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                                Icons.person_add_alt_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Text(
                            'New Visitor'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              SizedBox(
                width: 400,
                height: 200,
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
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
                        "Visitor's Data".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),     
                ],
              );
            } else {
              return Row(
                 children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
                'VISITORS MANAGEMENT SYSTEM',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
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
              SizedBox(
                width: 400,
                height: 200,
                child: InkWell(
                  onTap: ()=> showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        title: Text(
                            'Visitor Information'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800
                          ),
                          textAlign: TextAlign.left,
                        ),
                        content: SizedBox(
                          width: 800,
                          height: 700,
                          child: Padding(
                            
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          
                          
                        ],
                      )
                  ),
                  child: Card(
                   elevation: 5,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(
                                Icons.person_add_alt_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Text(
                            'New Visitor'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              SizedBox(
                width: 400,
                height: 200,
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
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
                        "Visitor's Data".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
              );
            }
          },
        ),
      ),
    );
  }
}
