import 'package:flutter/material.dart';
import 'package:my_calculator/components.dart';
import 'package:math_expressions/math_expressions.dart';
class homescreen extends StatefulWidget {
  const homescreen({super.key});
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var userinput = '';
  var useroutput = '';

  void Select(String value) {
    setState(() {
      userinput += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // User input
                        Text(
                          userinput,
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 12),

                        // User output (beautiful clean look)
                        Text(
                          useroutput,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    Mybutton(
                      title: "AC",
                      onpress: () {
                        setState(() {
                          userinput = '';
                          useroutput = '';
                        });
                      },
                    ),
                    Mybutton(
                      title: "+/-",
                      onpress: () {
                        setState(() {
                          if (userinput.isNotEmpty) {
                            // Find the last number in the input
                            RegExp regex = RegExp(r'(-?\d+\.?\d*)$');
                            Match? match = regex.firstMatch(userinput);

                            if (match != null) {
                              String lastNumber = match.group(0)!;

                              // Toggle sign
                              if (lastNumber.startsWith('-')) {
                                String newNumber = lastNumber.substring(1); // remove "-"
                                userinput = userinput.replaceRange(match.start, match.end, newNumber);
                              } else {
                                String newNumber = '-$lastNumber'; // add "-"
                                userinput = userinput.replaceRange(match.start, match.end, newNumber);
                              }
                            }
                          }
                        });
                      },
                    ),


                    Mybutton(title: "%", onpress: () {
                      if(userinput.isNotEmpty){
                        setState(() {
                          userinput+="/100";
                        });
                      }
                    }),
                    Mybutton(
                      title: "/",
                      color: Colors.deepOrangeAccent,
                      onpress: () {
                        Select("/");
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Mybutton(
                      title: "7",
                      onpress: () {
                        Select("7");
                      },
                    ),
                    Mybutton(
                      title: "8",
                      onpress: () {
                        Select("8");
                      },
                    ),
                    Mybutton(
                      title: "9",
                      onpress: () {
                        Select("9");
                      },
                    ),
                    Mybutton(
                      title: "x",
                      color: Colors.deepOrangeAccent,
                      onpress: () {
                        Select("*");
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Mybutton(
                      title: "4",
                      onpress: () {
                        Select("4");
                      },
                    ),
                    Mybutton(
                      title: "5",
                      onpress: () {
                        Select("5");
                      },
                    ),
                    Mybutton(
                      title: "6",
                      onpress: () {
                        Select("6");
                      },
                    ),
                    Mybutton(
                      title: "-",
                      color: Colors.deepOrangeAccent,
                      onpress: () {
                        Select("-");
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Mybutton(
                      title: "1",
                      onpress: () {
                        Select("1");
                      },
                    ),
                    Mybutton(
                      title: "2",
                      onpress: () {
                        Select("2");
                      },
                    ),
                    Mybutton(
                      title: "3",
                      onpress: () {
                        Select("3");
                      },
                    ),
                    Mybutton(
                      title: "+",
                      color: Colors.deepOrangeAccent,
                      onpress: () {
                        Select("+");
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Mybutton(
                      title: "0",
                      onpress: () {
                        Select("0");
                      },
                    ),
                    Mybutton(
                      title: ".",
                      onpress: () {
                        Select(".");
                      },
                    ),
                    Mybutton(
                      title: "DEL",
                      onpress: () {
                        setState(() {
                          if (userinput.isNotEmpty) {
                            userinput = userinput.substring(
                              0,
                              userinput.length - 1,
                            );
                          }
                        });
                      },
                    ),
                    Mybutton(
                      title: "=",
                      color: Colors.deepOrangeAccent,
                      onpress: () {
                        setState(() {
                          try {
                           Parser p= Parser();
                           Expression exp= p.parse(userinput);
                           ContextModel c= ContextModel();
                           double eval= exp.evaluate(EvaluationType.REAL,c);
                           useroutput=eval.toString();
                          }
                          catch(e){
                            useroutput="Error";
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
