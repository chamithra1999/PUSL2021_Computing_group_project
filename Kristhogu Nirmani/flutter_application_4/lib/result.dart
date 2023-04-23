import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_4/result.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class result extends StatefulWidget {
  const result({super.key});

  @override
  State<result> createState() => _resultState();
}

// ignore: camel_case_types
class _resultState extends State<result> {
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 253, 255, 1),
      body: Center(
        child: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: sort_child_properties_last
            children:<Widget> [
              const Text(
                'RESULT',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 70,
              ),

              SizedBox(
                height: displayHeight*0.3,
                width: displayWidth*0.87,
                child: Container(
                  decoration: const BoxDecoration(
                    color:  Color.fromRGBO(60, 90, 153, 1),
                    borderRadius: BorderRadius.all(Radius.circular(25)), 
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Kidney Disease : ',
                    style: TextStyle(
                      
                      color: Color.fromRGBO(214, 253, 255, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),        
              ),
            ],
            ))),
            bottomNavigationBar: Container(
              margin: EdgeInsets.fromLTRB(displayHeight * 0.04, displayWidth * 0.05,
              displayHeight * 0.04, displayWidth * 0.05),
              height: displayHeight * 0.06,
              width: displayWidth * 0.87,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 100, 178, 196),
                borderRadius: BorderRadius.circular(50)),
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: displayWidth * 0.1),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        HapticFeedback.lightImpact();
                        });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * 0.31
                          : displayWidth * 0.3,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == currentIndex ? displayWidth * 0.12 : 0,
                        width: index == currentIndex ? displayWidth * 0.32 : 0,
                        decoration: BoxDecoration(
                          color: index == currentIndex
                              ? const Color.fromRGBO(248, 248, 248, 0.5)
                              : const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * 0.31
                          : displayWidth * 0.18,
                      alignment: Alignment.center,
                      child: Stack(children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * 0.15
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? listOfStrings[index]
                                    : '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * 0.05
                                  : 20,
                            ),
                            Icon(listOfIcons[index],
                                size: 30,
                                color: index == currentIndex
                                    ? Colors.black87
                                    : Colors.black45)
                          ],
                        )
                      ]),
                    )
                  ],
                ))),
      ),
    );
  }
}

List<String> listOfStrings = [
  'Home',
  'Profile',
];

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.account_circle_rounded,
];