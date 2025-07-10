import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();

  void _scrollTo(GlobalKey key, BuildContext context){
  Navigator.pop(context);
  Scrollable.ensureVisible(
    key.currentContext!,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut
  );
}

Future<void> _launchUrl(String url) async{
  if(!await launchUrl(Uri.parse(url))){
    throw Exception('Could not launch $url');
  }
}

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: PageScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: 30,
            iconTheme: IconThemeData(color: Colors.grey[100]),
            backgroundColor: Colors.black,
            pinned: true,
          ),
          SliverFillRemaining(
            key: _aboutKey,
            hasScrollBody: false,
            child: Container(
              padding: EdgeInsets.all(40.0),
              height: MediaQuery.sizeOf(context).height,
              color: Colors.black,
              child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: MediaQuery.sizeOf(context).height*0.2,
                      decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f), Color(0xFF1a2a6c)]
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                      padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(flex: 2, child: CircleAvatar(backgroundImage: AssetImage('assets/images/portfolio_img.jpg'), radius: 100,)),
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: Text('Moizz Uddin Ahmad', 
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, 
                                color: Colors.white),
                                ), 
                               ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  FlutterSocialButton(
                                    iconSize: 15,
                                    buttonType: ButtonType.github,
                                    mini: true,
                                    onTap: (){
                                      _launchUrl('https://github.com/rocker2002?tab=repositories');
                                    },
                                  ),
                                  FlutterSocialButton(
                                    iconSize: 15,
                                    buttonType: ButtonType.linkedin,
                                    mini: true,
                                    onTap: (){
                                      _launchUrl('https://www.linkedin.com/in/moizz-uddin-ahmad-206585202/');
                                    }
                                  ),
                                ],
                              )
                            ],
                          ),
                          VerticalDivider(width: 70, indent: 150, endIndent: 150, color: Colors.white, thickness: 2,),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: SingleChildScrollView(
                                  child: aboutMe,
                              )
                            )
                    ],
                  )        
              )
            ),
           )
          ),SliverFillRemaining(
            key: _projectsKey,
            hasScrollBody: false,
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              color: Colors.black,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child:  Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(18.0),
                    alignment: Alignment.centerLeft,
                    child: Text('My Projects', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 40))),
                  ),
                  divider,
                  Container(
                    decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f), Color(0xFF1a2a6c)]
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      leading: Icon(Icons.cloud, size: 40, color: Colors.white,),
                      title: Text("Weather App", style: TextStyle(color: Colors.white)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('''A simple weather app using OpenWeatherAPI for accurate weather reading''', 
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(height: 5,),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Flutter', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('OpenWeather API', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                               ),
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Geonames API', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                               ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Dart', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                            ],
                          )
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                      onTap: () {
                        _launchUrl('https://github.com/rocker2002/weather_app');
                      },
                  )
                ),
                  divider,
                  Container(
                      decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f), Color(0xFF1a2a6c)]
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        leading: Icon(Icons.chat_bubble_outline, size: 40, color: Colors.white,),
                        title: Text("Chat App", style: TextStyle(color: Colors.white)),
                        subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('''A sleek Flutter chat app with Firebase as backend.''', 
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(height: 5,),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Flutter', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Firebase', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Dart', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                            ],
                          )
                        ],
                      ),
                        trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                        onTap: () {
                          _launchUrl('https://github.com/rocker2002/chat_app');
                        },
                    )
                  ),
                  divider,
                  Container(
                      decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f), Color(0xFF1a2a6c)]
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        leading: Icon(Icons.person, size: 40, color: Colors.white,),
                        title: Text("Portfolio Website", style: TextStyle(color: Colors.white)),
                        subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('''A simple cross-platform portfolio website made on flutter.''', 
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(height: 5,),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Flutter', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Dart', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                            ],
                          )
                        ],
                      ),
                        trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                        onTap: () {},
                    )
                  ),
                  divider,
              ],
              
             ),
            )
           )    
          ),SliverFillRemaining(
            key: _educationKey,
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              color: Colors.black,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child:  Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(18.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Education', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey[100],  fontSize: 40))),
                  ),
                  divider,
                  Container(
                    decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f), Color(0xFF1a2a6c)]
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      title: Text("KIPS College (2019-2021)", style: TextStyle(color: Colors.white)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pre-Engineering (ICS)', 
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(height: 5,),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Computer Science', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Physics', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                               ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Mathematics', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                            ],
                          )
                        ],
                      ),
                  )
                ),
                  divider,
                  Container(
                      decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f), Color(0xFF1a2a6c)]
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text("COMSATS University Islamabad, Lahore (2022-2026)", style: TextStyle(color: Colors.white)),
                        subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BS Software Engineering', 
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(height: 5,),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('OOP', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('DSA', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                               Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Database Management Systems', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Computer Networks', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Text('Operating Systems', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(color: Colors.grey[100], fontSize: 10)
                                  )),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                  divider,
              ],
              
             ),
            ),
            )    
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f), Color(0xFF1a2a6c)]
            )
          ),
          child: Column(
          children: [
            Expanded(
              child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                ListTile(
                  title: Text('About Me', style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[100])),),
                    onTap: (){
                      _scrollTo(_aboutKey, context);
                    },
                ),
                divider,
                ListTile(
                  title: Text('My Projects', style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[100])),),
                    onTap: (){
                      _scrollTo(_projectsKey, context);
                    },
                ),
                divider,
                ListTile(
                  title: Text('Education', style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[100])),),
                    onTap: (){
                      _scrollTo(_educationKey, context);
                    },
                ),
              ],
             ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6.0),
                    child: Text('Moizz Uddin Ahmad', 
                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, 
                    color: Colors.white
                    ),
                    ), 
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterSocialButton(
                        iconSize: 15,
                        buttonType: ButtonType.github,
                        mini: true,
                        onTap: (){
                          _launchUrl('https://github.com/rocker2002?tab=repositories');
                        },
                      ),
                      FlutterSocialButton(
                        iconSize: 15,
                        buttonType: ButtonType.linkedin,
                        mini: true,
                        onTap: (){
                          _launchUrl('https://www.linkedin.com/in/moizz-uddin-ahmad-206585202/');
                        }
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
       )
      ),
    );
  }
}