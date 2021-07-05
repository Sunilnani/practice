import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_proj/models/user_followers.dart';
import 'package:flutter_proj/user_data/user_profile.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  void initState() {
    fetch_users();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: users!.items.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return users!.items.length==null?CircularProgressIndicator():Container(
                      child:SingleChildScrollView(
                        child: Column(
                          children: [
                            InkWell(
                              onTap:(){
                                Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>UserProfile(userimage:users!.items[index].avatarUrl,
                                        ),
                                      ),
                                    );
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'user name is  ',
                                  style: TextStyle(fontSize: 12.0, color: Colors.lightBlue),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: users!.items[index].login,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),),
                            ),
                            SizedBox(height: 20,),

                          ],
                        ),
                      )
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}





