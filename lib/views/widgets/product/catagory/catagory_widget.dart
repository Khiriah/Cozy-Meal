import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatagoryWidget extends StatefulWidget {
  CatagoryWidget({Key? key}) : super(key: key);

  @override
  State<CatagoryWidget> createState() => _CatagoryWidgetState();
}

class _CatagoryWidgetState extends State<CatagoryWidget> {
  bool _shakeSelected = true;

  bool _coffeeSelected = false;

  bool _cocktailsSelected = false;

  bool _softSelected = false;

  int _itemNumber = 0;

  // final controller = Get.find<CategoryController>();


  @override
  Widget build(BuildContext context) {

          return Row(children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _softSelected = true;
                  _coffeeSelected = false;
                  _shakeSelected = false;
                  _cocktailsSelected = false;
                });
              },
              child: Bounce(
                delay: Duration(milliseconds: 1000),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 70,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _softSelected
                        ? Colors.red.withOpacity(.5)
                        : Colors.white.withOpacity(.1),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "g",
                      style: TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.visible,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _softSelected = true;
                  _coffeeSelected = false;
                  _shakeSelected = false;
                  _cocktailsSelected = false;
                });
              },
              child: Bounce(
                delay: Duration(milliseconds: 1000),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 70,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _softSelected
                        ? Colors.red.withOpacity(.5)
                        : Colors.white.withOpacity(.1),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "g",
                      style: TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.visible,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _softSelected = true;
                  _coffeeSelected = false;
                  _shakeSelected = false;
                  _cocktailsSelected = false;
                });
              },
              child: Bounce(
                delay: Duration(milliseconds: 1000),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 70,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _softSelected
                        ? Colors.red.withOpacity(.5)
                        : Colors.white.withOpacity(.1),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "g",
                      style: TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.visible,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _softSelected = true;
                  _coffeeSelected = false;
                  _shakeSelected = false;
                  _cocktailsSelected = false;
                });
              },
              child: Bounce(
                delay: Duration(milliseconds: 1000),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 70,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _softSelected
                        ? Colors.red.withOpacity(.5)
                        : Colors.white.withOpacity(.1),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "g",
                      style: TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.visible,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ]);
        }

  }

