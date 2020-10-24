import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/models/user_story.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:digitalkarobaar/src/ui/feeds/stoty_details.dart';
import 'package:flutter/material.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  UserStory userStory;

  Future<List<Stories>> _getUserStory() async {
    userStory = UserStory(stories: []);

    final story = await HomeReposiitory.getUserSoty();

    userStory = story;
    List<Stories> newUserStory = <Stories>[];
    Set<int> storyIds = Set<int>();
    for (int i = 0; i < userStory.stories.length; i++) {
      if (storyIds.add(userStory.stories[i].sellerId)) {
        newUserStory.add(userStory.stories[i]);
      }
    }

    return newUserStory;
  }

  int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Story'),
        ),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Stories>>(
                  future: _getUserStory(),
                  builder: (c, snap) {
                    if (snap.hasError) {
                      return Center(child: Text('Error: ${snap.error}'));
                    }
                    if (snap.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snap.hasData) {
                      return Container(
                        height: 60,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            primary: true,
                            itemCount: snap.data.length,
                            itemBuilder: (c, i) {
                              return InkWell(
                                  onTap: () {
                                      Navigator.pushNamed(
                                  context, RouterName.recomendedSeller);
                                  //   Navigator.of(context).push(
                                  //       MaterialPageRoute(
                                  //           builder: (context) => MoreStories(
                                  //               userStory,
                                  //               snap.data[i].sellerId
                                  //                   .toString())));
                                   },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CircleAvatar(
                                      child: CachedNetworkImage(
                                          imageUrl: snap.data[i].file),
                                    ),
                                  ));
                            }),
                      );
                    } else {
                      return Center(child: Text("No Story"));
                    }
                  }),
              FutureBuilder<List<Products>>(
                  // future: _getSellerForUserProducts(),
                  builder: (c, snaps) {
                if (snaps.hasError) {
                  return Center(child: Text('Error: ${snaps.error}'));
                }
                if (snaps.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snaps.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snaps.data.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x14657786),
                                        offset: Offset(0, 8),
                                        blurRadius: 16.0,
                                        spreadRadius: 0)
                                  ]),
                              child: Column(
                                //  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10),
                                  Container(
                                    width: 310,
                                    height: 180,
                                    color: Colors.grey[300],
                                    child: Icon(
                                      Icons.broken_image,
                                      color: Colors.black12,
                                    ),
                                    // child: CachedNetworkImage(
                                    //     fit: BoxFit.cover,
                                    //     height: 40,
                                    //     width: 40,
                                    //     imageUrl: snaps.data[i].image1),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height),
                                          child: Text(snaps.data[i].title,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xff657786),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ))),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height),
                                          child: Text(snaps.data[i].description,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xff657786),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ))),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )),
                        );
                      });
                } else {
                  return Text('');
                }
              })
            ],
          ),
        ));
  }
}
