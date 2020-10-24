import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchQuery;
  final _focusNode = FocusNode();

  @override
  void initState() {
    _searchQuery = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
       title:Container(child: _searchproducts(context)),
         leading: InkWell(
            onTap: (){
               Navigator.of(context).pop();

            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
          
     
      ),
     
    );
  }

  Widget _searchproducts(BuildContext context) {
   
    return Expanded(
        child: TypeAheadFormField<Products>(
      textFieldConfiguration: TextFieldConfiguration(
         
          decoration: InputDecoration.collapsed(
            //  prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white,
                fontSize: 15
                ),
               hintText: "Search Products"),
          controller: _searchQuery),
      suggestionsCallback: (pattern) async {
        return await HomeReposiitory.searchProduts(pattern).then((value) {
          return value;
        }).catchError((e) {});
      },
      itemBuilder: (context, suggestion) {
       
        return ListTile(
              leading: CachedNetworkImage(
                height: 30,
                width: 30,
                imageUrl: suggestion.image1,
                colorBlendMode: BlendMode.darken,
                errorWidget: (context, url, error) => Image.network(
                  'https://azadchaiwala.pk/getImage?i=&t=course',
                  width: 30,
                  height: 30,
                ),
              ),
              title: Text(
                suggestion.title,style: GoogleFonts.poppins(
                fontSize: 12
              ),
              ),
              subtitle: Text(suggestion.brand,style: GoogleFonts.poppins(
                fontSize: 10
              ),),
              trailing: Text(suggestion.rating,style:GoogleFonts.poppins(
                fontSize: 10
              ),),
              );
      },
      onSuggestionSelected: (suggestion) async {
        Navigator.pushNamed(context, RouterName.productDetails,arguments: suggestion.id);
      
      },
    ));
  }
}



