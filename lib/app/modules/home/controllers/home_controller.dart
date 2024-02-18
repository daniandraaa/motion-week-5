import 'dart:developer';

import 'package:clone_ig/app/data/model/post_model.dart';
import 'package:clone_ig/app/data/model/story_model.dart';
import 'package:clone_ig/app/modules/snapgram/controllers/snapgram_controller.dart';
import 'package:clone_ig/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class HomeController extends GetxController {
  final storyController = StoryController();
  PostModel model = PostModel(
    profilepic: "exported_1.jpg",
    username: "winner",
    postings: "exported_2.jpg",
    likesCount: 49747461,
    description: "Satu putaran.",
    isLiked: true,
    isSponsored: true,
  );

  List<StoryModel> stories = [];
  @override
  void onInit() {
    loadStoryModel();
    super.onInit();
  }

  void loadStoryModel() {
    stories = [
      StoryModel(
        isLogin: true,
        username: "winner",
        image: "exported_1.jpg",
        stories: [
          StoryItem.text(
            title: "gimana?",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      StoryModel(
        username: "notfound1",
        image: "l_1.jpg",
        stories: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Working with gifs",
            controller: storyController,
          ),
        ],
      ),
      StoryModel(
        username: "puppet",
        image: "l_3.jpg",
        stories: [],
      ),
    ];
    update();
  }

  void like() {
    model.isLiked = !model.isLiked;
    if (model.isLiked) {
      model.likesCount++;
    } else {
      model.likesCount--;
    }
    update();
  }

  void makeStory(List<StoryItem>? storyItem) {
    Get.toNamed(
      Routes.SNAPGRAM,
      arguments: {
        'story': storyItem,
      },
    );
  }
}
