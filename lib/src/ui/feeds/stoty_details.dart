import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/user_story.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class MoreStories extends StatefulWidget {
  MoreStories(this.storyList, this.id);
  UserStory storyList;
  String id;
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();
  @override
  void initState() {
 //  _getUserStory();
    super.initState();
  }
   UserStory userStory;
  // bool isLoadings = true;

  
  Future<UserStory> _getUserStory() async {
    userStory = UserStory(stories: []);
    final story = await HomeReposiitory.getUserSoty();
      if(story != null){
        userStory =story;
         setState(() {
        // isLoadings = false;
       });
      }
    }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:widget.storyList.stories.length == 0
                ? Center(
                    child: NoDataAvailable(message: "No Delivered Available"))
                :
       StoryView(
        storyItems:widget.storyList.stories.map((e) {
          if (widget.id == e.sellerId.toString()) {
            return StoryItem.pageImage(
              url: e.file,
              caption: e.text,
              controller: storyController,
            );
          }
        }).toList(),
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          Navigator.pop(context);
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
