import 'package:flutter/material.dart';

class Boxing extends StatefulWidget {
  const Boxing({Key? key}) : super(key: key);

  @override
  _BoxingState createState() => _BoxingState();
}

class _BoxingState extends State<Boxing> {
  int round = 0;
  List<int> blueScore = [];
  List<int> redScore = [];
  int sumRed = 0;
  int sumBlue = 0;
  Widget createScoreboard(int r){
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(child: Text("ROUND $r", style: TextStyle(fontSize: 12),),)
        ),
        Row(
        children: [
            Expanded(child: Container(), flex: 1,),
            Text(redScore[r-1].toString(), style: TextStyle(fontSize: 30),),
            Expanded(child: Container(), flex: 2,),
            Text(blueScore[r-1].toString(), style: TextStyle(fontSize: 30),),
            Expanded(child: Container(), flex: 1,),
          ],
        ),
          Divider(thickness: 1,),
      ],
    );
  }

  Widget createTotal(){
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(child: Text("Total", style: TextStyle(fontSize: 12),),)
        ),
        Row(
          children: [
            Expanded(child: Container(), flex: 1,),
            Text(sumRed.toString(), style: TextStyle(fontSize: 30),),
            Expanded(child: Container(), flex: 2,),
            Text(sumBlue.toString(), style: TextStyle(fontSize: 30),),
            Expanded(child: Container(), flex: 1,),
          ],
        ),
        Divider(thickness: 1,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OLYMPIC BOXING SCORING",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Image.asset("assets/images/logo.png",width: 250,),
                  ),
                )
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Women's Light (57-60kg) Semi-final", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color:  Color(0xFFA00000), size: 70,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/flag_ireland.png",width: 40,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("IRELAND", style: TextStyle(fontSize: 20),),
                                )
                              ],
                            ),
                            Text("HARRINGTON Kellie Anne", style: TextStyle(fontSize: 15),)
                          ],
                        ),
                      ],
                    ),
                    (sumRed > sumBlue && round == 3) ?
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.check, size: 40, color: Colors.green,),
                    ) :
                    SizedBox.shrink(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color:  Color(0xFF0000A0), size: 70,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/flag_thailand.png",width: 40,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("THAILAND", style: TextStyle(fontSize: 20),),
                                )
                              ],
                            ),
                            Text("SEESONDEE Sudaporn", style: TextStyle(fontSize: 15),)
                          ],
                        ),
                      ],
                    ),
                    (sumBlue > sumRed && round == 3) ?
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.check, size: 40, color: Colors.green,),
                    ) :
                    SizedBox.shrink(),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(thickness: 6, color: Color(0xFFA00000),),
                      ),
                      Expanded(
                        child: Divider(thickness: 6, color: Color(0xFF0000A0),),
                      )
                    ],
                  )
                ],
              ),
              for(int i=1;i<=round;++i)
                createScoreboard(i),
              round == 3 ? createTotal() : SizedBox.shrink(),
              Expanded(child: Container()),
              round < 3 ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                round++;
                                blueScore.add(9);
                                redScore.add(10);
                                sumBlue += 9;
                                sumRed += 10;
                              });
                            },
                            style: ElevatedButton.styleFrom( primary: Color(0xFFA00000)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.person,size: 30,),
                            )
                        ),
                      )
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                round++;
                                blueScore.add(10);
                                redScore.add(9);
                                sumBlue += 10;
                                sumRed += 9;
                              });
                            },
                            style: ElevatedButton.styleFrom( primary: Color(0xFF0000A0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.person,size: 30,),
                            )
                        ),
                      )
                  )
                ],
              ):
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                round = 0;
                                blueScore.clear();
                                redScore.clear();
                                sumRed = 0;
                                sumBlue = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom( primary: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.clear,size: 30,),
                            )
                        ),
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
