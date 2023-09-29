import 'package:flutter/material.dart';
import 'package:tic_tac/main.dart';
//import 'package:google_fonts/google_fonts.dart';


class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  bool ohTurn =true; // first player is 0
  List<String>  displayExOh= [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  var myTextStyle =TextStyle(color: Colors.white,fontSize: 22);
  int ohScore =0;
  int exScore =0;
  int filledBoxes =0;

  // static var Newfont =GoogleFonts.pressStart2P(
  //     textStyle: TextStyle(color: Colors.black,letterSpacing: 3)
  // );
  // static var Newfontwhite =GoogleFonts.pressStart2P(
  //     textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15)
  // );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading:BackButton(
      //     onPressed: ()=>Homepage.() IntroScreen(),
      //   ),
      // ),

      backgroundColor: Colors.grey[900],

      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Player O',style: TextStyle(color: Colors.white,fontSize: 20 , fontFamily: "EVERYHEADLINE")),
                            SizedBox(height: 10,),
                            Text(ohScore.toString(),style: myTextStyle),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0,left: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget> [
                            Text('Player X',style: TextStyle(color: Colors.white,fontSize: 20 , fontFamily: "EVERYHEADLINE")),
                            SizedBox(height: 10,),
                            Text(exScore.toString(),style: myTextStyle,),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),
          //SizedBox(height: 10,),
          Expanded(
            flex: 3,

            child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context ,int index){
                  return GestureDetector(
                      onTap: (){
                        _tapped(index);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)

                           // border: Border.all(color: Colors.grey[700])
                          ),
                          child: Center(
                            child : Text(
                                displayExOh[index],

                                style: TextStyle(color: Colors.white,fontSize: 40)),

                          )
                      )
                  );
                }),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('TIC TAC TOE',style: TextStyle(color: Colors.white,fontSize: 25 , fontFamily: "EVERYHEADLINE")),

                      SizedBox(height: 40,),
                    ],
                  ),
                ),


              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroScreen()),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'BACK',
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
    );
  }

  void _tapped(int index){

    setState((){
      if(ohTurn && displayExOh[index] ==''){
        displayExOh[index] ='o';
        filledBoxes +=1;
      }else if (!ohTurn && displayExOh[index] ==''){
        displayExOh[index] ='x';
        filledBoxes +=1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner(){
    if(displayExOh [0] ==displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != ''){
      _showWinDialog(displayExOh [0]);
    }
    if(displayExOh [3] ==displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != ''){
      _showWinDialog(displayExOh [3]);
    }
    if(displayExOh [6] ==displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != ''){
      _showWinDialog(displayExOh [6]);
    }
    if(displayExOh [0] ==displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != ''){
      _showWinDialog(displayExOh [0]);
    }
    if(displayExOh [1] ==displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != ''){
      _showWinDialog(displayExOh [1]);
    }
    if(displayExOh [2] ==displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != ''){
      _showWinDialog(displayExOh [2]);
    }
    if(displayExOh [6] ==displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != ''){
      _showWinDialog(displayExOh [6]);
    }
    if(displayExOh [0] ==displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != ''){
      _showWinDialog(displayExOh [0]);
    }
    if(displayExOh [2] ==displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != ''){
      _showWinDialog(displayExOh [2]);
    }
    else if(filledBoxes == 9){
      _showDrawDialog();
    }


  }
  void  _showDrawDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text ('DRAW',style: TextStyle(color: Colors.grey),),

            actions: <Widget>[
              TextButton(
                child: Text('Play Again!'),
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },

              )
            ],
          );
        }
    );

  }

  void  _showWinDialog(String  winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text ('WINNER IS : '+ winner),
            actions: <Widget>[
              TextButton(
                child: Text('Play Again!'),
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },

              )
            ],
          );
        }
    );
    if(winner == 'o'){
      ohScore += 1;
    }else if(winner =='x'){
      exScore += 1;
    }

  }
  void _clearBoard(){
    setState(() {
      for(int i =0;i<9;i++){
        displayExOh[i] = '';
      }
    });
    filledBoxes=0;
  }
}