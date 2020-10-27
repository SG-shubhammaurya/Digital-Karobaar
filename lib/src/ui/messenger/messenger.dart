import 'package:digitalkarobaar/src/bloc/chat_cubit/chat.cubit.dart';
import 'package:digitalkarobaar/src/bloc/chat_cubit/chat_state.dart';
import 'package:digitalkarobaar/src/models/message_response.dart';
import 'package:digitalkarobaar/src/models/user_profile.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Messenger extends StatefulWidget {
  @override
  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
   ChatCubit  chatCubit;
   bool isLoading=true;
  @override
  void initState() {
    chatCubit= BlocProvider.of<ChatCubit>(context);
    chatCubit.loadInCommingMessage();
    _getUserProfile();
    super.initState();
  }
   UserProfile _userProfileDtails;
  _getUserProfile() async {
    var profile = await HomeReposiitory.getProfileInfo();
    setState(() {
     _userProfileDtails = profile;
      if (_userProfileDtails != null) {
        isLoading= false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        appBar: AppBar(
        
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: Colors.black45),
          iconTheme: IconThemeData(color: Colors.black45),
          title: Text("Messenger",style: TextStyle(color:Colors.white)),
          
        ),
        body:BlocBuilder<ChatCubit, ChatState>(
         cubit: chatCubit,
          builder: (context, state) {
          if (state is LoadingSate) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadInCommingMessage) {
           ListView.builder(
                shrinkWrap: true,
                itemCount: state.messageResponse.length,
                itemBuilder: (context, index) {
                  if(_userProfileDtails.id != state.messageResponse[index].userId){
                   return _buildBody(context, state.messageResponse[index]);
                  }
                });
          }
          return Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Center(child: Text("Select one of the given option",style: TextStyle(fontWeight: FontWeight.bold),)),
              SizedBox(
                height: 20.0
              ),
              Divider(),
              ListTile(
                onTap: () => Navigator.of(context).pushNamed(RouterName.chat,arguments:_userProfileDtails.id),
                leading: CircleAvatar(
                ),
                title: Text('Message Now',style: 
                TextStyle(
                fontSize: 14),
                ),
              ),
              Divider(),
              ListTile(
                onTap: (){
                  FlutterOpenWhatsapp.sendSingleMessage("+91 9818246861", "Hello, I am the user of Digital Karobaar platform please solve my issue");
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
                  FlutterOpenWhatsapp.sendSingleMessage("+91 8287007747", "Hello, I am the user of Digital Karobaar platform please solve my issue");
                },
                leading: CircleAvatar(
                  child: Image.asset("assets/icons/whatsapp.png"),
                ),
                title: Text("Digital Karobaar WhatsApp",style: TextStyle(fontSize: 14)),

              ),
 
              Divider(),
            ],
          );
        },
      ),
    );
  }

  _buildBody(BuildContext context, MessageResponse messageResponse) {
    return ListTile(
      isThreeLine: true,
      onLongPress: () {
        Navigator.pushNamed(context, RouterName.mainPage);
      },
      onTap: () => Navigator.of(context).pushNamed(RouterName.chat,arguments: _userProfileDtails.id),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.3),
                offset: Offset(0, 5),
                blurRadius: 25),
          ],
        ),
        child: CircleAvatar(
            // backgroundImage:
            //     NetworkImage(friendsList[i]['imgUrl']),
            ),
      ),
      title:  Text(
        messageResponse.userName,
      ),
      subtitle: Text(
        messageResponse.message,
      ),
      trailing: Text(messageResponse.messageTime),
    );
  }
}

//..
Color myGreen = Color(0xff4bb17b);
enum MessageType { sent, received }
List<Map<String, dynamic>> friendsList = [
  {
    'imgUrl': '',
    'username': 'user1',
    'lastMsg': 'Hey',
    'seen': true,
    'hasUnSeenMsgs': false,
    'unseenCount': 0,
    'lastMsgTime': '18:44',
    'isOnline': true
  },
  {
    'imgUrl': '',
    'username': 'usei',
    'lastMsg': 'Hey',
    'seen': false,
    'hasUnSeenMsgs': false,
    'unseenCount': 0,
    'lastMsgTime': '18:44',
    'isOnline': false
  },
];