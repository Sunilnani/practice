import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  UserProfile({
    required this.userimage,
    required this.follower,
});
  final String userimage;
  final String follower;
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(widget.userimage),
                ),
                SizedBox(height: 20,),
                Text(widget.follower)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
