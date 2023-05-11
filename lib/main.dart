import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var intController = TextEditingController();

  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        centerTitle: true,

        title: Text('Your BMI'),
        
        
      ),
      body:Container(
        color: bgColor,
        child: Center(
          child: Container(


            width: 300,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text('BMI',style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
                ),),

                SizedBox(height: 21,),

                TextField(
                  controller: wtController ,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight (in Kgs)'),

                      prefixIcon: Icon(Icons.line_weight)
                  ),

                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),


                TextField(
                  controller: ftController ,
                  decoration: InputDecoration(
                      label: Text('Enter Your Height (in Feet)'),

                      prefixIcon: Icon(Icons.height)
                  ),

                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: intController ,
                  decoration: InputDecoration(
                      label: Text('Enter Your Height (in Inch)'),

                      prefixIcon: Icon(Icons.height)
                  ),

                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 20,),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = intController.text.toString();

                  if(wt!= "" && ft!= "" && inch!= "") {

                    //BMI Calculation

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                    var msg= "";

                    if(bmi>25){

                      msg = "You're overWeight";
                      bgColor = Colors.orange.shade100;

                    }
                    else if(bmi<18){

                      msg= "You're Under Weight";
                      bgColor =Colors.red.shade100;
                    }
                     else {

                       msg="You're Healthy";
                       bgColor = Colors.green.shade100;

                    }

                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)} ";
                    });



                  } else {

                    setState(() {
                      result = "Please fill all the required blanks ";
                    });

                  }



                }, child: Text   ('Calculate')),

                SizedBox(height: 11,),

                Text(result,style: TextStyle(fontSize: 20),)

              ],

            ),
          ),
        ),
      )




    );
  }
}
