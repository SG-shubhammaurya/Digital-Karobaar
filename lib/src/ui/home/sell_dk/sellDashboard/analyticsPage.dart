import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
    body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Seller Performance'),
           
          ),
           ListTile(
            leading: Icon(Icons.add_alarm),
            title: Text('Buyer Analytics'),
            subtitle: Text('Increase Visibilityof your store using ads'),
          ),
           ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Catalog Analytics'),
            subtitle: Text('view your ads'),
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
