import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';

import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isLoading = true;
  List<Products> productItem;

  @override
  void initState() {
    _getProductItem();
    super.initState();
  }

  _getProductItem() async {
    productItem=[];
    var products = await HomeReposiitory.getProducts();
    setState(() {
     productItem = products;
      if (productItem != null) {
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: false,
              itemCount: productItem.length,
              itemBuilder: (context, pos) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.productDetails,
                        arguments: productItem[pos].id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 5,
                                spreadRadius: 5,
                                offset: Offset(0, 10)
                              )
                            ]
                          ),
                      child: ListTile(
                          leading: SizedBox(
                            
                            height: 100,
                            width: 100,
                            child: CachedNetworkImage(
                              imageUrl: productItem[pos].image1,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.broken_image,color: Colors.black12),
                            ),
                          ),
                          title: Text(productItem[pos].title,
                              style: TextStyle(fontSize: 12)),
                          subtitle: Text(productItem[pos].brand,
                              style: TextStyle(fontSize: 12)),
                         ),
                    ),
                  ),
                );
              }),
    );
  }
}
