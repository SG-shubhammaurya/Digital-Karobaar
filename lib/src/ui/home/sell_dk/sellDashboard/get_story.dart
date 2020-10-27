import 'package:flutter/material.dart';

class SellerStoty extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Story'),
          actions: [
            InkWell(
                onTap: () {
                  //Navigator.pushNamed(context,);
                },
                child: Icon(Icons.send))
          ],
        ),
        // body: SingleChildScrollView(
        //   primary: true,
        //   child: Column(
        //     children: [
        //       FutureBuilder<List<SellerStory>>(
        //           future: _getsellerStory(),
        //           builder: (c, snap) {
        //             if (snap.hasError) {
        //               return Center(child: Text('Error: ${snap.error}'));
        //             }
        //             if (snap.connectionState == ConnectionState.waiting) {
        //               return Center(child: CircularProgressIndicator());
        //             }

        //             if (snap.hasData) {
        //               return Container(
        //                 height: 100,
        //                 child: ListView.builder(
        //                     scrollDirection: Axis.horizontal,
        //                     shrinkWrap: true,
        //                     itemCount: snap.data.length,
        //                     itemBuilder: (c, i) {
                              
        //                       return InkWell(
        //                           onTap: () {
        //                             Navigator.of(context).push(
        //                                 MaterialPageRoute(
        //                                     builder: (context) => MoreStories(
        //                                         story,
        //                                         snap.data[i].seller
        //                                             .toString())));
        //                           },
        //                           child: CircleAvatar(
        //                             child: CachedNetworkImage(
        //                                 imageUrl: snap.data[i].image),
        //                           ));
        //                     }),
        //               );
        //             } else {
        //               return Center(child: Text("No Story"));
        //             }
        //           }),
        //       FutureBuilder<List<Products>>(
        //           future: _getSellerProducts(),
        //           builder: (c, snaps) {
        //             if (snaps.hasError) {
        //               return Center(child: Text('Error: ${snaps.error}'));
        //             }
        //             if (snaps.connectionState == ConnectionState.waiting) {
        //               return Center(child: CircularProgressIndicator());
        //             }
        //             if (snaps.hasData) {
        //               return ListView.builder(
        //                   shrinkWrap: true,
        //                   primary: false,
        //                   itemCount: snaps.data.length,
        //                   itemBuilder: (c, i) {
        //                     return Padding(
        //                       padding:
        //                           const EdgeInsets.symmetric(horizontal: 30),
        //                       child: Container(
        //                           margin: EdgeInsets.symmetric(vertical: 5),
        //                           decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(10),
        //                               color: Color(0xffffffff),
        //                               boxShadow: [
        //                                 BoxShadow(
        //                                     color: Color(0x14657786),
        //                                     offset: Offset(0, 8),
        //                                     blurRadius: 16.0,
        //                                     spreadRadius: 0)
        //                               ]),
        //                           child: Column(
        //                             //  crossAxisAlignment: CrossAxisAlignment.center,
        //                             children: [
        //                               SizedBox(height: 10),
        //                               Container(
        //                                 width: 280,
        //                                 height: 180,
        //                                 color: Colors.grey[300],
        //                                 child: Icon(
        //                                   Icons.broken_image,
        //                                   color: Colors.black12,
        //                                 ),
        //                                 // child: CachedNetworkImage(
        //                                 //     fit: BoxFit.cover,
        //                                 //     height: 40,
        //                                 //     width: 40,
        //                                 //     imageUrl: snaps.data[i].image1),
        //                               ),
        //                               SizedBox(height: 10),
        //                               Padding(
        //                                 padding:
        //                                     const EdgeInsets.only(left: 20),
        //                                 child: Align(
        //                                   alignment: Alignment.centerLeft,
        //                                   child: ConstrainedBox(
        //                                       constraints: BoxConstraints(
        //                                           maxHeight:
        //                                               MediaQuery.of(context)
        //                                                   .size
        //                                                   .height),
        //                                       child: Text(snaps.data[i].title,
        //                                           style: TextStyle(
        //                                             fontFamily: 'Roboto',
        //                                             color: Color(0xff657786),
        //                                             fontSize: 14,
        //                                             fontWeight: FontWeight.w400,
        //                                             fontStyle: FontStyle.normal,
        //                                           ))),
        //                                 ),
        //                               ),
        //                               SizedBox(height: 5),
        //                               Padding(
        //                                 padding:
        //                                     const EdgeInsets.only(left: 20),
        //                                 child: Align(
        //                                   alignment: Alignment.centerLeft,
        //                                   child: ConstrainedBox(
        //                                       constraints: BoxConstraints(
        //                                           maxHeight:
        //                                               MediaQuery.of(context)
        //                                                   .size
        //                                                   .height),
        //                                       child: Text(
        //                                           snaps.data[i].description,
        //                                           style: TextStyle(
        //                                             fontFamily: 'Roboto',
        //                                             color: Color(0xff657786),
        //                                             fontSize: 14,
        //                                             fontWeight: FontWeight.w400,
        //                                             fontStyle: FontStyle.normal,
        //                                           ))),
        //                                 ),
        //                               ),
        //                               SizedBox(height: 10),
        //                             ],
        //                           )),
        //                     );
        //                   });
        //             } else {
        //               return Text('');
        //             }
        //           })
        //     ],
        //   ),
        // )
        );
  }
}
