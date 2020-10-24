import 'package:flutter/material.dart';

class ConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connections'),
      ),
     body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Your Business Connections'),
             subtitle: Text('View people you are connected with'),
           
          ),
           ListTile(
            leading: Icon(Icons.developer_board),
            title: Text('Connection Requests'),
            subtitle: Text('Accept requests to add to business connections'),
          ),
           ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Invite'),
            subtitle: Text('Connect with new businesses'),
          ),
           
        ],
      ),
    );
  }
  _buildBody(IconData icon,String titile,String subTitle){
    return  ListTile(
            leading: Icon(icon),
            title: Text(titile,style: TextStyle(fontSize: 15),),
            subtitle: Text(subTitle,style: TextStyle(fontSize: 12),
          ));
  }
   
  }
