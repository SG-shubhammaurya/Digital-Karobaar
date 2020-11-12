import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/user_story.dart';
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
    _initStories();
    super.initState();
  }

  List<StoryItem> storyItems = [];
 
  _initStories() {
    widget.storyList.stories.forEach((story) {
      if (widget.id == story.sellerId.toString()) {
       
        storyItems.add(StoryItem.pageImage(
         shown: true,
           url: story.file ==""?"https://azadchaiwala.pk/getImage?i=&t=course": story.file,
           caption: story.text,
           controller:storyController ,
         ));
      }
    });
  }

 
  @override
  void dispose() {
      storyController.dispose();
    super.dispose();
  }
  String heroTag = "";
    bool trusted = true;
    bool hasReply = true;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: widget.storyList.stories.length == 0
          ? Center(child: NoDataAvailable(message: "No Story Available"))
         
:
      Container(
        height: MediaQuery.of(context).size.height,
        child: StoryView(
            onStoryShow: (s) {
              print("Showing a story");
            },
            storyItems: storyItems,

            repeat: true,
            onComplete: () {
            Navigator.pop(context);
            },
            progressPosition: ProgressPosition.top,
            controller: storyController,
          ),
      ),
    );
  }
}
