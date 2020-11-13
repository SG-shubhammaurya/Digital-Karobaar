// import 'package:digitalkarobaar/src/bloc/chat_cubit/chat.cubit.dart';
// import 'package:digitalkarobaar/src/bloc/chat_cubit/chat_state.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
// import 'package:digitalkarobaar/src/models/message_response.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key key, this.userId}) : super(key: key);
//   final int userId;

//   @override
//   _MyChatState createState() => _MyChatState();
// }

// class _MyChatState extends State<ChatScreen> {
//   final _textController = TextEditingController();
//   ChatCubit _chatCubit;
//   @override
//   void initState() {
//     _chatCubit = BlocProvider.of<ChatCubit>(context);
//     _chatCubit.loadInCommingMessage();
//     super.initState();
//   }

//   _formateOfTime() {
//     DateTime time = DateTime.now();
//     String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);
//     return formattedDate;
//   }

//  List<MessageResponse> messageRes = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Chat')),
//         body: Stack(
//           children: <Widget>[
//             BlocBuilder<ChatCubit, ChatState>(
//                 cubit: _chatCubit,
//                 builder: (context, state) {
//                   if (state is LoadingSate) {
//                     return Text('');
//                     //Center(child: CircularProgressIndicator());
//                   }
//                   if (state is LoadInCommingMessage) {
                 
//                   messageRes= state.messageResponse;
//                     _bhuildMessage(messageRes);
//                   }
//                   return  _bhuildMessage(messageRes);
//                 }),
//             Divider(height: 1.0),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                   decoration: BoxDecoration(color: Theme.of(context).cardColor),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 2.0),
//                     child: Row(
//                       children: <Widget>[
//                         //Enter Text message here
//                         Flexible(
//                           child: Container(
//                             height: 45,
//                             child: TextField(
//                               controller: _textController,
//                               onSubmitted: (v) {
//                                 _textController.clear();
//                               },
//                               onChanged: (g) {
//                                 setState(() {});
//                               },
//                               decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   fillColor: Colors.black12,
//                                   filled: true,
//                                   hintText: "Enter message"),
//                             ),
//                           ),
//                         ),

//                         //right send button

//                         Container(
//                           margin: EdgeInsets.symmetric(horizontal: 2.0),
//                           width: 48.0,
//                           height: 48.0,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, color: Colors.black12),
//                           child: IconButton(
//                               color: AppColors.primaryColor,
//                               icon: Icon(Icons.send),
//                               onPressed: _textController.text.length == 0
//                                   ? null
//                                   : () {
//                                       _sendMsg(_textController.text, 'right',
//                                           _formateOfTime());

//                                       _textController.clear();
//                                     }),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//           ],
//         ));
//   }

//   void _sendMsg(String msg, String messageDirection, String date) {
//     if (msg.length == 0) {
//       Fluttertoast.showToast(
//           msg: "Please Enter Message",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           //timeInSecForIos: 1,
//           backgroundColor: AppColors.primaryColor);
//     } else {
//       _chatCubit.sendMessage(msg);
//       _chatCubit.loadInCommingMessage();

//       //   _textController.clear();
//       //   Message message = Message(
//       //     msg: msg,
//       //     direction: messageDirection,
//       //     dateTime: date,
//       //   );
//       //   setState(() {
//       //     _messages.insert(0, message);
//       //   });
//     }
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   _bhuildMessage(List<MessageResponse> messageResponse) {
//      if(messageResponse !=null){
//        return ListView.builder(
//         itemCount: messageResponse.length,
//         itemBuilder: (context, index) {
//           if (widget.userId == messageResponse[index].userId) {
//             return Message(
//               msg: messageResponse[index].message,
//               direction: 'right',
//               dateTime: messageResponse[index].messageTime,
//             );
//           } else {
//             return Message(
//               msg: messageResponse[index].message,
//               direction: 'left',
//               dateTime: messageResponse[index].messageTime,
//             );
//           }
//         });
//      } else {
//        return SizedBox();
//      }
//   }
// }

// //
// class Message extends StatelessWidget {
//   Message({this.msg, this.direction, this.dateTime});

//   final String msg;
//   final String direction;
//   final String dateTime;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: direction == 'left'
//           ? Container(
//               child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Stack(
//                       children: <Widget>[
//                         Container(
//                           constraints: BoxConstraints(
//                               maxWidth: MediaQuery.of(context).size.width * .6),
//                           // padding: const EdgeInsets.all(15.0),
//                           decoration: BoxDecoration(
//                             color: Colors.black12,
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(25),
//                               bottomLeft: Radius.circular(25),
//                               bottomRight: Radius.circular(25),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   child: Text(
//                                     msg,
//                                     style: TextStyle(
//                                       fontFamily: 'Gamja Flower',
//                                       fontSize: 15.0,
//                                       color: Color(0xffffffff),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Text(
//                                     createDateFormate(dateTime),
//                                     style: TextStyle(
//                                       fontSize: 8.0,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           width: 180.0,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ))
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Stack(
//                   alignment: Alignment.topRight,
//                   children: <Widget>[
//                     Container(
//                       constraints: BoxConstraints(
//                           maxWidth: MediaQuery.of(context).size.width * .6),
//                       decoration: BoxDecoration(
//                           color: AppColors.primaryColor,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(25),
//                             topRight: Radius.circular(25),
//                             bottomLeft: Radius.circular(25),
//                           )),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: Text(
//                                 msg,
//                                 style: TextStyle(
//                                   fontFamily: 'Gamja Flower',
//                                   fontSize: 15.0,
//                                   color: Color(0xffffffff),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: Text(createDateFormate(dateTime),
//                                   style: TextStyle(
//                                     fontSize: 8.0,
//                                     color: Colors.white,
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//     );
//   }
// }



import 'package:digitalkarobaar/src/bloc/chat_cubit/chat.cubit.dart';
import 'package:digitalkarobaar/src/bloc/chat_cubit/chat_state.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/models/message_response.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key, this.userId}) : super(key: key);
  final int userId;

  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<ChatScreen> {
  final _textController = TextEditingController();
  ChatCubit _chatCubit;
  @override
  void initState() {
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    _chatCubit.loadInCommingMessage();
    super.initState();
  }

  _formateOfTime() {
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);
    return formattedDate;
  }

 List<MessageResponse> messageRes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Chat')),
        body: Stack(
          children: <Widget>[
            BlocBuilder<ChatCubit, ChatState>(
                cubit: _chatCubit,
                builder: (context, state) {
                  if (state is LoadingSate) {
                    return 
                    Center(child: CircularProgressIndicator());
                  }
                  if (state is LoadInCommingMessage) {
                 
                  messageRes= state.messageResponse;
                    _bhuildMessage(messageRes);
                  }
                  return  _bhuildMessage(messageRes);
                }),
            Divider(height: 1.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      children: <Widget>[
                        //Enter Text message here
                        Flexible(
                          child: Container(
                            height: 45,
                            child: TextField(
                              controller: _textController,
                              onSubmitted: (v) {
                                _textController.clear();
                              },
                              onChanged: (g) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black12,
                                  filled: true,
                                  hintText: "Enter message"),
                            ),
                          ),
                        ),

                        //right send button

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black12),
                          child: IconButton(
                              color: AppColors.primaryColor,
                              icon: Icon(Icons.send),
                              onPressed: _textController.text.length == 0
                                  ? null
                                  : () {
                                      _sendMsg(_textController.text, 'right',
                                          _formateOfTime());

                                      _textController.clear();
                                    }),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }

  void _sendMsg(String msg, String messageDirection, String date) async{
    if (msg.length == 0) {
      Fluttertoast.showToast(
          msg: "Please Enter Message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          //timeInSecForIos: 1,
          backgroundColor: AppColors.primaryColor);
    } else {
     await  _chatCubit.sendMessage(msg);
   await   _chatCubit.loadInCommingMessage();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  _bhuildMessage(List<MessageResponse> messageResponse) {
     if(messageResponse !=null){
       return ListView.builder(
        itemCount: messageResponse.length,
        itemBuilder: (context, index) {
          if (widget.userId == messageResponse[index].userId) {
            return Message(
              msg: messageResponse[index].message,
              direction: 'right',
              dateTime: messageResponse[index].messageTime,
            );
          } else {
            return Message(
              msg: messageResponse[index].message,
              direction: 'left',
              dateTime: messageResponse[index].messageTime,
            );
          }
        });
     } else {
       return SizedBox();
     }
  }
}

//
class Message extends StatelessWidget {
  Message({this.msg, this.direction, this.dateTime});

  final String msg;
  final String direction;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: direction == 'left'
          ? Container(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * .6),
                          // padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    msg,
                                    style: TextStyle(
                                      fontFamily: 'Gamja Flower',
                                      fontSize: 15.0,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    createDateFormate(dateTime),
                                    style: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          width: 180.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .6),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                msg,
                                style: TextStyle(
                                  fontFamily: 'Gamja Flower',
                                  fontSize: 15.0,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(createDateFormate(dateTime),
                                  style: TextStyle(
                                    fontSize: 8.0,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
    );
  }
}