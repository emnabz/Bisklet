import 'package:flutter/material.dart';
import 'package:bisklet/home_page/main_home.dart';
class Onboarding extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onboarding(),
    );
  }
}
class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                )
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onBoard1", "Choose Your Bike"),
                    onBoardPage("onBoard2", "Schedule Pickup"),
                    onBoardPage("onBoard3", "Get Best Guided Trip"),
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => getIndicator(index))
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: changePage,
                child: Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Color(0xff33cc33), Color(0xffe57509)],
                          stops: [0,1],
                          begin: Alignment.topCenter
                      )
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
          ),

        ],
      ),
    );
  }
  setCurrentPage(int value)
  {
    currentPage = value;
    setState(() {

    });
  }
  AnimatedContainer getIndicator(int pageNo)
  {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 10,
        width: (currentPage == pageNo) ? 20 : 10,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: (currentPage == pageNo) ? Colors.green : Colors.grey
        )
    );
  }
  Column onBoardPage(String img, String title)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 1000,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image: DecorationImage(
                    image: AssetImage('assets/images/menu.png')
              )
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(title, style: TextStyle(
              fontSize: 30,
              fontFamily: 'roboto',
              fontWeight: FontWeight.w500
          ),),
        ),
      ],
    );
  }
  
  void changePage()
  {
    print(currentPage);
    if(currentPage == 2)
      {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
      }
    else{
      _pageController.animateToPage(currentPage+1, duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
  }
}