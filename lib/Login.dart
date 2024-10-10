
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Constant/Colors.dart';
import 'Constant/FontSize.dart';
import 'Model/Ascendant.dart';
import 'Route.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passenable = true; //boolean value to track password view enable disable.
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    // Get.to(logins);
    super.initState();
  }


  Checker(){
    if(controllerUsername.text == ""){
      Message("Required","Username can't be empty", context);
    }else if(controllerPassword.text == ""){
      Message("Required","Password can't be empty", context);
    }else{
      isLoading = true;
      setState(() async{
        // isLoading = await LoginData(context, controllerUsername.text,controllerPassword.text);
        // isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: BackgroundGray(),
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            Container(
              color: BackgroundGray(),
            ),
            Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 250,
                                width: double.infinity,
                                child: Image.asset("assets/img/logo.png",fit: BoxFit.cover)
                            ),
                            Container(
                              color: PrimaryColors(),
                              height: 50,
                              width: double.infinity,
                              child: Center(child: new Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey,
                                        offset: Offset(0,2),
                                        spreadRadius: 2
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: SingleChildScrollView(
                                    child: new Column(
                                      children: <Widget>[
                                        Container(
                                            child: TextField(
                                              controller: controllerUsername,
                                              decoration: InputDecoration(
                                                  hintText: 'Your Username...',
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: 'Username',
                                                  border: OutlineInputBorder(),
                                                  suffixIcon: controllerUsername.text.isEmpty ? Container(width: 0,): IconButton(
                                                    icon: Icon(
                                                        Icons.close,
                                                        color: Colors.red),
                                                    onPressed: ()=> controllerUsername.clear(),
                                                  )
                                              ),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                            )
                                        ),
                                        SizedBox(height: 30,),
                                        Container(
                                            child: TextField(
                                              controller: controllerPassword,
                                              decoration: InputDecoration(
                                                  hintText: 'Your Password...',
                                                  prefixIcon: Icon(Icons.lock),
                                                  labelText: 'Password',
                                                  border: OutlineInputBorder(),
                                                  suffixIcon: IconButton(
                                                      icon: passenable
                                                          ? Icon(Icons.visibility_off)
                                                          : Icon(Icons.visibility),
                                                      onPressed: () =>
                                                          setState(() => passenable = !passenable)
                                                  )
                                              ),
                                              obscureText: passenable,
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                            )
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                // Checker();
                                                toDashboard(context, false);
                                              },
                                              child: Container(
                                                  width: 200,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      color: PrimaryColors()
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text("Login",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // toRegister(context);
                                          },
                                          child: Container(
                                              width: double.maxFinite,
                                              child: Center(
                                                child: Text(
                                                  "Register Here",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: LargeFontSize()
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        // Google Login Open Here
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Divider(
                                                height: 5,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("OR",style: TextStyle(color: Colors.black,fontSize: LargeFontSize())),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Divider(
                                                height: 5,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                setState(() async{
                                                  isLoading = true;
                                                  // isLoading = await handleSignIn(context);
                                                });
                                                // handleSignOut();
                                              },
                                              child: Container(
                                                width: 200,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Colors.blue
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      FaIcon(FontAwesomeIcons.google,color: Colors.white,),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("Login As Google",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ),
                                            )
                                          ],
                                        )
                                        //   Open Here
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 50,
                    //   width: double.maxFinite,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //   ),
                    //   child: Center(
                    //     child: Text("Copyright @ Podomoro University 2024."),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            if(isLoading)
              Stack(
                  children:[
                    Container(
                        color: Colors.black.withOpacity(0.5)
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: CircularProgressIndicator()
                        ),
                        SizedBox(width: double.infinity, height: 20,),
                        Text("Sedang Mencoba Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        )
                      ],
                    )
                  ]
              ),
          ],
        ),
      ),
    );
  }
}
