import 'package:bisesh_dairy_udyog_app/Provider/BoughtProduct.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Products.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Units.dart';
import 'package:bisesh_dairy_udyog_app/utils/monthNameByInt.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget monthDetailsList(
    {@required BuildContext context, BoughtProduct boughtProduct}) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  Product productById =
      Provider.of<Products>(context).getProductById(boughtProduct.productId);
  ProductUnit productUnitById = Provider.of<ProductUnitProvider>(context)
      .findProductUnitById(productById.productUnit);
  bool paid = false;
  return Padding(
    padding: EdgeInsets.only(bottom: deviceHeight * 0.05),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: boughtProduct.paid ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(10)),
          child: ExpandablePanel(
              header: Container(
                  alignment: Alignment.center,
                  // color: Theme.of(context).primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${boughtProduct.boughtDate.day} ${monthName(boughtProduct.boughtDate.month)}, ${boughtProduct.boughtDate.year}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Total = ${boughtProduct.totalAmount}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: deviceWidth * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(boughtProduct.paid ? Icons.check : Icons.close,
                              color: Colors.white),
                          Text(
                            boughtProduct.paid ? "Paid" : "Due",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  )),
              collapsed: Text(
                "View Details...",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name :\t\t${productById.productName}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "Product Unit :\t\t${productUnitById.productUnit}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "Product Rate :\t\t${productById.productRate}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "Product Quantity :\t\t${boughtProduct.quantity}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Text(
                        "Paid :",
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: deviceWidth * 0.01),
                        child: Icon(
                          boughtProduct.paid ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: paid ? 2 : 0,
                  ),
                  if (!paid)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paid Amount:\t\t${boughtProduct.payment}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "Due Amount:\t\t${boughtProduct.duePayment}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ],
                    ),
                  Text(
                    "Grand Total:\t\t${boughtProduct.totalAmount}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: deviceWidth * 0.05),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    ),
    //     ExpandableNotifier(
    //   child: Column(
    //     children: [
    //       Expandable(
    //           collapsed: ExpandableButton(
    //             child: Icon(Icons.expand_more),
    //           ),
    //           expanded: Column(
    //             children: [
    //               Text(
    //                   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    //               ExpandableButton(
    //                 child: Icon(Icons.expand_less),
    //               )
    //             ],
    //           ))
    //     ],
    //   ),
    // )
    // ),
  );
}
