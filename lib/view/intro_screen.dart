import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_demo/view/user_on_boarding.dart';

class TodoIntroScreen extends StatefulWidget {
  TodoIntroScreen({Key key}) : super(key: key);

 @override
  _TodoIntroScreenState createState() => _TodoIntroScreenState();
}
class _TodoIntroScreenState extends State<TodoIntroScreen> {

  final introKey = GlobalKey<IntroductionScreenState>();

 void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => UserOnBoarding()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/imgaes/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Welcome to Clear",
          body:
              "Tap or Swipe to begin.",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Add your Tasks",
          body:
              "You can add tasks from bottom floating button",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Swipe right to complete the task",
          body:
              "You can swipe to right and mark task as completed",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Swipe left to delete the task",
        
          body: "You can swipe to left and can delete task",
          image: _buildImage('img2'),
         
          
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Lets Begin",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on Done to get started ", style: bodyStyle),
           
            ],
          ),
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}