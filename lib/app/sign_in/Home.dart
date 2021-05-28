import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
          width: 350,
          //l position bta3 l container m3 any momken a7oto kda kda fe stack w a8ayr mkano bra7ty
          top: MediaQuery.of(context).size.height/5,
          child: Column(
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  //kda l container nafso lono a7mar y3ny lw shelt l stoor aly t7t dh haykon a7mar
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                  fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  //borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 7.0,color: Colors.black)
                  ]
                ),
              ),
              SizedBox(height: 15,),
              Center(
                child: new Text("MR. Tom",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 15,),
                Row(
                  children: <Widget>[
                 Container(
                    width: 15,
                    height: 15,
                    padding: EdgeInsets.fromLTRB(50, 30, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    child:new Text('Available to Freelance',style: TextStyle(color: Colors.green),)
                  )
                  ],
                )
              
            ],
          ),
        ),
        ListView(
          children: <Widget>[

          ],
        )
      ],
    ));
  }
}
    

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.3);
    path.lineTo(size.width + 250, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}