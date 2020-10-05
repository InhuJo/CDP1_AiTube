import 'package:cdp1_aitube/models/user.dart';
import 'package:cdp1_aitube/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  static const routeName = "/settings";

  void openLogin(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white)),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage:
                          NetworkImage(currentUser.getUserPhotoUrl()),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        currentUser.getUserName(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        currentUser.getUserEmail(),
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              ],
            ),
            height: 150,
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact us',
                  style: GoogleFonts.nanumGothic(
                      fontSize: 40, fontWeight: FontWeight.w100),
                ),
              ),
            ),
            height: 75,
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
            child: InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Share',
                  style: GoogleFonts.nanumGothic(fontSize: 40),
                ),
              ),
            ),
            height: 75,
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
            child: InkWell(
              onTap: () async {
                if (!await currentUser.logout())
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginPage.routeName, (Route<dynamic> route) => false);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Log out',
                  style: GoogleFonts.nanumGothic(fontSize: 40),
                ),
              ),
            ),
            height: 75,
          ),
          Divider(
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Copyright \u00A9 2020 | CDP1 Team 8",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
