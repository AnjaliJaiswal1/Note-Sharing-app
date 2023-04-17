import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_sharing_app/Hive/token/token.dart';
import 'package:note_sharing_app/Screens/Home/comment_screen.dart';
import 'package:note_sharing_app/main.dart';
import 'package:note_sharing_app/shared.dart';
import '../../Hive/logged_in.dart';
import '../../Hive/user_profile.dart';
import '../../constants.dart';
import '../../models/posts_model.dart';
import 'package:http/http.dart' as http;

import '../Profile/profile_screen.dart';

class PostsPage extends StatefulWidget {
  final UserDataHive? userData;
  final UserProfileDataHive? userProfileDetail;
  const PostsPage({super.key, this.userData, this.userProfileDetail});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

AllPostsModel? allPosts;

class _PostsPageState extends State<PostsPage> {
  TokenModel userToken = box.get(tokenHiveKey);
  UserProfileDataHive? profileData;
  Future<AllPostsModel?> getPosts({required String userToken}) async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://note-sharing-application.onrender.com/post/"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken'
        },
      );
      log("---  " + response.body.toString());
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        Map<String, dynamic> posts =
            jsonDecode(response.body) as Map<String, dynamic>;
        var a = AllPostsModel.fromMap(posts);
        return a;
      } else {
        toastMessage("Failed to load");
        log("status code while getting post is not 200");
      }
    } catch (e) {
      toastMessage("Failed to load");
      log("error to get posts---" + e.toString());
      toastMessage(e.toString());
    }
    return null;
  }

  assignValue() async {
    allPosts = await getPosts(userToken: userToken.accessToken!);
  }

  @override
  void initState() {
    super.initState();
    assignValue();
    log(allPosts.toString());
  }

  @override
  Widget build(BuildContext context) {
    profileData = box.get(userProfileKey);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            // log(profileData.toString());
            // log(box.get(userProfileKey).toString());
            // log(boxdetails.get(userProfileKey).toString());
            // // Get.offAll(UserLoginPage());
            Get.to(() => ProfileScreen(
                  userData: widget.userData!,
                  userProfileData: profileData,
                ));
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundImage: NetworkImage(
                'https://note-sharing-application.onrender.com${profileData!.profile_image}'),
          ),
        ),
        leadingWidth: 80,
        titleSpacing: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            widget.userData != null
                ? Text(
                    "Hi ${widget.userData!.first_name} ",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColorBlack,
                    ),
                  )
                : TextButton(
                    onPressed: () => Get.to(() => ProfileScreen(
                          userData: widget.userData!,
                          userProfileData: profileData,
                        )),
                    child: Text(
                      "Complete your profile",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColorBlack,
                      ),
                    )),
            // const SizedBox(height: 2.5),
            Text(
              "Welcome back!",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: textColorBlack.withOpacity(0.6),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 24,
            splashColor: primaryColor3,
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: primaryColor1,
              size: 24,

//            valueListenable: box.listenable(),
//            builder: (context, boxdetails, _) {
//              profileData = box.get(userProfileKey);
//              log(box.get(userProfileKey).toString());
//              return Scaffold(
//                appBar: AppBar(
//                  backgroundColor: Colors.white,
//                  elevation: 0,
//                  leading: GestureDetector(
//                    onTap: () {
//                      // log(profileData.toString());
//                      // log(box.get(userProfileKey).toString());
//                      // log(boxdetails.get(userProfileKey).toString());
//                      // // Get.offAll(UserLoginPage());
//                      Get.to(() => ProfileScreen(
//                            userData: widget.userData!,
//                            // userProfileData: boxdetails.get(userProfileKey),
//                          ));
//                    },
//                    child: CircleAvatar(
//                      backgroundColor: Colors.white,
//                      // foregroundImage:
//                      //     NetworkImage(profileData!.profile_image!)
//                      foregroundImage: AssetImage('assets/images/anjali.png'),
            ),
          ),
        ],
      ),
      body: Container(
        height: Get.height - 80,
        width: Get.width,
        padding: const EdgeInsets.all(16),
        child: allPosts != null
            ? ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: allPosts!.data!.length,
                itemBuilder: (context, index) {
                  return Posts(
                    index: index,
                    userAccessToken: userToken.accessToken!,
                    user_id: widget.userData!.id!,
                  );
                },
                separatorBuilder: (context, index) => Container(
                  height: 6,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: primaryColor3.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(primaryColor1),
                ),
              ),
      ),
    );
  }
}

class Posts extends StatefulWidget {
  String userAccessToken;
  int user_id;
  int index;
  Posts({
    super.key,
    required this.user_id,
    required this.index,
    required this.userAccessToken,
  });

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  int likeCount = 0;
  bool liked = false;

  Future postLike() async {
    http.Response likePostResponse = await http.post(
      Uri.parse(
          "https://note-sharing-application.onrender.com/post/post=${allPosts!.data![widget.index].post_id}/like/"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.userAccessToken}'
      },
    );
    log('post like : ' + likePostResponse.statusCode.toString());
    return likePostResponse;
  }

  Future deleteLike() async {
    http.Response deleteLikePostResponse = await http.delete(
      Uri.parse(
          "https://note-sharing-application.onrender.com/post/post=${allPosts!.data![widget.index].post_id}/like/"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.userAccessToken}'
      },
    );
    log('delete like : ' + deleteLikePostResponse.statusCode.toString());
    return deleteLikePostResponse;
  }

  Future getPostLike() async {
    try {
      http.Response like = await http.get(
        Uri.parse(
            "https://note-sharing-application.onrender.com/post/post=${allPosts!.data![widget.index].post_id}/like"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.userAccessToken}'
        },
      );
      if (like.statusCode == 200 && like.body.isNotEmpty) {
        Map<String, dynamic> likeMap =
            jsonDecode(like.body) as Map<String, dynamic>;
        setState(
          () {
            likeCount = likeMap['like_count'];
          },
        );
      } else {
        log('Something went wrong. Status code = ${like.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    getPostLike();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: AssetImage('assets/images/anjali.png'),
                minRadius: 24,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anjali Jaiswal",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: textColorBlack,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "2 hours ago",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: primaryColor3,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                splashRadius: 24,
                splashColor: primaryColor3,
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  color: primaryColor1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            allPosts!.data![0].post_content!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColorBlack,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            allPosts!.data![widget.index].post_content!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: textColorBlack,
            ),
          ),
          const SizedBox(height: 12),
          allPosts!.data![widget.index].post_image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      "https://note-sharing-application.onrender.com${allPosts!.data![widget.index].post_image}"),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  setState(() {
                    liked = !liked;
                  });
                  liked ? postLike() : deleteLike();
                  getPostLike();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primaryColor3,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.thumb_up,
                        color: primaryColor1,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "$likeCount likes",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: primaryColor1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Get.to(
                      () => CommentScreen(),
                    );
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primaryColor3,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.comment_outlined,
                        color: primaryColor1,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "0 comments",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: primaryColor1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 24,
                splashColor: primaryColor3,
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: primaryColor1,
                  size: 24,
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
    // });
  }
}
