import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxPage createState() => _CheckBoxPage();
}

class _CheckBoxPage extends State<CheckBoxPage> {
  bool selected = true;
  bool selected2 = true;
  bool skip = true;

  Widget checkbox(String title, bool boolValue) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text(title),
            Checkbox(
                value: boolValue,
                onChanged: (bool value) {},
            )
        ],
    );
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share"), 
      ),
      backgroundColor: Color(0x1AFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //children: generateShare(),
          children: <Widget>[
            //generateShare()
            ListTile(
              trailing: CircularCheckBox(value: this.selected, checkColor: Colors.white, activeColor: Colors.blue, inactiveColor: Colors.black, disabledColor: Colors.grey , onChanged: (val) => this.setState(() { this.selected= !this.selected ;}) ),
              //leading: CircularCheckBox(value: this.selected, checkColor: Colors.white, activeColor: Colors.blue, inactiveColor: Colors.black, disabledColor: Colors.grey , onChanged: (val) => this.setState(() { this.selected= !this.selected ;}) ),
              leading: IconTheme(
                data: new IconThemeData(
                  color: Colors.green
                ),
                child: new Icon(Icons.phone),
              ),
              title: Text("Phone Number"),
              onTap: ()=> this.setState(() { this.selected= !this.selected ;}),
            ),
            ListTile(
              trailing: CircularCheckBox(value: this.selected2, checkColor: Colors.white, activeColor: Colors.blue, inactiveColor: Colors.black, disabledColor: Colors.grey , onChanged: (val) => this.setState(() { this.selected2= !this.selected2 ;}) ),
              title: Text("Instagram"),
              onTap: ()=> this.setState(() { this.selected2= !this.selected2 ;}),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/logos/instagram.png")
              ),
            ),
            ListTile(
              trailing: CircularCheckBox(value: this.selected2, checkColor: Colors.white, activeColor: Colors.blue, inactiveColor: Colors.black, disabledColor: Colors.grey , onChanged: (val) => this.setState(() { this.selected2= !this.selected2 ;}) ),
              title: Text("Instagram"),
              onTap: ()=> this.setState(() { this.selected2= !this.selected2 ;}),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/logos/instagram.png")
              ),
            )
          ],
        ),
      ),
    );
  }
}