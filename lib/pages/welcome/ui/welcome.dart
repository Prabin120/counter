import 'package:counter/pages/home/ui/home.dart';
import 'package:counter/pages/welcome/bloc/bloc_bloc.dart';
import 'package:counter/pages/welcome/bloc/bloc_event.dart';
import 'package:counter/pages/welcome/bloc/bloc_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return Container(
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index){
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                        // print(index);
                      },
                      children: [
                        _page(
                            1,
                            context,
                            "Next",
                            "First See Learning",
                            "Forgot about a for of paper all knowledge in one learning",
                            "assets/images/reading.png"),
                        _page(
                            2,
                            context,
                            "Next",
                            "Connect with Everyone",
                            "Forgot about a for of paper all knowledge in one learning",
                            "assets/images/boy.png"),
                        _page(
                            3,
                            context,
                            "Get Started",
                            "Always Fascinated Learning",
                            "Forgot about a for of paper all knowledge in one learning",
                            "assets/images/man.png"),
                      ],
                    ),
                    Positioned(
                        bottom: 100.w,
                        child: DotsIndicator(
                          position: state.page,
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color: Colors.grey,
                              size: Size.square(8.0),
                              activeSize: Size(15.0, 8.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              activeColor: Colors.blueAccent),
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 375.w,
          height: 375.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),

        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap:() {
            if(index<3){
              // annimation
              pageController.animateToPage(
                index, 
                duration: const Duration(milliseconds: 500), 
                curve: Curves.easeIn
              );
            }else{
              // print("Its here");
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
              Navigator.of(context).pushNamedAndRemoveUntil("signInPage", (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 10))
                ]),
            child: Center(
              child: Text(buttonName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        )
      ],
    );
  }
}
