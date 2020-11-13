// //import 'package:digitalkarobaar/src/models/Member.dart';
// import 'package:digitalkarobaar/src/models/Member.dart';
// import 'package:digitalkarobaar/src/repository/sell_respository.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';

// class TeamMember extends StatefulWidget {
//   @override
//   _TeamMemberState createState() => _TeamMemberState();
// }

// class _TeamMemberState extends State<TeamMember> {
 
//  bool isLoading = true;
//   List<Member> member;

//   @override
//   void initState() {
//     _getMember();
//     super.initState();
//   }

//   _getMember() async {
//     var memberList = await SellRepository.getMember();
//     setState(() {
//       member = memberList;
//       if (member != null) {
//         isLoading = false;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: member.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return _buildCategories(
//                     member[index].id,
//                     member[index].phoneNo, member[index].status,
//                     //member[index].id.toString()
//                   );
//                 }));
//   }

//   _buildCategories(int id, String phoneNo, String status) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//           child: Container(
//             height: 50,
//             width: 400,
//             child: Container(
//               child: Row(children: [
//                 Container(
//                     height: 50,
//                     width: 170,
//                     child: Row(
//                       children: [
//                         Text(phoneNo),
//                         SizedBox(width: 20),
//                         status != null
//                             ? Text(
//                                 status,
//                                 style: GoogleFonts.poppins(fontSize: 12),
//                               )
//                             : Text(''),
//                       ],
//                     )),
//                 SizedBox(width: 90),
//                 InkWell(
//                   onTap: () {
//                    SellRepository.removeMember(id).then((value) {
//                              _getMember();
//                     });
                   
//                   },
//                   child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: AppColors.primaryColor),
//                       height: 30,
//                       width: 80,
//                       child: Center(
//                         child: Text("remove"),
//                       )),
//                 )
//               ]),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }


//import 'package:digitalkarobaar/src/models/Member.dart';
import 'package:digitalkarobaar/src/models/Member.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';

class TeamMember extends StatefulWidget {
  @override
  _TeamMemberState createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
 
 bool isLoading = true;
  List<Member> member;

  @override
  void initState() {
    _getMember();
    super.initState();
  }

  _getMember() async {
    var memberList = await SellRepository.getMember();
    setState(() {
      member = memberList;
      if (member != null) {
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: member.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCategories(
                    member[index].id,
                    member[index].phoneNo, member[index].status,
                    //member[index].id.toString()
                  );
                }));
  }

  _buildCategories(int id, String phoneNo, String status) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            height: 50,
            width: 400,
            child: Container(
              child: Row(children: [
                Container(
                    height: 50,
                    width: 170,
                    child: Row(
                      children: [
                        Text(phoneNo),
                        SizedBox(width: 20),
                        status != null
                            ? Text(
                                status,
                                style: GoogleFonts.poppins(fontSize: 12),
                              )
                            : Text(''),
                      ],
                    )),
                SizedBox(width: 90),
                InkWell(
                  onTap: () {
                   SellRepository.removeMember(id).then((value) {
                             _getMember();
                    });
                   
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor),
                      height: 30,
                      width: 80,
                      child: Center(
                        child: Text("remove",style: TextStyle(
                          color: Colors.white
                        ),),
                      )),
                )
              ]),
            ),
          ),
        )
      ],
    );
  }
}