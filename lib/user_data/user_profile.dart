import 'package:flutter/material.dart';
import 'package:flutter_proj/user_data/followers.dart';
class UserProfile extends StatefulWidget {
  UserProfile({
    required this.userimage,
});
  final String userimage;
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
                // CircleAvatar(
                //   radius: 45,
                //   child:Image.network(widget.userimage),
                // ),
                widget.userimage==null?CircularProgressIndicator():Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow
                  ),
                  height: 50,
                  width: 100,
                  child: Image.network(widget.userimage),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>Followers(

                        )
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    ),
                    child: Text("Followers",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 13),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
