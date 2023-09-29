import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  child: Text(
                    'TIC TAC TOE',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Every Headline",
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Container(
                  child: AvatarGlow(
                    endRadius: 140,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.none),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage("assets/images/tictactoe2.jpg"),
                        // backgroundColor: Colors.grey[900],
                        // child: Container(
                        //   child: Image.asset(
                        //     'assets/images/tictactoe2.jpg',
                        //     //color: Colors.white,
                        //     fit: BoxFit.scaleDown,
                          //),
                        //),
                        //radius: 110.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 40,),
            // Expanded(
            //     child: Container(
            //       width:100,
            //       height: 50,
            //         child: TextField(
            //           decoration: InputDecoration(
            //             border: OutlineInputBorder(
            //
            //             )
            //           ),
            //         ))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  child: Text(
                    'CREATED BY PRIYANKA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Every Headline",
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Text(
                          'PLAY GAME',
                          style: TextStyle(color: Colors.grey,fontFamily: "Every Headline"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
