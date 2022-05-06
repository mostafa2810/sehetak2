import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sehetak2/screens/bottom_bar.dart';
import 'package:sehetak2/screens/home.dart';
import 'package:sehetak2/screens/pediatric-home.dart';
import 'package:sehetak2/widget/OnlineConsultation.dart';
import 'package:sehetak2/widget/home-examination.dart';

import 'initial_diagnosis/initial_diagnosis_home.dart';

class Dashboard extends StatefulWidget {
  final String chatWithUsername;

  const Dashboard({Key key, this.chatWithUsername}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override


  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Exit App"),
        content: Text("Do you want to exit an App?"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          )

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffb7dcea),Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: NavDrawer(),
          appBar: AppBar(
            brightness: Brightness.dark,
            //remove bcakgroundcolor from appbar
            backgroundColor: Colors.transparent,
            //remove shadwo frome app bar
            elevation: 0 ,
            flexibleSpace:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30) ),
                gradient: LinearGradient(
                  colors: [HexColor("#80b1fe"),HexColor("#3D50E7")],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            title: Text('Home',style: TextStyle(color: Colors.white),),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "myName",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        Text(
                          "Welcome To Sehetk!!",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff80B1FE),),

                        ),
                        SizedBox(height: 20.0,)
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("myProfilePic"),
                  ) ,
                ),
              ),
              SizedBox(height: 50,),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomBarScreen()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_shopping_cart_240px_1 1.png",),
                                  Text('Online Pharmacy',style: TextStyle(fontSize: 12,color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OnlineConsultation()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/chat.png",height: 60,),
                                  Text('Online Consultation',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeExamination()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_home_80px 1.png",height: 60,),
                                  Text('Home Examinations',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_timesheet_128px 1.png",height: 60,),
                                  Text('Book An Appointment',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: ()
                              {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IntialDiagnisisHomeScreen()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_health_checkup_100px 1.png",height: 60,),
                                  Text('Intial Diagnosis',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/image 5.png",height: 60,),
                                  Text('SOS',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MakeDashboardItems()));
                                
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/image 5.png",height: 60,),
                                  Text('Pediatric Dose',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/image 5.png",height: 60,),
                                  Text('Medicine Reminder',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(

            margin: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage('',),
                ),

                Expanded(
                  child: Text("Amr Helmy",style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),),
                ),
                Expanded(
                  child: Text("+201009152403",style:
                  TextStyle(fontSize: 12,color: Colors.grey[600]),),
                )
              ],
            ),
          ),

          ListTile(
            leading: Image.asset("assets/lottie/setuser.png"),
            title: Text('Account settings',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {},
          ),
          ListTile(
            leading:  Image.asset("assets/lottie/setting.png"),
            title: Text('Setting',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Image.asset("assets/lottie/Group.png"),
            title: Text('Feedback & Contact us',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(
            color: HexColor("#E5E5E9"),
          ),
          ListTile(
            leading: Image.asset("assets/lottie/share 1.png"),
            title: Text('Tell your friend',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Image.asset("assets/lottie/Logout.png"),
            title: Text('Sign out',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () async {
              //logout
              // await UserInfo..signOut().then(
              //         (value) =>
              //         Navigator.pop(context));
            },
          ),
        ],
      ),
    );
  }
}