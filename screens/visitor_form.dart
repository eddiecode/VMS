import 'package:flutter/material.dart';

class VisitorForm extends StatefulWidget {
  const VisitorForm({super.key});

  @override
  State<VisitorForm> createState() => _VisitorFormState();
}

class _VisitorFormState extends State<VisitorForm> {
  String firstname;
  String lastname;
  String phoneNumber;
  String company;
  String officerToSee;
  String purpose;
  String tag;
  String time;

  String logo = "assets/images/driver.png";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget _firstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      keyboardType: TextInputType.name,
      validator: (String value) {
         if (value.isEmpty) {
          return 'First Name is Required';
         }
      },
      onSaved: (String Value) {
        firstname = Value
      },
    );
  }


  Widget _lastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      keyboardType: TextInputType.name,
      validator: (String value) {
         if (value.isEmpty) {
          return 'Last Name is Required';
         }
      },
      onSaved: (String Value) {
        lastname = Value
      },
    );
  }


  Widget _phoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
         if (value.isEmpty) {
          return 'Phone Number is Required';
         }
      },
      onSaved: (String Value) {
        phoneNumber = Value
      },
    );
  }


  Widget _company() {
   return TextFormField(
      decoration: InputDecoration(labelText: 'Company/Institution'),
      keyboardType: TextInputType.none,
      validator: (String value) {
         if (value.isEmpty) {
          return 'Company/Institution is Required';
         }
      },
      onSaved: (String Value) {
        company = Value
      },
    );
  }


  Widget _officerToSee() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Officer To See'),
      keyboardType: TextInputType.none,
      validator: (String value) {
         if (value.isEmpty) {
          return 'Company/Institution is Required';
         }
      },
      onSaved: (String Value) {
        officerToSee = Value
      },
    );
  }


  Widget _tag() {
   return TextFormField(
      decoration: InputDecoration(labelText: 'Tag'),
      keyboardType: TextInputType.number,
      validator: (String value) {
         if (value.isEmpty) {
          return 'Tag is Required';
         }
      },
      onSaved: (String Value) {
        tag = Value
      },
    );
  }


  Widget _time() {
   return TextFormField(
      decoration: InputDecoration(labelText: 'Time'),
      keyboardType: TextInputType.datetime,
      validator: (String value) {
         if (value.isEmpty) {
          return 'Time is Required';
         }
      },
      onSaved: (String Value) {
        time = Value
      },
    );
  }
  

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
                        key: formKey,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          _firstName (),
                          _lastName (),
                          _phoneNumber (),
                          _company (),
                          _officerToSee (),
                          _tag (),
                          _time (),   
                          SizedBox(height: 100),
                          RaisedButton (
                            child: Text("Submit", style: TextStyle(color: Colors.orange, fontSize: 16
                            ),
                            ),
                            onPressed: () => {
                              if(! formKey.currentState.validate(){
                                return;

                              }
                                formkey.currentState.save();

                                  print(_firstName);
                                  print(_lastName);
                                  print(_phoneNumber);
                                  print(_company);
                                  print(_officerToSee);
                                  print( _tag);
                                  print(_time);
                                  



                               )
                            }  ,
                            )
                        ],
                      ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Row(
                children: [],
              );
            }
          },
        ),
      ),
    );
  }
}
