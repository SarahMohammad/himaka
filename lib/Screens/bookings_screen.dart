import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/order_details.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/ViewModels/orders_view_model.dart';
import 'package:himaka/services/base_view.dart';

class BookingsScreen extends StatefulWidget {
  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[900], //change your color here
        ),
        centerTitle: true,
        title: Text(
          'Customer Support',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BaseView<OrdersViewModel>(
          onModelReady: (model) {
            refreshScreen(model);
          },
          builder: (context, model, child) => LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
//          if (model.ordersResponse != null) {
//            if (model.homeResponse.data.offers.length != 0) {
//              for (int i = 0;
//              i < model.homeResponse.data.offers.length;
//              i++) {
//                images.add(Image.network(
//                    model.homeResponse.data.offers[i].mainImage));
//              }
//            }
//          }
                return model.state == ViewState.Busy
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlue,
                        ),
                      )
                    : model.ordersResponse != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.lightBlueAccent,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.markunread_mailbox,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'My Bookings',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 6),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(model
                                              .ordersResponse.data.orders.length
                                              .toString() +
                                          " items")),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                        itemCount: model
                                            .ordersResponse.data.orders.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            child: Card(
                                              child: ListTile(
                                                title: Text("Order " +
                                                    model.ordersResponse.data
                                                        .orders[index].id
                                                        .toString()),
                                                subtitle: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      'View Order',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )),
                                                    Icon(
                                                      Icons.brightness_1,
                                                      size: 10,
                                                      color: Colors.green,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(model
                                                        .ordersResponse
                                                        .data
                                                        .orders[index]
                                                        .status)
                                                  ],
                                                ),
                                                trailing: Icon(Icons.phone),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          new OrderDetailsScreen()));
                                            },
                                          );
                                        }),
                                  ),
                                )
                              ])
                        : Center(
                            child: Text('empty'),
                          );
              })),
    );

//    return Scaffold(
//      appBar: AppBar(
//        iconTheme: IconThemeData(
//          color: Colors.grey[900], //change your color here
//        ),
//        centerTitle: true,
//        title: Text(
//          'Customer Support',
//          style: TextStyle(color: Colors.black),
//        ),
//        backgroundColor: Colors.transparent,
//        elevation: 0.0,
//      ),
//      body:
//
//      Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            Padding(
//              padding: const EdgeInsets.symmetric( vertical: 6),
//              child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  color: Colors.lightBlueAccent,
//                  child: Row(
//                    children: [
//                      Icon(Icons.markunread_mailbox , color: Colors.white,),
//                      SizedBox(width: 15,),
//                      Text('My Bookings' , style: TextStyle(color: Colors.white),),
//                    ],
//                  ) , padding: EdgeInsets.all(20),),
//            ),
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal : 15.0 , vertical: 6),
//          child: Container(
//              width: MediaQuery.of(context).size.width,
//              child: Text('8 items')),
//        ),
//        Expanded(
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: ListView.builder(
//                itemCount: 7,
//                itemBuilder: (BuildContext context, int index) {
//                  return InkWell(
//                    child: Card(
//                      child: ListTile(
//                        title: Text('Order 5678'),
//                        subtitle: Row(children: [
//                          Expanded(child: Text('View Order' , style: TextStyle(color: Colors.red),)),
//                          Icon(Icons.brightness_1 , size: 10,color: Colors.green,),
//                          SizedBox(width: 4,),
//                          Text('Shipped at 15 sep')
//                        ],),
//                        trailing: Icon(Icons.phone),
//                      ),
//                    ),
//                    onTap: (){
//                      Navigator.push(
//                          context,
//                          new MaterialPageRoute(
//                              builder: (
//                                  context) => new OrderDetailsScreen()));
//                    },
//                  );
//                }),
//          ),
//        )
//      ]),
//    );
  }

  void refreshScreen(OrdersViewModel model) {
    model.getOrders("");
  }
}
