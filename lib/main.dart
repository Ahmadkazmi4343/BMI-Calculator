import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'YOUR BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller= TextEditingController();
  var ftcontroller= TextEditingController();
  var incontroller= TextEditingController();

  var result="";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI',style: TextStyle(
                    fontSize: 34,fontWeight: FontWeight.w700
                  ),),

                  SizedBox(height: 21,),

                  TextField(
                    controller: wtcontroller,
                    decoration: InputDecoration(
                      label:Text('Enter your Weight'),
                      prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: ftcontroller,
                    decoration: InputDecoration(
                        label:Text('Enter your height(in feet)'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: incontroller,
                    decoration: InputDecoration(
                        label:Text('Enter your height(in inches)'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 16,),

                  ElevatedButton(onPressed: ()
    {
        var wt = wtcontroller.text.toString();
        var ft = ftcontroller.text.toString();
        var inch = incontroller.text.toString();

        if (wt != "" && ft != "" && inch != ""){

          var iWt= int.parse(wt);
          var iFt= int.parse(ft);
          var iInch= int.parse(inch);

          var tInch= (iFt*12) + iInch;
          var tCm=tInch*2.54;
          var tM= tCm/100;
          var bmi= iWt/(tM*tM);

          var msg="";

          if(bmi>25){
              msg="you are overWeight";
              bgColor =Colors.orange.shade200;
          } else if(bmi<18){
              msg="you are underWeight";
              bgColor=Colors.redAccent.shade200;

          }else{
              msg="you are Healthy";
              bgColor= Colors.greenAccent.shade200;

          }

          setState(() {
              result="$msg \n your BMI is : ${bmi.toStringAsFixed(2) }";
          });





    }else{
          setState(() {
              result="please fill all blanks";
          });

    }

                  }, child:Text('Calculate')),

                    SizedBox(height: 11,),

                    Text(result,style: TextStyle(fontSize: 19),)

                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
