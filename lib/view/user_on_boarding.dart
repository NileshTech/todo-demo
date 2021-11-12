import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:todo_demo/services/database_services.dart';
import 'package:todo_demo/view/todo_list.dart';

class UserOnBoarding extends StatefulWidget {
  UserOnBoarding({Key key}) : super(key: key);

  @override
  _UserOnBoardingState createState() => _UserOnBoardingState();
}

class _UserOnBoardingState extends State<UserOnBoarding> {
  TextEditingController _controller;
  String userEmailId;
  bool isValidEmailId;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign up to the newsletter, and unlock a theme for your list"),
            Icon(Icons.mail, color:Colors.black,size: 40,),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Form(
                child: TextFormField(
                  autovalidate: userEmailId != null ? true : false,
                  validator: (value) => EmailValidator.validate(value)
                      ? null
                      : "Please enter a valid email",
                  decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    labelText: 'Email Id',
                    hintText: 'Enter Your Email Id',
                  ),
                  controller: _controller,
                  onChanged: (String value) async {
                    setState(() {
                      userEmailId = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => TodoList()),
                      );
                    },
                    child: Text("Skipp", style: TextStyle(color:Colors.white )),
                  ),
                  userEmailId != null  
                      ? MaterialButton(
                        color: Colors.indigo,
                          onPressed: () async {
                                                  
                                await DatabaseService.onBoardingUserWithEmailId(
                                    userEmailId);
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => TodoList()),
                                );
                              
                            
                          },
                          child: Text("Submit",style : TextStyle(color:Colors.white)),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
