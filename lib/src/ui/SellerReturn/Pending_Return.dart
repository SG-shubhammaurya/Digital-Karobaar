import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/seller_returmget.dart';
import 'package:digitalkarobaar/src/repository/dashboard_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
class SellerPendingReturn extends StatefulWidget {
  @override
  _SellerPendingReturnState createState() => _SellerPendingReturnState();
}

class _SellerPendingReturnState extends State<SellerPendingReturn> {
 
  List<SellerReturnGet> sellerReturn;
  bool isLoading = true;
  final scrollController = ScrollController(initialScrollOffset: 0);

  
  @override
  void initState() {
    _getSellerReturn();
    super.initState();
  }

   _getSellerReturn() async {
    var sellerReturnList =
        await DashRepository.getSellerPendingReturn().catchError((e) {
      setState(() {
        isLoading = false;
      });
    });
      if (sellerReturnList != null) {
      setState(() {
        sellerReturn = sellerReturnList;
        isLoading = false;
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LanguageKeys.returns.translate(context),
            style: TextStyle(color: Colors.white),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: "Back",
              );
            },
          ),
          
          actions: [

             GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.sellerDash);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                       LanguageKeys.dashboard.translate(context),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),


          ],
        ),
        body: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    height: 50,
                    width: 250,
                    //color: Colors.white,
                   child: Center(child: Text("Click Pending to know more",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),))
                  ),
                ),
                Text("|"),
                SizedBox(width: 8.0),
                GestureDetector(
                    onTap: () {
                      showDefaultSnackBar(context);
                    },
                    child: Container(
                      child: Text(
                        "Pending",
                      ),
                    ))
              ],
            ),
            Divider(height: 10.0),
            SizedBox(
              height: 50.0,
            ),

            

             isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                  ))
                : sellerReturn.length == 0
                    ? Center(child: NoDataAvailable())
                    : ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: sellerReturn.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildReturn(
                            sellerReturn[index].id,
                            sellerReturn[index].message,
                            sellerReturn[index].file,
                            sellerReturn[index].status,
                            sellerReturn[index].order,
                            sellerReturn[index].seller,
                            sellerReturn[index].user,
                          );
                        }),




            /////ListView.builder(itemBuilder: null),




          ],
        ));
  }

  void showDefaultSnackBar(BuildContext context) {
    Flushbar(
      isDismissible: true,
      titleText: Container(
        height: 50,
        width: (MediaQuery.of(context).size.width),
        child: Center(
            child: Text("Your Return",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
      ),
      backgroundColor: AppColors.primaryColor,
      messageText: Column(children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.sellerReturn);
              },
              child: Container(
                  child: Text(
                "all Return",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        Divider(color: Colors.white,),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.sellerPendingReturn);
              },
              child: Container(
                  child: Text(
                "Pending",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        Divider(color: Colors.white,),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.sellerApprovedReturn);
              },
              child: Container(
                  child: Text(
                "Approved",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        
      ]),
      duration: Duration(seconds: 5),
    )..show(context);
  }


  _buildReturn(int id,String message,String file,String status,
                int order, int seller, int user, )  {
     return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, RouterName.productDetails,
                arguments:  id
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: AppColors.primaryColor)
              ),
              //color: Colors.blue,
              height: 100,
              width: 500,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      child:
                       isLoading
                       ? Center(
                       child: CircularProgressIndicator(
                       valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                       ) 
                       ):
                      Image.network(file,fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.only(right:50.0),
                      child: Container(
                        height: 25,
                        width:150,
                        child: Row(children: [
                          Text("Status",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 10.0,),
                          Text(status),
                        ],)
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 50,
                      width: 210,
                      //color: Colors.blueAccent,
                      child: Row(children: [
                        Text("Reason",style: TextStyle(fontWeight: FontWeight.bold) ,),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: ()
                          {
                            _buildDialogue(message);
                          },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1,color: AppColors.primaryColor),
                            //color: Colors.brown
                          ),
                          height: 50,
                          width: 145,
                          child: Center(
                            child:Text(message)
                          ),
                          //color: Colors.brown,

                        )
                        ),
                      ],),
                    )

                  ],
                  )


              ],)
            ),
          )
        )
      ],
    );
  }

  _buildDialogue(String message) {
    AlertDialog alert = AlertDialog(
      title: Text("Reason"),


      content:
      Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   border: Border.all(width: 1,)
        // ),
        height: 200,
        width: 200,
        child:Container(
        //   decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   border: Border.all(width: 1,)
        // ),
          child: ListView(children: [
            Center(child: Text(message)),
          ],),
        )
      )
      
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
      );

  }
 
}