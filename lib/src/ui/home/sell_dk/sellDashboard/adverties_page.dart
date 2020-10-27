
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/models/home_image.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class Advertiespage extends StatefulWidget {
  @override
  _AdvertiespageState createState() => _AdvertiespageState();
}

class _AdvertiespageState extends State<Advertiespage> {


  bool isLoading = true;

    List<HomeImages> images;
    @override
  void initState() {
   
    _getImages();
    super.initState();
  }

  _getImages()async{
    var imagesList = await HomeReposiitory.getImages();
    setState(() {
      images = imagesList;
      print(images[0]);
      if(images != null){
        isLoading = false;
      }

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.advertised.translate(context)),
      ),
      body: isLoading
      ?Center(

        child: CircularProgressIndicator(),
      )
      :
      //ListView(children: [
      
      
      ListView(
        children: [
         Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container
              (
                height: 200,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].productProfileIcon,fit: BoxFit.cover,);
                            }
                            ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Center(
                child: Text(
                   "Are you struggling with Slumped Sales, Late Payements and Pricy- Logistics? You've come to the right place! Now increase your brand coverage throughout India and get Bulk Orders for your products - while sitting in your offices / factories! With in- house logisitics and payment handling system, DigitalKarobaar is a complete package which will help your business reach a National Audience - without any tension whatsoever!",style: TextStyle(fontSize: 20),
                )
                ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Center(
                child: Text(
                   "With Advertising on DigitalKarobaar- you are reaching ",style: TextStyle(fontSize: 20),
                )
                ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Center(
                child: Text(
                   "i) An average of 5000 retailers / Outstation parties of your industry.",style: TextStyle(fontSize: 17),
                )
                ),
            ),
              SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Center(
                child: Text(
                   "ii) 20X more eyeballs on your brand and its products.",style: TextStyle(fontSize: 17),
                )
                ),
            ),
              SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Center(
                child: Text(
                   "iii) Create a name for your brand and yourself throughout India!",style: TextStyle(fontSize: 17),
                )
                ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Center(
                child: Text(
                   "So what are you waiting for? Contact our team for posting your brand's advertisment now! ",style: TextStyle(fontSize: 20),
                )
                ),
            ),
            SizedBox(height: 50),




            InkWell(
              onTap: (){
                  _chooseOption();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor
                ),
                height: 50,
                width: 200,
                child: Center(
                  child: Text(LanguageKeys.postAdvertisment.translate(context))
                ) ,),
              ),
              SizedBox(height: 50,)
          ]
        ),
        ]

      ),
      //SizedBox(height: 50),
      
    
    );
  }



  _chooseOption() async {
                    return showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context)
                      {
                        return AlertDialog(
                          title: Text("Call for support"),
                          content: Container(
                            height: 300,
                            child: Column(
                              children: [
                               
                                ListTile(
               
                                  onTap: (){
                  
                                 String phoneno='tel: 8287007747';
                                      launch(phoneno);
                },
                leading: CircleAvatar(
                  child: Image.asset("assets/icons/call.png"),
                ),
                title: Text("8287007747",style: TextStyle(fontSize: 14)),

              ),
              Divider(),
              ListTile(
               
                                  onTap: (){
                  
                                 String phoneno='tel: 9818246861';
                                      launch(phoneno);
                },
                leading: CircleAvatar(
                  child: Image.asset("assets/icons/call.png"),
                ),
                title: Text("9818246861",style: TextStyle(fontSize: 14)),

              ),
              Divider(),
              ListTile(
                //onLongPress: (){},
                onTap: (){
                  FlutterOpenWhatsapp.sendSingleMessage("+91 9818246861", "Hello, I want to become a premium seller in Digital Karobaar platform");
                },
                leading: CircleAvatar(
                  child: Image.asset("assets/icons/whatsapp.png"),
                ),
                title: Text("Digital Karobaar WhatsApp",style: TextStyle(fontSize: 14)),

              ),
              Divider(),
              ListTile(
                //onLongPress: (){},
                onTap: (){
                  FlutterOpenWhatsapp.sendSingleMessage("+91 8287007747", "Hello, I want to become a premium seller in Digital Karobaar platform");
                },
                leading: CircleAvatar(
                  child: Image.asset("assets/icons/whatsapp.png"),
                ),
                title: Text("Digital Karobaar WhatsApp",style: TextStyle(fontSize: 14)),

              ),
              
                              ],
                            ),
                          ),
                            actions: [
                              Container(
                                child: Center(child: Column(
                                  children: <Widget> [
                                    Text(""),
                                  ]
                                ),),
                              )
                            ],                          
                        );
                      }
                      );
                  }
}