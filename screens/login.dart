import 'package:dvla/screens/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String logo = "assets/images/driver.png";

  bool isshown = true;

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
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "User Name",
                                    labelText: "User Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    suffixIcon:
                                        Icon(Icons.account_circle_rounded)),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                labelText: "Password",
                                // errorText:
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      // Icons.remove_red_eye_outlined
                                      isshown == true
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                  onPressed: () {
                                    setState(() {
                                      isshown = !isshown;
                                    });
                                  },
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: isshown,
                              maxLength: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                              ),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 2,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                        (route) => false);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text('Login'),
                                ),
                              ),
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
                children: [
                  Expanded(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/driver.png'))),
                          ))),
                  Expanded(
                      child: Column(
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
                          width: MediaQuery.of(context).size.width / 4,
                          child: Form(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "User Name",
                                      labelText: "User Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      suffixIcon:
                                          Icon(Icons.account_circle_rounded),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    suffixIcon: Icon(Icons.lock_rounded),
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  maxLength: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                  ),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ),
                                            (route) => false);
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white,
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Text('Login'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
