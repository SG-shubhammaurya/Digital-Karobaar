import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/models/user_return_model.dart';
import 'package:digitalkarobaar/src/repository/order_return_repo.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class GetUserReturn extends StatelessWidget {
  Future<List<UserReturnModel>> _getUserReturn() async {
    return await OrderReturnRepo().getUserReturn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LanguageKeys.yourReturns.translate(context)),
        ),
        body: FutureBuilder<List<UserReturnModel>>(
            future: _getUserReturn(),
            builder: (c, snap) {
              if (snap.hasError) {
                return Center(child: Text('Error: ${snap.error}'));
              }
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snap.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snap.data.length,
                    itemBuilder: (c, i) {
                      return ListTile(
                        leading:
                            CachedNetworkImage(imageUrl: snap.data[i].file),
                        title: Text(snap.data[i].message),
                        subtitle: Text(snap.data[i].status),
                      );
                    });
              } else {
                return Center(child: Text("No Return"));
              }
            }));
  }
}
