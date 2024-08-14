import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {

  List ofXO = List.generate(9, (index) => "");
  bool whoTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        backgroundColor: Colors.amber,
      ),


    body: Center(
      child: GridView(
        shrinkWrap: true, //fix to the screen size
        physics: NeverScrollableScrollPhysics(), // for stop the scroll
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        
        children: [
          for(int i=0; i<9; i++)...{
              
              GestureDetector(onTap: (){
                  
              },
              
              child: Container(
                color: Colors.amber,
              ),
              )
          },
        ],

        ),
    ),

    );
  }
}