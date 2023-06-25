import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mechanic/core/constants.dart';

import '../../data/data_sources/DB_Helper.dart';
import '../Auth/view/login_screen.dart';
import '../home/view/home_screen.dart';
import 'package:get/get.dart';

import '../on_boarding/onboarding_screen.dart';
class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> with TickerProviderStateMixin {
  AnimationController? logocontrol,progresscontrol;
  Animation? Logo_animate,progress_animate;
  bool? seen;

  @override
  void initState() {
    super.initState();
    logocontrol=AnimationController(vsync: this,duration: Duration(seconds: 5));
    Logo_animate=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: logocontrol!, curve: Curves.easeInOutCubicEmphasized));
    Logo_animate!.addListener(()=>setState(() {}));
    progresscontrol=AnimationController(vsync: this,duration: Duration(seconds: 2));
    progress_animate=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: logocontrol!, curve: Curves.easeInOutCubicEmphasized));
    progress_animate!.addListener(()=>setState(() {}));

    logocontrol!.forward().then((value){
      progresscontrol!.forward().then((value)async{
         await DB_Helper.isBoardingSeen().then((value){
          seen=value;
          print("seen: $seen");
          Future.delayed(Duration(microseconds: 500),()async{
            seen==true?   Get.offAll(controlView(),transition: kTransition2,duration: kTransitionDuration):Get.offAll(OnBoardingView(),transition: kTransition1);


          });
        });
      });
    });





  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SafeArea(
      child: Scaffold(

        body: Stack(

          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: Logo_animate!.value,
                    child: Center(
                      child: Image.asset(
                        'assets/images/carepair.png',
                        height: height/2.5,
                        width: double.infinity,

                      ),
                    ),
                  ),
                  ShaderMask(


                    shaderCallback: (bounds) {
                      return RadialGradient(
                        center: Alignment.topLeft,
                        radius: 2,
                        colors: [Color.fromRGBO(0, 0, 0, 1), Color.fromRGBO(56,181 ,253, 1),Color.fromRGBO(56,181 ,253, 1)],
                        tileMode: TileMode.repeated,
                      ).createShader(bounds);
                    },
                    child:   Container(
                      margin: EdgeInsets.all(width/20),
                      padding: EdgeInsets.all(width/20),

                      child: Opacity(
                          opacity:progress_animate!.value ,
                          child: Container(
                            height: height/8,
                            width: width/4,
                            child: Opacity(
                              opacity: .9,
                              child: LoadingIndicator(
                                  indicatorType: Indicator.ballPulseSync, /// Required, The loading type of the widget
                                  colors: const [Colors.white],       /// Optional, The color collections
                                  strokeWidth: 1,

                                  backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                                  pathBackgroundColor: Colors.transparent   /// Optional, the stroke backgroundColor
                              ),
                            ),
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget controlView() {
  if (DB_Helper.getUserToken() == null) {
    return LoginScreen();
  } else {
    return const HomeScreen();
  }
}

