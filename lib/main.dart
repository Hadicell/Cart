import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCart(),
    );
  }
}

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [
            SizedBox(
              width: 8,
            ),
          ],
          backgroundColor: Color.fromARGB(144, 158, 99, 247),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(CupertinoIcons.list_dash),
              Text('Expandable Credit Cart'),
            ],
          )),
      backgroundColor: Color.fromARGB(247, 131, 243, 208),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  hasIcon: false,
                ),
                controller: ExpandableController(
                  initialExpanded: isActive,
                ),
                header: const Text(""),
                collapsed: Positioned(
                    child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset("assets/images/2.png",
                            width: 400, height: 400),
                        Image.asset("assets/images/4.png",
                            width: 380, height: 380),
                        Image.asset("assets/images/3.png",
                            width: 360, height: 360),
                        Image.asset("assets/images/1.png",
                            width: 340, height: 340),
                      ],
                    )
                  ],
                )),
                expanded: Center(
                  child: Column(
                    children: [
                      Image.asset("assets/images/2.png",
                          width: 145, height: 145),
                      Image.asset("assets/images/4.png",
                          width: 145, height: 145),
                      Image.asset("assets/images/3.png",
                          width: 145, height: 145),
                      Image.asset("assets/images/1.png",
                          width: 145, height: 145),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                  child: Text(isActive ? "بستن کارت ها" : "مشاهده کارت ها"))
            ],
          ),
        ),
      ),
    );
  }
}
