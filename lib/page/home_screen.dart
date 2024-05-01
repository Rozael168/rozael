// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names, unused_element, unused_field, prefer_final_fields, unnecessary_new, unrelated_type_equality_checks, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls, prefer_is_empty, avoid_print, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:susishop/components/button.dart';
import 'package:susishop/page/cart_screen.dart';
import 'package:badges/badges.dart';
import '../components/bottomNavigation.dart';
import '../components/promo_button.dart';
import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List item = [
    {
      'id': 1,
      'food': 'Tuna',
      'price': 5,
      'count': 0,
      'total': 0,
      'image': 'assets/images/sushi1.png',
      'isSelected': false,
      'Selectitem': false,
    },
    {
      'id': 2,
      'food': 'Salmon roll',
      'price': 5,
      'count': 0,
      'total': 0,
      'image': 'assets/images/sushi2.png',
      'isSelected': false,
      'Selectitem': false,
    },
    {
      'id': 3,
      'food': 'Trio Sushi',
      'price': 30,
      'count': 0,
      'total': 0,
      'image': 'assets/images/sushi3.png',
      'isSelected': false,
      'Selectitem': false,
    },
    {
      'id': 4,
      'food': 'Big set',
      'price': 50,
      'count': 0,
      'total': 0,
      'image': 'assets/images/sushi4.png',
      'isSelected': false,
      'Selectitem': false,
    },
  ];

  void _onChangeStar(int index) {
    item[index]['isSelected'] = !item[index]['isSelected'];

    setState(() {});
  }

  // void _addPopupItem(index) {
  //   List itemAdd = context.read<CounterProvider>().product;
  //   var stockQrtCp = itemAdd.toList();
  //   if (stockQrtCp.length > 0) {
  //     stockQrtCp.forEach(
  //       (element) {
  //         if (element['id'] == item[index]['id']) {
  //           showDialog(
  //             context: context,
  //             builder: (context) => AlertDialog(
  //               title: Center(
  //                 child: Text('Your item already have'),
  //               ),
  //               actions: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     TextButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: Text('Delete'),
  //                     ),
  //                     TextButton(
  //                       onPressed: () {
  //                         // _addPopupItem(index);
  //                       },
  //                       child: Text('add more'),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           );
  //         } else {
  //           item[index]['Selectitem'] = !item[index]['Selectitem'];
  //           context.read<CounterProvider>().addItem(item[index]);
  //         }
  //       },
  //     );
  //   } else {
  //     item[index]['Selectitem'] = !item[index]['Selectitem'];
  //     context.read<CounterProvider>().addItem(item[index]);
  //   }
  //   // Navigator.pop(context);
  //   setState(() {});
  // }

  void _onGetItem(int index) {
    print(index);
    List itemAdd = context.read<CounterProvider>().product;
    // var stockQrtCp = itemAdd.toList();
    var findProducts = itemAdd.firstWhere(
        (element) => (element['id'] == item[index]['id']),
        orElse: () => null);
    if (findProducts != null) {
      if (item[index]['count'] == 0) {}
      findProducts['count'] = item[index]['count'];

      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: Center(
      //       child: Text('Your item already have'),
      //     ),
      //     actions: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             child: Text('Delete'),
      //           ),
      //           TextButton(
      //             onPressed: () {
      //               // _addPopupItem(index);
      //             },
      //             child: Text('add more'),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // );
    } else {
      item[index]['Selectitem'] = !item[index]['Selectitem'];
      context.read<CounterProvider>().addItem(item[index]);
    }
    // if (stockQrtCp.length > 0) {
    //   stockQrtCp.forEach(
    //     (element) {
    //       if (element['id'] == item[index]['id']) {
    //       } else {
    //         item[index]['Selectitem'] = !item[index]['Selectitem'];
    //         context.read<CounterProvider>().addItem(item[index]);
    //       }
    //     },
    //   );
    // } else {
    //   item[index]['Selectitem'] = !item[index]['Selectitem'];
    //   context.read<CounterProvider>().addItem(item[index]);
    // }
    setState(() {});
  }

  void _increment(int index) {
    item[index]['count'] = item[index]['count'] + 1;
    item[index]['total'] = item[index]['count'] * item[index]['price'];

    setState(
      () {},
    );
  }

  void _decrement(int index) {
    item[index]['count'] = item[index]['count'] - 1;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.green.shade100,
        title: Text(
          'SU SHI',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Promo(),
              SizedBox(
                height: 25,
              ),
              _SearchBox(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Food Menu',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: item.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 200,
                            width: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green[200],
                              image: DecorationImage(
                                image: AssetImage(
                                  item[index]['image'],
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item[index]['food'],
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _decrement(index);
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text(item[index]['count'].toString()),
                              IconButton(
                                onPressed: () {
                                  _increment(index);
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                              ),
                              onPressed: () {
                                _onGetItem(index);
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              _onChangeStar(index);
                            },
                            icon: Icon(
                              color: Colors.yellow,
                              item[index]['isSelected']
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\$ ${item[index]['price'].toString()}',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _Promo() {
    return Container(
      height: 150,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Get 50% promo',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                PromoButton(
                  text: 'Get in to',
                ),
              ],
            ),
            Image.asset(
              'assets/images/sushi6.png',
              width: 150,
            ),
          ],
        ),
      ),
    );
  }

  TextField _SearchBox() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search here',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade200),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade200),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade200),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
