import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        fontFamily: 'CascadiaCode',
      ),
      home: const BusinessCard(
        fullName: 'Mark Smith',
        companyName: 'Creative Designes',
        companyLogoPath: 'images/logo.png',
        phoneNumber: '+0012-3456-78901',
        email: 'urbrandname@gmail.com',
        website: 'www.websitename.com',
        address: 'Street address here 2435',
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key,
    required this.fullName, required this.companyName,
    required this.companyLogoPath, required this.phoneNumber,
    required this.email, required this.website, required this.address});

  final String fullName;
  final String companyName;
  final String companyLogoPath;
  final String phoneNumber;
  final String email;
  final String website;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Card'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: 650,
              height: 400,
              child: Card(
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  splashColor: Colors.blueAccent.withAlpha(20),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Business Card'),
                            content: const Text('Business card tapped!'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(companyLogoPath, width: 250, height: 250),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60, right: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  fullName.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      wordSpacing: -15,
                                      height: 0.9
                                  ),
                                ),
                                Text(
                                  companyName.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    wordSpacing: -5,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 40, right: 10),
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    phoneNumber,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        height: 2
                                    ),
                                  ),
                                  Text(
                                    email,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        height: 2
                                    ),
                                  ),
                                  Text(
                                    website,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        height: 2
                                    ),
                                  ),
                                  Text(
                                    address,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        height: 2
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
