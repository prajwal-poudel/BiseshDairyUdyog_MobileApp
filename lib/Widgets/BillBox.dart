import 'package:flutter/material.dart';

Widget billBox(
    {@required dynamic paid,
    @required dynamic subtotal,
    @required dynamic height,
    @required dynamic width}) {
  return Container(
    height: height * 0.18,
    width: width * 0.75,
    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
    transform: Matrix4.translationValues(0, -height * 0.1, 0),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          spreadRadius: 2,
          blurRadius: 2,
          color: Colors.grey.withOpacity(0.3),
          offset: Offset(0, 1))
    ]),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: Text("My Bill".toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.09)),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Paid",
                      style: TextStyle(
                          fontSize: width * 0.055, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Text(
                        "Rs. $paid ",
                        style: TextStyle(
                          fontSize: width * 0.055,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rs. ${(subtotal - paid)}".toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width * 0.07)),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                          fontSize: width * 0.055, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Text(
                        "Rs. $subtotal",
                        style: TextStyle(
                          fontSize: width * 0.055,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    // Padding(
    //   padding: EdgeInsets.only(),
    //   child: Container(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         // Container(
    //         //   child: Column(
    //         //     children: [
    //         //       Text(
    //         //         "Paid",
    //         //         style: TextStyle(
    //         //             fontSize: width * 0.055,
    //         //             fontWeight: FontWeight.bold),
    //         //       ),
    //         //       Padding(
    //         //         padding: EdgeInsets.only(bottom: height * 0.01),
    //         //         child: Text(
    //         //           "Rs. $paid ",
    //         //           style: TextStyle(
    //         //             fontSize: width * 0.055,
    //         //           ),
    //         //         ),
    //         //       ),
    //         //     ],
    //         //   ),
    //         // ),
    //         Padding(
    //           padding: EdgeInsets.only(bottom: height * 0.01),
    //           child: Container(
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "Subtotal",
    //                   style: TextStyle(
    //                       fontSize: width * 0.055,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    // Padding(
    //   padding: EdgeInsets.only(),
    //   child: Text(
    //     "Rs. $subtotal",
    //     style: TextStyle(
    //       fontSize: width * 0.055,
    //     ),
    //   ),
    // ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // )
  );
}
