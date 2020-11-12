import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/repository/product_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  final title;
  const ProductPage(this.title);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  bool grid = false;
  TextEditingController _minOrderDigitController = TextEditingController();
  TextEditingController _minController = TextEditingController();
  TextEditingController _maxDigitController = TextEditingController();

  _onClear() {
    setState(() {
      _minOrderDigitController.clear();
      _minController.clear();
      _maxDigitController.clear();
      _isChecked = false;
      _isChecked1 = false;
      Navigator.of(context).pop();
    });
  }

  bool isLoading = true;
  List<Products> productItem = [];
  bool monVal = false;
  bool _isChecked = false;
  bool _isChecked1 = false;
  _getProductItem() async {
    var products = await HomeReposiitory.searchProduts(widget.title);
    setState(() {
      productItem = products;
      if (productItem != null) {
        isLoading = false;
      }
    });
  }

  @override
  void initState() {
    _getProductItem();
    super.initState();
  }

  // TabController _tabController;
  // @override
  // void initState() {
  //   _tabController = TabController(length: 6, vsync: this);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          actions: [Container()],
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'Products',
            style: TextStyle(color: Colors.white),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: "front",
              );
            },
          ),
        ),
        endDrawer: Drawer(
            elevation: 1.0,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text("Filter the Products"),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TextField(
                          controller: _minOrderDigitController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: "Min Order <==",
                          ),
                          keyboardType: TextInputType.number),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: <Widget>[
                          Text("Price INR"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: TextField(
                              controller: _minOrderDigitController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                labelText: "min ₹ ",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Expanded(
                          child: TextField(
                            controller: _maxDigitController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              labelText: "max ₹",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(children: <Widget>[
                    Text("Location"),
                    SizedBox(width: 190),
                    Container(
                      child: InkWell(
                        onTap: () {
                          showAlertDialog();
                        },
                        child: Text("All"),
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 5.0),
                      child: Row(children: <Widget>[
                        Text("Vypar Suraksha"),
                        SizedBox(width: 120),
                        Checkbox(
                          activeColor: Color(0xffffa726),
                          value: _isChecked,
                          onChanged: (bool value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 5.0),
                      child: Row(children: <Widget>[
                        Text("Verified Supplier"),
                        SizedBox(width: 120),
                        Checkbox(
                          activeColor: Color(0xffffa726),
                          value: _isChecked1,
                          onChanged: (bool value) {
                            setState(() {
                              _isChecked1 = value;
                            });
                          },
                        ),
                      ]),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: GestureDetector(
                      onTap: _onClear,
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12,
                        ),
                        child: Center(child: Text("Clear all")),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        //Add operation
                      },
                      child: CommonButton(
                          width: 120,
                          buttonColor: AppColors.primaryColor,
                          onTap: () {
                            _filterProducts();
                            Navigator.of(context).pop();
                          },
                          title: 'Done')),
                ])
              ],
            )),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Row(children: <Widget>[
                          SizedBox(width: 10.0),
                          Text(productItem.length.toString()),
                          SizedBox(width: 3.0),
                          Text(
                            "Result",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 110.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.list,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                grid = !grid;
                              });
                            },
                          ),
                          Builder(
                            builder: (context) => IconButton(
                              icon: Icon(Icons.filter),
                              onPressed: () =>
                                  Scaffold.of(context).openEndDrawer(),
                            ),
                          ),
                          Container(
                            height: 45,
                            //  width: 100.0,
                            child: Row(children: <Widget>[
                              // Text("search"),
                              IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                     Navigator.pushNamed(
                                    context, RouterName.searchPage);
                                  })
                            ]),
                          )
                        ]),
                      ),
                    ],
                  ),
                  grid ? _gridView() : _listView(),
                ],
              ),
      ),
    );
  }

  //
  showAlertDialog() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      content: ListView(),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _gridView() {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 0.5,
        
        children: List.generate(productItem.length, (index) {
          return Card(
            child: new Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.productDetails,
                        arguments: productItem[index].id);
                  },
                  child: CachedNetworkImage(
                    imageUrl: productItem[index].image1,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>  Icon(Icons.broken_image),
                  ),
                ),
                Text(productItem[index].title,style: TextStyle(
                  fontSize: 12
                ),),
              
              ],
            ),
          );
        }));
  }

  Widget _listView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: productItem.length,
        primary: false,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouterName.productDetails,
                    arguments: productItem[position].id);
              },
              child: Card(
                child: ListTile(
                  title: Text(
                    productItem[position].title ,
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                  subtitle: Text(productItem[position].category,
                      style: GoogleFonts.poppins(fontSize: 12)),
                  leading: CachedNetworkImage(
                    imageUrl: productItem[position].image1,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _filterProducts() async {
    ProductRepository.getFilterProduct(
            _minController.text, _maxDigitController.text, "")
        .then((value) {
      setState(() {
       productItem = value;
      });
    });
  }
}
