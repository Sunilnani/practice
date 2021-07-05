import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/models/user_followers.dart';
class Followers extends StatefulWidget {


  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  UserFollowers? users;
  List<Item>items=[];
  void fetch_users() async {
    setState(() {

    });
    try {
      Response response = await Dio().get("https://api.github.com/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users");
      setState(() {
        users =userFollowersFromJson(jsonEncode(response.data));
        print("items are ${items.length}");
        print("followers are ${users!.items.length}");
      });
      print(response);
    } catch (e) {
      setState(() {
      });
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ListView.builder(
              itemCount:2,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                return Container(

                );
              },
            )
          ],
        ),
      ),
    );
  }
}
