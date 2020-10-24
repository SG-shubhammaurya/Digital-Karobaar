import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            //Add Operation
          },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("All Categories"),
                  ],
                ),
              ),
              SizedBox(
                height: 10
              ),
              GestureDetector(onTap: () {
               Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
                width: 1000,
            
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Clother"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),




              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
                width: 1000,
             
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("HardWare"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),

              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
               
               
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Kitchen"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
                width: 1000,
             
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Groosery"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
                width: 1000,
              
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Beauty & Personal Care"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
                width: 1000,
             
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Business Services"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
            
               
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Construction & Real Estate"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
              
              
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Consumer Electronics"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
            
               
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Environment"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
              
             
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Gifts & Creafts"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
           
              
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Health & Medical"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
           
             
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Garden"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                 Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
             
              
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Textiles"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
          
            
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Lights & Lightning"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, RouterName.subCategories);
              },
              child: Container(
                height: 50,
            
             
                child: Row(
                  children: <Widget> [
                    SizedBox(width: 20,),
                    Image.network("https://googleflutter.com/sample_image.jpg",),
                    SizedBox(width: 20,),
                    Text("Packaging & Printing"),
                  ]
                ),
              ),
              ),
              SizedBox(height: 10),
              
              
            ]
          )
          
        ],

      ),

    );
  }
}