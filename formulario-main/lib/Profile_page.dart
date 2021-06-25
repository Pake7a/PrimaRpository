import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulario/HomePageScreen.dart';
import 'package:formulario/widget/numbers_widget.dart';
import 'package:formulario/Assets.dart';
import 'constantsUtil.dart';

// ignore: camel_case_types
class Profile_Page extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    print('ProfilePage ${Assets.instance.userData.username}');
    return Scaffold(
      backgroundColor: MyAppColors.appBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xFF332F2D),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_sharp),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => HomePageScreen());
              Navigator.push(context, route).then((value) => setState(
                  () {})); //vai alla modifica del nome e della lista delle formule da fare
            },
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          Text(
            Assets.instance.userData.username.isEmpty
                ? "Nome Utente"
                : Assets.instance.userData.username,
            style: TextStyle(
                backgroundColor: MyAppColors.appBackground,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 22),
            textAlign: TextAlign.center,
          ),
          Text("\n"),
          Text(
            Assets.instance.userData.email.isEmpty
                ? "E-mail"
                : Assets.instance.userData.email,
            style: TextStyle(
                backgroundColor: MyAppColors.appBackground,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 22),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          Text(
            "Formule da vedere:\n",
            style: TextStyle(
                backgroundColor: MyAppColors.appBackground,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22),
            textAlign: TextAlign.center,
          ),
          Text(
            Assets.instance.userData.cosaFare.isEmpty
                ? "Cosa vuoi vedere oggi?"
                : Assets.instance.userData.cosaFare,
            style: TextStyle(
                backgroundColor: MyAppColors.appBackground,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
