import 'package:recoapp/index.dart';
import 'package:share/share.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Welcome To APPName",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff474562)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(child: SecondItem()),
            SizedBox(
              height: 20,
            ),
            set('Feedback'),
            set('Help Center'),
            set('Privacy&Policy'),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 0.0, top: 4, bottom: 0),
              onTap: () {
                showShare();
              },
              title: Text('Share',
                  style: TextStyle(fontSize: 18.0, color: Color(0Xff5e5e66))),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 0.0, top: 4, bottom: 0),
              title: Text('App Version 1.0.0',
                  style: TextStyle(fontSize: 18.0, color: Colors.black45)),
            ),
          ],
        ),
      ),
    );
  }

  Stack SecondItem() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ecompic.jpg"),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        Positioned(
          bottom: 10,
          left: 50,
          child: RaisedButton(
              onPressed: () {},
              color: Theme.of(context).accentColor,
              child: Text(
                "CREATE ACCOUNT OR SIGN IN",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ],
    );
  }

  Widget set(String label) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(left: 0.0, top: 4, bottom: 0),
      onTap: () {},
      title: Text(label,
          style: TextStyle(fontSize: 18.0, color: Color(0Xff5e5e66))),
    );
  }

  void showShare() {
    final RenderBox box = context.findRenderObject();
    Share.share('Share my App:app link',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
