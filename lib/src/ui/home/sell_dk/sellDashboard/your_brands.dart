import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/models/brand.dart';
import 'package:digitalkarobaar/src/repository/product_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class YourBrands extends StatefulWidget {
  @override
  _YourBrandsState createState() => _YourBrandsState();
}

class _YourBrandsState extends State<YourBrands> {
  Future<List<Brand>> _getBrands() async {
    return await ProductRepository.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LanguageKeys.brand.translate(context)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add a new Brand',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      Text('Add a new Brand and start selling',
                          style: GoogleFonts.poppins(fontSize: 12)),
                      Text('its products on digitalKarobaar',
                          style: GoogleFonts.poppins(fontSize: 12)),
                    ],
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () {
                        Navigator.pushNamed(context, RouterName.brandsMov,
                            arguments: true);
                      },
                      child: Text(LanguageKeys.add.translate(context)))
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Divider(color: Colors.red, height: 25),
                  Text(
                    '  APPROVED BRANDS',
                    style: GoogleFonts.openSans(fontSize: 15),
                  ),
                  FutureBuilder<List<Brand>>(
                      future: _getBrands(),
                      builder: (_, snap) {
                        if (snap.hasError) {
                          return Center(child: Text('Error: ${snap.error}'));
                        } else if (snap.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snap.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snap.data.length,
                              itemBuilder: (c, pos) {
                                return ListTile(
                                  leading: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: CachedNetworkImage(
                                      imageUrl: snap.data[pos].image,
                                      placeholder: (context, url) =>
                                          Icon(Icons.broken_image),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.broken_image),
                                    ),
                                  ),
                                  title: Text(snap.data[pos].title,
                                      style: TextStyle(fontSize: 12)),
                                  subtitle: Text(snap.data[pos].status,
                                      style: TextStyle(fontSize: 12)),
                                );
                              });
                        } else {
                          return Text('');
                        }
                      })
                ],
              )
            ],
          ),
        ));
  }
}
