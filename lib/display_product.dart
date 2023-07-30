import 'package:api_http/Product.dart';
import 'package:flutter/material.dart';

class DisplayProduct extends StatelessWidget {
  final Product product;

  DisplayProduct({required this.product});
  //here we have a single model for all data 
  //we have also created a nested model for rating and product count 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(children: [
          Text(product.title.toString()),
          Text(product.price.toString()),
          Text(product.description.toString()),
          Text(product.rating.rate.toString()),
          Text(product.rating.count.toString())
        ])),
      ),
    );
  }
}

//this was no easy to pass data 
// now we will do this using model