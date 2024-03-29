import 'package:Shareable/commons/my_info.dart';
import 'package:Shareable/commons/opaque_image.dart';
import 'package:Shareable/commons/profile_info_big_card.dart';
import 'package:Shareable/commons/profile_info_card.dart';
import 'package:Shareable/styleguide/colors.dart';
import 'package:Shareable/styleguide/text_style.dart';
import 'package:Shareable/utilities/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        title: Text("MyProfile"),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue
      ),
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: <Widget>[
                    OpaqueImage(
                      imageUrl: "assets/spencer.jpg",
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            /*Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Profile",
                                textAlign: TextAlign.left,
                                style: headingTextStyle,
                              ),
                            ),*/
                            MyInfo(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  color: Color(0x1AFFFFFF),
                  child: ListView(
                    children: [
                      Card(
                        color: Colors.blue,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: ListTile(
                          title: TextField(
                            keyboardType: TextInputType.url,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans'
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 0.0),
                              hintText: 'Enter your Instagram',
                              hintStyle: kHintTextStyle
                            ),
                          ),
                          leading: ClipOval(
                            child: Image.asset(
                              "assets/logos/instagram.png",
                              width: 50,
                              height: 50,
                            ),
                          ),
                          /*trailing: TextField(
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              hintText: 'TEST'
                            ),
                          ),*/
                        ),
                      )
                    ],
                  ),
                  /*child: Table(
                    children: [
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: "13",
                            secondText: "New matches",
                            icon: Icon(
                              Icons.star,
                              size: 32,
                              color: blueColor,
                            ),
                          ),
                          ProfileInfoBigCard(
                            firstText: "21",
                            secondText: "Unmatched me",
                            icon: Image.asset(
                              "assets/icons/sad_smiley.png",
                              width: 32,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: "264",
                            secondText: "All matches",
                            icon: Image.asset(
                              "assets/icons/checklist.png",
                              width: 32,
                              color: blueColor,
                            ),
                          ),
                          ProfileInfoBigCard(
                            firstText: "42",
                            secondText: "Rematches",
                            icon: Icon(
                              Icons.refresh,
                              size: 32,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: "404",
                            secondText: "Profile Visitors",
                            icon: Icon(
                              Icons.remove_red_eye,
                              size: 32,
                              color: blueColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  //builder: (context) => SuperLikesMePage(),
                                ),
                              );
                            },
                            child: ProfileInfoBigCard(
                              firstText: "42",
                              secondText: "Super likes",
                              icon: Icon(
                                Icons.favorite,
                                size: 32,
                                color: blueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),*/
                ),
              ),
            ],
          ),
          /*Positioned(
            top: screenHeight * (4 / 9) - 80 / 2,
            left: 16,
            right: 16,
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ProfileInfoCard(firstText: "54%", secondText: "Progress"),
                  SizedBox(
                    width: 10,
                  ),
                  ProfileInfoCard(
                    hasImage: true,
                    imagePath: "assets/icons/pulse.png",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ProfileInfoCard(firstText: "152", secondText: "Level"),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}