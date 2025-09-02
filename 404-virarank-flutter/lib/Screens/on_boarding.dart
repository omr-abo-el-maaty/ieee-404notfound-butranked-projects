import 'package:flutter/material.dart';
import 'package:ieee/Lists/on-boardingList.dart';
import 'package:ieee/Screens/welcome.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int index = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/ViraRank.png'),
                  SizedBox(height: 60),
                  Image.asset('${on_boarding[index]['image']}'),
                  SizedBox(height: 20),
                  Text(
                    '${on_boarding[index]['text']}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 60),
                  SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Thing(index == 0 ? 20 : 10),
                        Thing(index == 1 ? 20 : 10),
                        Thing(index == 2 ? 20 : 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10 + height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(),
                              ),
                            );
                          });
                        },
                        mouseCursor: SystemMouseCursors.click,
                        child: OnBoarding_Buttons('Skip',Colors.white,Colors.grey,Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          if (index < on_boarding.length - 1) {
                            setState(() {
                              index++;
                              height = index == 2 ? 20 : 0;
                            });
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Welcome(),
                              ),
                            );
                          }
                        },
                        mouseCursor: SystemMouseCursors.click,
                        child: OnBoarding_Buttons('Next',Colors.blue,Colors.blue,Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget Thing(double width) {
  return Container(
    width: width,
    height: 4,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget OnBoarding_Buttons(String txt,Color bgcolor,Color brdcolor,Color fcolor) {
  return Container(
    width: 110,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: bgcolor,
      border: BoxBorder.all(color: brdcolor),
    ),
    child: Center(
      child: Text(
        '$txt',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: fcolor,
          fontSize: 23,
        ),
      ),
    ),
  );
}
