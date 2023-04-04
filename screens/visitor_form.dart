// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:harperdb/harperdb.dart';
// import 'package:flutter/cupertino.dart';

class VisitorForm extends StatefulWidget {
  const VisitorForm({super.key});

  @override
  State<VisitorForm> createState() => _VisitorFormState();
}

class _VisitorFormState extends State<VisitorForm> {
  String? firstname;
  String? lastname;
  String? phoneNumber;
  String? company;
  String? officerToSee;
  String? department;
  String? purpose;
  String? tag;
  String? time;
  final date = DateTime.now().toString();

  String logo = "assets/images/driver.png";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ignore: unused_element
  void _submitForm() {
    if (formKey.currentState!.validate()) {
      // submit the form and reset form fields
      formKey.currentState!.save();
      formKey.currentState!.reset();
    }
  }

  Widget _firstName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        key: formKey,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'First Name'),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a first name';
          }
          if (!value.contains(RegExp(r'^[a-zA-Z ]*$'))) {
            return 'First name should contain only alphabetical characters';
          }
          return null;
        },
        onSaved: (value) {
          firstname = value;
        },
      ),
    );
  }

  Widget _lastName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Last Name'),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a Last Name';
          }
          if (!value.contains(RegExp(r'^[a-zA-Z ]*$'))) {
            return 'Last Name should contain only alphabetical characters';
          }
          return null;
        },
        onSaved: (value) {
          lastname = value;
        },
      ),
    );
  }

  Widget _phoneNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Phone Number'),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a phone number';
          }
          if (!value.contains(RegExp(r'^[0-9]*$'))) {
            return 'Phone number should contain only numeric characters';
          }
          return null;
        },
        onSaved: (value) {
          phoneNumber = value;
        },
      ),
    );
  }

  Widget _company() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Company/Institution'),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter Company/Institution ';
          }
          return null;
        },
        onSaved: (value) {
          company = value;
        },
      ),
    );
  }

  Widget _officerToSee() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Officer To See'),
        keyboardType: TextInputType.none,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter an Officer To See';
          }
          return null;
        },
        onSaved: (value) {
          officerToSee = value;
        },
      ),
    );
  }

  // ignore: unused_element
  Widget _department() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Department'),
        value: department,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          DropdownMenuItem(
            child: Text('DTTL'),
            value: 'DTTL',
          ),
          DropdownMenuItem(
            child: Text('VIR'),
            value: 'VIR',
          ),
          DropdownMenuItem(
            child: Text('PR'),
            value: 'PR',
          ),
          DropdownMenuItem(
            child: Text('PME'),
            value: 'PME',
          ),
          DropdownMenuItem(
            child: Text('RBDI'),
            value: 'RBDI',
          ),
          DropdownMenuItem(
            child: Text('HR'),
            value: 'hr',
          ),
          DropdownMenuItem(
            child: Text('Service Excellence'),
            value: 'service_excellence',
          ),
          DropdownMenuItem(
            child: Text('Administration'),
            value: 'administration',
          ),
          DropdownMenuItem(
            child: Text('Finance'),
            value: 'finance',
          ),
          DropdownMenuItem(
            child: Text('Procurement'),
            value: 'procurement',
          ),
          DropdownMenuItem(
            child: Text('Audit'),
            value: 'audit',
          ),
          DropdownMenuItem(
            child: Text('Transport'),
            value: 'Transport',
          ),
          DropdownMenuItem(
            child: Text('CE Secretariat'),
            value: 'ce_secretariat',
          ),
          DropdownMenuItem(
            child: Text('Others'),
            value: 'others',
          ),
        ],
        onChanged: (value) {
          setState(() {
            department = value as String;
          });
        },
      ));

  Widget _purpose() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Purpose'),
        value: purpose,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          DropdownMenuItem(
            child: Text('Replacement Of License'),
            value: 'replacement_of_license',
          ),
          DropdownMenuItem(
            child: Text('Renewal of License'),
            value: 'renewal_of_license',
          ),
          DropdownMenuItem(
            child: Text('License Conversation'),
            value: 'license_conversation',
          ),
          DropdownMenuItem(
            child: Text('International Drivers Permit'),
            value: 'international_drivers_permit',
          ),
          DropdownMenuItem(
            child: Text('Road Worthy Duplication'),
            value: 'road_worthy_duplication',
          ),
          DropdownMenuItem(
            child: Text('Registration of Vehicle'),
            value: 'registration_of_vehicle',
          ),
          DropdownMenuItem(
            child: Text('Appointment'),
            value: 'appointment',
          ),
          DropdownMenuItem(
            child: Text('Meeting'),
            value: 'meeting',
          ),
          DropdownMenuItem(
            child: Text('Others'),
            value: 'others',
          ),
        ],
        onChanged: (value) {
          setState(() {
            purpose = value as String;
          });
        },
      ));

  Widget _tag() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Tag'),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter tag number';
          }
          if (!value.contains(RegExp(r'^[0-9]*$'))) {
            return 'Tag number should contain only numeric characters';
          }
          return null;
        },
        onSaved: (value) {
          tag = value;
        },
      ),
    );
  }

  final String hDBURL = 'https://visitor-dvla.harperdbcloud.com';
  // This is a global variable for your username
  final String hDBUSER = 'visitor';
  // This is a global variable for your password
  final String hDBPASSWORD = 'admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Color.fromARGB(255, 10, 157, 49),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 480) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(logo),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _firstName(),
                            _lastName(),
                            _phoneNumber(),
                            _company(),
                            _officerToSee(),
                            _department(),
                            _purpose(),
                            _tag(),
                            const SizedBox(height: 100),
                            ElevatedButton(
                              // color: Colors.orange,
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                formKey.currentState!.save();
                                debugPrint(firstname);
                                debugPrint(lastname);
                                debugPrint(phoneNumber);
                                debugPrint(company);
                                debugPrint(officerToSee);
                                debugPrint(department);
                                debugPrint(purpose);
                                debugPrint(tag);
                                debugPrint(time);
                                Future senddata() async {
                                  await harperDB(
                                    hDBURL,
                                    hDBUSER,
                                    hDBPASSWORD,
                                    {
                                      "operation": "sql",
                                      "sql":
                                          "insert into Visitors.users (FirstName, LastName, PhoneNumber, Company, Officer, department, purpose, Tag, check_in_date) values ('$firstname', '$lastname', '$phoneNumber', '$company', '$officerToSee', '$department', '$purpose', '$tag', '$date')"
                                    },
                                  );
                                }

                                senddata();
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/driver.png'),
                        ),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(logo),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(9),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 9),
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     labelText: 'First Name',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter a First Name';
                    //     }
                    //     if (!value.contains(RegExp(r'^[a-zA-Z ]*$'))) {
                    //       return 'First Name should contain only alphabetical characters';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     lastname = value;
                    //   },
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(9),
                    //   child: SizedBox(
                    //       width: MediaQuery.of(context).size.width / 5,
                    //       height: 9),
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     labelText: 'Last Name',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter a Last Name';
                    //     }
                    //     if (!value.contains(RegExp(r'^[a-zA-Z ]*$'))) {
                    //       return 'Last Name should contain only alphabetical characters';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     lastname = value;
                    //   },
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(9),
                    //   child: SizedBox(
                    //       width: MediaQuery.of(context).size.width / 5,
                    //       height: 9),
                    // ),
                    // SizedBox(
                    //     width: MediaQuery.of(context).size.width / 5,
                    //     height: 15),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     labelText: 'Phone Number',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter a phone number';
                    //     }
                    //     if (!value.contains(RegExp(r'^[0-9]*$'))) {
                    //       return 'Phone number should contain only numeric characters';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     phoneNumber = value;
                    //   },
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(9),
                    //   child: SizedBox(
                    //       width: MediaQuery.of(context).size.width / 5,
                    //       height: 9),
                    // ),
                    // SizedBox(
                    //     width: MediaQuery.of(context).size.width / 5,
                    //     height: 9),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     labelText: 'Company/Institutiony',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter Company/Institution ';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     company = value;
                    //   },
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(9),
                    //   child: SizedBox(
                    //       width: MediaQuery.of(context).size.width / 5,
                    //       height: 9),
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     labelText: 'Officer to See',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter an Officer To See';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     officerToSee = value;
                    //   },
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(9),
                    //   child: SizedBox(
                    //       width: MediaQuery.of(context).size.width / 5,
                    //       height: 9),
                    // ),
                    // DropdownButtonFormField(
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //       ),
                    //       labelText: 'Purpose'),

                    //   value: purpose,
                    //   // ignore: prefer_const_literals_to_create_immutables
                    //   items: [
                    //     DropdownMenuItem(
                    //       child: Text('Replacement Of License'),
                    //       value: 'replacement_of_license',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('Renewal of License'),
                    //       value: 'renewal_of_license',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('License Conversation'),
                    //       value: 'license_conversation',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('International Drivers Permit'),
                    //       value: 'international_drivers_permit',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('Road Worthy Duplication'),
                    //       value: 'road_worthy_duplication',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('Registration of Vehicle'),
                    //       value: 'registration_of_vehicle',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('Appointment'),
                    //       value: 'appointment',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('Meeting'),
                    //       value: 'meeting',
                    //     ),
                    //     DropdownMenuItem(
                    //       child: Text('Others'),
                    //       value: 'others',
                    //     ),
                    //   ],
                    //   onChanged: (value) {
                    //     setState(() {
                    //       purpose = value as String;
                    //     });
                    //   },
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(9),
                    //   child: SizedBox(
                    //       width: MediaQuery.of(context).size.width / 5,
                    //       height: 9),
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     labelText: 'Tag Number',
                    //   ),
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter a tag for your visit';
                    //     }
                    //     if (!value.contains(RegExp(r'^[0-9]*$'))) {
                    //       return 'Tag number should contain only numeric characters';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     tag = value;
                    //   },
                    // ),
                    // SizedBox(
                    //     width: MediaQuery.of(context).size.width / 5,
                    //     height: 15),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     labelText: 'Time',
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter a time for your visit';
                    //     }
                    //     if (!value.contains(RegExp(r'^[0-9]*$'))) {
                    //       return 'Tag number should contain only numeric characters';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     time = value;
                    //   },
                    //   // controller: _timeController,
                    //   // readOnly: true,
                    //   // onTap: () async {
                    //   //   final selectedTime = await showTimePicker(
                    //   //     context: context,
                    //   //     initialTime: TimeOfDay.now(),
                    //   //   );
                    //   //   if (selectedTime != null) {
                    //   //     _timeController.value = TextEditingValue(
                    //   //         // ignore: use_build_context_synchronously
                    //   //         text: selectedTime.format(context));
                    //   //   }
                    //   // },
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _firstName(),
                            _lastName(),
                            _phoneNumber(),
                            _company(),
                            _officerToSee(),
                            _department(),
                            _purpose(),
                            _tag(),
                            const SizedBox(height: 100),
                            ElevatedButton(
                              // color: Colors.orange,
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),

                              onPressed: () {
                                formKey.currentState!.save();
                                debugPrint(firstname);
                                debugPrint(lastname);
                                debugPrint(phoneNumber);
                                debugPrint(company);
                                debugPrint(officerToSee);
                                debugPrint(department);
                                debugPrint(purpose);
                                debugPrint(tag);
                                debugPrint(time);
                                Future senddata() async {
                                  await harperDB(
                                    hDBURL,
                                    hDBUSER,
                                    hDBPASSWORD,
                                    {
                                      "operation": "sql",
                                      "sql":
                                          "insert into Visitors.users (FirstName, LastName, PhoneNumber, Company, Officer, department, purpose, Tag, check_in_date) values ('$firstname', '$lastname', '$phoneNumber', '$company', '$officerToSee', '$department', '$purpose', '$tag', '$date')"
                                    },
                                  );
                                }

                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Welcome to DVLA'),
                                    content:
                                        Text('Your visit has been recorded.'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ],
                                  ),
                                );
                                senddata();
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
