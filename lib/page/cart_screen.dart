// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, unused_import, avoid_web_libraries_in_flutt, unused_local_variable, unused_element, no_leading_underscores_for_local_identifiers
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:susishop/page/final_screen.dart';

import '../provider/provider.dart';
import 'payment_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List itemAdd = context.read<CounterProvider>().product;

    void _onDeleted(int index) {
      itemAdd.removeAt(index);
      setState(() {});
    }

    inspect(itemAdd);
    String calculateTotal() {
      int totalAmount = 0;

      for (var element in itemAdd) {
        totalAmount = totalAmount +
            int.parse(
              element['total'].toString(),
            );
      }
      return totalAmount.toString();
    }

    // inspect(itemAdd);

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[100],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: itemAdd.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 114,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green[200],
                          ),
                          child: Image.asset(
                            itemAdd[index]['image'],
                            width: 200,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _onDeleted(index);
                              },
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                            SizedBox(
                              width: 110,
                            ),
                            Text('x: '),
                            Text(
                              itemAdd[index]['count'].toString(),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            ),
            Spacer(),
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: itemAdd.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Food :'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      itemAdd[index]['food'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    // Text(
                                    //   itemAdd[index]['price'].toString(),
                                    //   style: TextStyle(fontSize: 17),
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('x'),
                                    Text(
                                      itemAdd[index]['count'].toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Price : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$ ${itemAdd[index]['total'].toString()}',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text('Total : '),
                        Text(
                          '\$ ${calculateTotal()}',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Check out',
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
