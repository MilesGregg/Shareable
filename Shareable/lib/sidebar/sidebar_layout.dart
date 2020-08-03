import 'package:Shareable/screens/home/checkboxpage.dart';
import 'package:Shareable/screens/home/homepage.dart';
import 'package:Shareable/screens/home/myaccountspage.dart';
import 'package:Shareable/screens/home/myorderspage.dart';
import 'package:Shareable/screens/login_screen.dart';
import 'package:Shareable/screens/profile.dart';
import 'package:Shareable/sidebar/menu_item.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';

class SideBarLayout extends StatefulWidget {
  @override
  _SideBarLayout createState() => _SideBarLayout();
}

class _SideBarLayout extends State<SideBarLayout> {
  String result = "Scan";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  Future getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  Future<String> getCurrentUID() async {
    return (await FirebaseAuth.instance.currentUser()).uid;
  }

  void getUserName() async {
    FirebaseUser mCurrentUser = await getCurrentUser();
    print(mCurrentUser.displayName.toString());
    print("hi");
  }



  _signOut() async {
    await FirebaseAuth.instance.signOut(); // ALSO MAKE SIGNOUT WITH GOOGLE
  }

  List<Widget> generateShare() {
    List<ListTile> list = new List();
    for (var i = 0; i <= 5; i++) {
      list.add(
        ListTile(
          title: Text("TEST"),
        )
      );
    }
    return list;
  }

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          new IconTheme(
            data: new IconThemeData(
              color: Colors.blue), 
              child: new Icon(icon),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildSidebar() {
      return Drawer(
        child: Container(
          color: Colors.black87,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 65,
              ),
              ListTile(
                onTap: () {
                  print("icon");
                },
                title: Text(
                  "Miles Gregg",
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "something",
                  style: TextStyle(
                    color: Color(0xFF1BB5FD),
                    fontSize: 18,
                  ),
                ),
                leading: CircleAvatar(
                  child: Icon(
                    Icons.perm_identity,
                    color: Colors.blue,
                  ),
                  radius: 40,
                  /*child: Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),*/
                ),
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.white,
                indent: 5,
                endIndent: 5,
              ),
              /*_createDrawerItem(icon: Icons.home_rounded, text: "Home", onTap: () {}),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      ListTile(
                        title: Text("TEST"),
                      )
                      /*RaisedButton(onPressed: () ,),
                      SizedBox(width: 25),
                      Text('Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 160),
                      Icon(Icons.login, color: Colors.red),
                      SizedBox(height: 75)*/
                    ],
                  ),
                ),
              ),*/
              _createDrawerItem(icon: Icons.home, text: "Home", onTap: () {
                print("PRESSED");
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }),
              _createDrawerItem(icon: Icons.perm_identity_rounded, text: "Profile", onTap: () {
                print("PRESSED 2");
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              }),
              _createDrawerItem(icon: Icons.group_rounded, text: "Invite Friend", onTap: () {print("PRESSED 3");}),
              Expanded(
                child: Text(""),
                /*child: ListView(
                  children: [
                    _createDrawerItem(icon: Icons.home, text: "HOME")
                  ],
                )*/
              
            /*child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return _createDrawerItem(icon: Icons.home_rounded, text: "Home", onTap: () {});
              },
            ),*/
          ),
          Column(
            children: <Widget>[
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.white,
                indent: 5,
                endIndent: 5,
              ),
              ListTile(
                title: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(
                  Icons.login,
                  color: Colors.red,
                ),
                onTap: () {
                  print("Sign out Pressed");
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
            /*MenuItem(
              icon: Icons.home,
              title: "Home",
              onTap: () {
                print("OII MATE");
              },
            )*/
              /*Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage("assets/spencer.jpg"),
                      )
                    ),
                  ],
                ),
              ),*/
              /*Flexible(
                fit: FlexFit.tight,
                child: ListView(
                  children: <Widget>[
                    _createDrawerItem(icon: Icons.home, text: "Home", onTap: () {
                      print("PRESSED");
                    }),
                    _createDrawerItem(icon: Icons.perm_identity_rounded, text: "Profile", onTap: () {
                      print("PRESSED");
                    }),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      );
    }


    /*return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );*/
    return Scaffold(
      backgroundColor: Color(0x1AFFFFFF),
      appBar: new AppBar(
        title: Text("Shareable"),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                Card(
                  color: Colors.blue,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical:12),
                  child: ListTile(
                    title: Text("Bob"),
                    onTap: () {
                      print("Card pressed");
                    },
                    subtitle: Row(
                      children: <Widget>[
                        Text("Met on")
                      ],
                    ),
                    leading: ClipOval(
                      child: Image.asset(
                        "assets/spencer.jpg",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),
                ListTile(
                  title: Text("TEST"),
                ),

                ListTile(
                  title: Text("TEST"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
      drawer: buildSidebar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "Button 1",
              onPressed: () {
                getUserName();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckBoxPage())); // was qr example
              },
              child: Icon(Icons.qr_code_scanner_rounded),
            ),
            FloatingActionButton(
              heroTag: "Button 2",
              child: Icon(Icons.camera_alt),
              onPressed: _scanQR,
            )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      
      
      
      
      
      
      
      
      
      
      
      
      /*Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    currentAccountPicture: new CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("assets/spencer.jpg"),
                    ),
                    accountName: Text("BOB JOE"),
                    accountEmail: Text("BOBBBBBBBY"),
                  ),
                  ListTile(
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(Icons.perm_identity_sharp),
                    onTap: () {
                      print("PRESSED");
                    },
                  )
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Divider(
                        color: Colors.black,
                        height: 0,
                      ),
                      ListTile(
                        title: Text('Sign Out',
                        style: TextStyle(
                          //fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        ),
                        leading: Icon(
                          Icons.login,
                          color: Colors.red,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),*/







        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        /*child: Column(
          // Important: Remove any padding from the ListView.
          //padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              currentAccountPicture: new CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage("assets/spencer.jpg"),
              ),
              accountName: Text("BOB JOE"),
              accountEmail: Text("BOBBBBBBBY"),
            ),
            /*DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/spencer.jpg"),
                  fit: BoxFit.cover
                ),
              ),
            ),*/
            ListTile(
              title: Text('Item 1'),
              leading: Icon(Icons.perm_identity),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                print("HELLLO");
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Divider(
                       height: 1,
                        color: Colors.black,
                      ),
                     ListTile(
                        title: Text('Sign Out',
                        style: TextStyle(
                        //fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        //color: AppTheme.darkText,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    trailing: Icon(
                      Icons.login,
                      color: Colors.red,
                    ),
                    onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          ],
        ),*/
      
    );
  }
}
