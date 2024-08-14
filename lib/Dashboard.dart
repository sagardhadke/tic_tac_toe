import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {

  List ofXO = List.generate(9, (index) => "");
  bool whoTurn = true;

  // List myColors = [
  //   Colors.white,
  //   Colors.red,
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF24292C),
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        backgroundColor: Colors.amber,
      ),


    body: Center(
      child: GridView(
        padding: EdgeInsets.only(right: 15, left: 15),
        shrinkWrap: true, //fix to the screen size
        physics: NeverScrollableScrollPhysics(), // for stop the scroll
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        
        children: [
          for(int i=0; i<9; i++)...{
              
              GestureDetector(onTap: (){
                  
                  if(ofXO[i] ==""){
                    if(whoTurn){
                      whoTurn = false;
                      ofXO[i] = "x";
                    }else{
                      whoTurn = true;
                      ofXO[i] = "o";
                    }
                  };

                  setState(() {
                    
                  });

                if(ofXO[0] == "x" && ofXO[1] == "x" && ofXO[2] == "x" ||
                  ofXO[0] == "o" && ofXO[1] == "o" && ofXO[2] == "o" ||
                  ofXO[3] == "x" && ofXO[4] == "x" && ofXO[5] == "x" ||
                  ofXO[3] == "o" && ofXO[4] == "o" && ofXO[5] == "o" ||
                  ofXO[6] == "x" && ofXO[7] == "x" && ofXO[8] == "x" ||
                  ofXO[6] == "o" && ofXO[7] == "o" && ofXO[8] == "o" ||
                  
                  ofXO[0] == "x" && ofXO[3] == "x" && ofXO[6] == "x" ||
                  ofXO[0] == "o" && ofXO[3] == "o" && ofXO[6] == "o" ||
                  ofXO[1] == "x" && ofXO[4] == "x" && ofXO[7] == "x" ||
                  ofXO[1] == "o" && ofXO[4] == "o" && ofXO[7] == "o" ||
                  ofXO[2] == "x" && ofXO[5] == "x" && ofXO[8] == "x" ||
                  ofXO[2] == "o" && ofXO[5] == "o" && ofXO[8] == "o" ||
                  
                  ofXO[0] == "x" && ofXO[4] == "x" && ofXO[8] == "x" ||
                  ofXO[0] == "o" && ofXO[4] == "o" && ofXO[8] == "o" ||
                  ofXO[2] == "x" && ofXO[4] == "x" && ofXO[6] == "x" ||
                  ofXO[2] == "o" && ofXO[4] == "o" && ofXO[6] == "o"){

                  if(ofXO[i] == "x"){
                    showDialog(barrierDismissible: false,
                      context: context, builder: (context) {
                      return AlertDialog.adaptive(
                        actions: [
                          ElevatedButton(onPressed: () {
                            ofXO = List.generate(9, (index) => "");

                            Navigator.pop(context);

                            setState(() {
                              
                            });
                          }, 
                          child: Text("Restart The Match"))
                        ],

                        title: Text("Player 1 win"),
                        content: Text("Congratulations Player 1 Win"),
                      );
                    },);

                    setState(() {
                      
                    });
                  }else if(ofXO[i] == "o"){

                    showDialog(barrierDismissible: false,
                      context: context, builder: (context){
                      return AlertDialog.adaptive(
                          actions: [
                            ElevatedButton(onPressed: (){
                                ofXO = List.generate(9, (index) => "");

                              Navigator.pop(context);
                                setState(() {
                                  
                                });
                              
                            }, child: Text("Restart The Match"))  
                          ],
                          title: Text("Player 2 Win"),
                          content: Text("Congratulation Player 2 Win"),
                          
                      );
                    });

                  };
                  
                }else if(!ofXO.contains("")){
                    showDialog(barrierDismissible: false,
                      context: context, builder: (context){
                      return AlertDialog.adaptive(
                        actions: [
                          ElevatedButton(onPressed: (){
                            ofXO = List.generate(9, (index) => "");
                            Navigator.pop(context);
                            setState(() {
                              
                            });
                          }, child: Text("Restart The Match"))
                          
                        ],
                        title: Text("Match Draw"),
                        content: Text("Match Draw Play Again"),
                      );
                    });
                };
              },

              
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,

                child: Text(ofXO[i], style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 65, fontWeight: FontWeight.bold,
                  color: Colors.black)
                ),),
                
              ),
              ),
          },

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    ElevatedButton(
                      onPressed: (){
                        List ofXO = List.generate(9, (index) => "");
                    }, child: Text("Reset"))
                  ],
              ),
        ],

        ),
    ),

    );
  }
}