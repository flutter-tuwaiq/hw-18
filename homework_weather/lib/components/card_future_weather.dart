

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FutureWeather extends StatelessWidget {
  const FutureWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 54,
                      height: 104,
                      child: Card(
                          color: Colors.white.withOpacity(0.15),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('12:00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.6))),
                              Text('29',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.8)))
                            ],
                          )),
                    ),
                    Container(
                      width: 54,
                      height: 104,
                      child: Card(
                          color: purple,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('02:00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.6))),
                              Text('28',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.8)))
                            ],
                          )),
                    ),
                    Container(
                      width: 54,
                      height: 104,
                      child: Card(
                          color: Colors.white.withOpacity(0.15),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('02:00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.6))),
                              Text('23',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.8)))
                            ],
                          )),
                    ),
                    Container(
                      width: 54,
                      height: 104,
                      child: Card(
                          color: Colors.white.withOpacity(0.15),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('04:00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.6))),
                              Text('24',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.8)))
                            ],
                          )),
                    ),
                    Container(
                      width: 54,
                      height: 104,
                      child: Card(
                          color: Colors.white.withOpacity(0.15),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('06:00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.6))),
                              Text('26',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.8)))
                            ],
                          )),
                    ),
                  ],
                );
  }
}