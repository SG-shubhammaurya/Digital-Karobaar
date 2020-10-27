import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/models/premium_seller.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';


class RecomendedSeller extends StatefulWidget {
  @override
  _RecomendedSeelerState createState() => _RecomendedSeelerState();
}

class _RecomendedSeelerState extends State<RecomendedSeller> {
  PremiumSeller premiumSeller;
  bool isLoading = true;
  @override
  void initState() {
    _getPremiumSeller();
    super.initState();
  }

  _getPremiumSeller() async {
    premiumSeller = PremiumSeller();
    final premiunSellerList = await SellRepository.getPremiunSeller();
    setState(() {
      premiumSeller = premiunSellerList;
      if (premiumSeller != null) {
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(LanguageKeys.recommemdedSeller.translate(context))),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Selller",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    SizedBox(width: 200),
                  ],
                ),
                Container(
                    child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children:
                      List<Widget>.generate(premiumSeller.data.length, (index) {
                    return _buildSeller(
                        premiumSeller.data[index].name,
                        premiumSeller.data[index].sellerId,
                        Image.network(
                          premiumSeller.data[index].profile,
                          fit: BoxFit.fill,
                        ));
                  }).toList(),
                )),
              ],
            ),
    ));
  }

  _buildSeller(
    String name,
    int id,
    Image image,
  ) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouterName.sellerShop, arguments: id);
          },
          child: Column(
            children: [
              Container(
               height:80,
                      width: 80,
                      color: Colors.pink[100],
              child: image),
              const SizedBox(height: 10),
              Text(name,style: TextStyle(fontSize: 12),),
             const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
