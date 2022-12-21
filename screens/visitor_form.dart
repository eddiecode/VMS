// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:harperdb/harperdb.dart';

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
  String? purpose;
  String? tag;
  String? time;

  String logo = "assets/images/driver.png";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget _firstName() {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextFormField(
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
      ),
    );
  }

  Widget _lastName() {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
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
      ),
    );
  }

  Widget _phoneNumber() {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
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
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
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
      ),
    );
  }

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
    return TextFormField(
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
    );
  }

  Widget _time() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: 'Time'),
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter Time';
          }
          return null;
        },
        onSaved: (value) {
          time = value;
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
                      width: MediaQuery.of(context).size.width - 100,
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
                            _purpose(),
                            _tag(),
                            _time(),
                            const SizedBox(height: 100),
                            ElevatedButton(
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 16),
                              ),
                              onPressed: () {
                                formKey.currentState!.save();
                                debugPrint(firstname);
                                debugPrint(lastname);
                                debugPrint(phoneNumber);
                                debugPrint(company);
                                debugPrint(officerToSee);
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
                                          "insert into Visitors.users (FirstName, LastName, PhoneNumber, Company, Officer, purpose, Tag) values ('$firstname', '$lastname', '$phoneNumber', '$company', '$officerToSee', '$purpose', '$tag')"
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
                    Expanded(
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(logo),
                        ),
                      ),
                    ),
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
