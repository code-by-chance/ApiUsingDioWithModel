import 'package:api_http/Product.dart';
import 'package:api_http/display_product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCall extends StatelessWidget {
  Future<List<Product>> fetchAPI() async {
    Dio dio = Dio();

    var response = await dio.get('https://fakestoreapi.com/products');

    final List<dynamic> responseData = response.data;
    List<Product> products =
        responseData.map((json) => Product.fromJson(json)).toList();

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: fetchAPI(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayProduct(
                            product: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                        child: ListTile(
                            title: Text('${snapshot.data![index].title}'),
                            subtitle: Text('${snapshot.data![index].price}'))),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

//now it looks more clear to understand
