import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/models/sub_categories.dart';
import 'package:digitalkarobaar/src/repository/product_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategories extends StatefulWidget {
  final categoriesId;
  const SubCategories(this.categoriesId);
  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  bool grid = true;
  List<SubCategory> subCategories;
  bool isLoading = true;

  @override
  void initState() {
    _getSubCategories();
    super.initState();
  }

  String notAvailable;
  _getSubCategories() async {
    subCategories =
        await ProductRepository.getSubCategories(widget.categoriesId);

    if (subCategories != null) {
      setState(() {
        isLoading = false;
        notAvailable = "Not Available";
      });
    }
    if (subCategories.isEmpty) {
      setState(() {
        isLoading = false;
        notAvailable = "Not Available";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sub Categories"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    grid = !grid;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.list)],
                ),
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : grid ? _buildGrid() : _buildList(),
            ],
          ),
        ));
  }

  _buildList() {
    return subCategories.length == 0
        ? Center(child: Text('Coming Soon'))
        : ListView(
            shrinkWrap: true,
            primary: false,
            children: List.generate(subCategories.length, (index) {
              return Padding(
                 padding: const EdgeInsets.all(8.0),

                 child: GestureDetector(
                   onTap: () {
                     Navigator.pushNamed(
                          context, RouterName.subCategoriesDetails,
                          arguments: subCategories[index].title);
                   },
                   child: Card(
                     
                     child: Row(
                       children: [
                       Container(
                      height: 120,
                      width: 200,
                      color: Colors.pink[50],
                      child: subCategories[index].image == null
                          ? Text('')
                          : CachedNetworkImage(
                              imageUrl: subCategories[index].image,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.broken_image),
                            ),
                    ),
                    SizedBox(width: 30),
                    Column(
                      children:[
                        Text(
                         subCategories[index].title,
                         style: GoogleFonts.poppins(
                           fontSize: 14,
                         ),
                       ),
                        Text(subCategories[index].category,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        )),

                      ]
                    )
                       ]
                     )
                   
                   ,)
                 ),
              //   child: ListTile(
              //     leading: InkWell(
              //       onTap: () {
                      // Navigator.pushNamed(
                      //     context, RouterName.subCategoriesDetails,
                      //     arguments: subCategories[index].title);
              //       },
              //       child: Container(
              //         height: 400,
              //         width: 150,
              //         color: Colors.pink[50],
              //         child: subCategories[index].image == null
              //             ? Text('')
              //             : CachedNetworkImage(
              //                 imageUrl: subCategories[index].image,
              //                 placeholder: (context, url) =>
              //                     Center(child: CircularProgressIndicator()),
              //                 errorWidget: (context, url, error) =>
              //                     Icon(Icons.broken_image),
              //               ),
              //       ),
              //     ),
              //     title: Text(
              //       subCategories[index].title,
              //       style: GoogleFonts.poppins(
              //         fontSize: 14,
              //       ),
              //     ),
              //     subtitle: Text(subCategories[index].category,
              //         style: GoogleFonts.poppins(
              //           fontSize: 12,
              //         )),
              //   ),
              // );
              );
            }));
  }

  _buildGrid() {
    return subCategories.length == 0
        ? Center(child: Text('Coming Soon'))
        : GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: _getList());
  }

  _getList() {
    return List.generate(subCategories.length, (index) {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouterName.subCategoriesDetails,
              arguments: subCategories[index].title);
        },
        child: Card(
          elevation: 1.0,
          child: new Column(
            children: <Widget>[
              Container(
                height: 120,
                width: 180,
                color: Colors.pink[50],
                child: subCategories[index].image == null
                    ? Text('')
                    : Image.network(subCategories[index].image,
                        fit: BoxFit.cover),
              ),
              Spacer(),
              Text(
                subCategories[index].title,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              Text(subCategories[index].category,
                  style: GoogleFonts.poppins(fontSize: 12)),
            ],
          ),
        ),
      );
    });
  }
}
