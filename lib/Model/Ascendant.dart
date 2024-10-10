
import 'package:flutter/material.dart';


import '../Constant/Colors.dart';
import '../Constant/FontSize.dart';
import '../Route.dart';

String ImageDummy = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkxGINkXzKO1VE-jS8ED8i08kpb_2pC9lR0A&s";
int TimeoutTimeSecond(){
  return 10;
}
LoginSuccessMessage(BuildContext context,name){
  showGeneralDialog(
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 200),
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5,end: 1.0).animate(animation),
        child: AlertDialog(
          title: Center(
              child: Text("Login Success !")
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("You are logged in as "+name,textAlign: TextAlign.center),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  toDashboard(context, false);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("Close",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              )
            ],
          ),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none
          ),
        ),
      );
    },
  );
}
String timeAgo(String date) {
  DateTime dateTime = DateTime.parse(date); // Parsing string to DateTime
  Duration diff = DateTime.now().difference(dateTime);

  if (diff.inDays > 0) {
    return "${diff.inDays} days ago";
  } else if (diff.inHours > 0) {
    return "${diff.inHours} hours ago";
  } else if (diff.inMinutes > 0) {
    return "${diff.inMinutes} minutes ago";
  } else {
    return "Just Now";
  }
}
// bool CheckerGoogle(String checkGoogle) {
//   String check = 'https://lh3.googleusercontent.com/a/';
//   return checkGoogle.startsWith(check);
// }
// Future<bool> handleSignIn(BuildContext context) async {
//   try {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//     if (googleAuth != null && googleUser != null) {
//       String? IDS = googleUser.id;
//       // Mendapatkan idToken
//       String? idToken = googleAuth.idToken;
//       String? accessToken = googleAuth.accessToken;
//       // Mendapatkan data nama dan foto profil
//       String? name = googleUser.displayName;
//       String? photoUrl = googleUser.photoUrl;
//       String? token = googleUser.id;
//       String? email = googleUser.email;
//       //
//       // print(googleUser.runtimeType);
//       // print(googleAuth.runtimeType);
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//
//       // Get the ID token from the user credential
//       String? idTokens = await userCredential.user?.getIdToken();
//       print('User credential obtained: ${idTokens.toString()}');
//       return LoginGoogle(context,
//           token.toString(),
//           photoUrl.toString(),
//           name.toString(),
//           email.toString(),
//           idTokens.toString()
//       );
//     }else{
//       print('Error signing insss: $googleAuth');
//       return false;
//     }
//   } catch (error) {
//     print('Error signing in: $error');
//     return false;
//
//     // Message("Error", error.toString(), context);
//   }
// }
// Future<void> handleSignOut() => googleSignIn.disconnect();
Message(String title,String desc,BuildContext context){
  showGeneralDialog(
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 200),
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5,end: 1.0).animate(animation),
        child: AlertDialog(
          title: Center(
              child: Text(title)
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(desc),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("Tutup",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              )
            ],
          ),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none
          ),
        ),
      );
    },
  );
}
// final GoogleSignIn googleSignIn = GoogleSignIn(
//   scopes: [
//     'openid',
//     'email',
//     'profile',
//   ],
// );
// Logouts(BuildContext context) async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   await pref.clear();
//   handleSignOut();
//   toLogin(context);
// }
// LogoutMessage(String title,String desc,BuildContext context){
//   showGeneralDialog(
//     barrierLabel: '',
//     barrierDismissible: true,
//     transitionDuration: Duration(milliseconds: 200),
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Container();
//     },
//     transitionBuilder: (context, animation, secondaryAnimation, child) {
//       return ScaleTransition(
//         scale: Tween<double>(begin: 0.5,end: 1.0).animate(animation),
//         child: AlertDialog(
//           title: Center(
//               child: Text(title)
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(desc),
//               const SizedBox(height: 10),
//               Container(
//                 width: 300,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: InkWell(
//                         onTap: () async{
//                           Logouts(context);
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(50)
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Center(
//                               child: Text("Yes",
//                                 style: TextStyle(
//                                     color: Colors.white
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(50)
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Center(
//                               child: Text("No",
//                                 style: TextStyle(
//                                     color: Colors.white
//                                 ),),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           shape: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide.none
//           ),
//         ),
//       );
//     },
//   );
// }
// Container LoadingContainer(double widths,double heights){
//   return Container(
//     width: double.maxFinite,
//     height: double.maxFinite,
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               width: widths/2,
//               height: heights/2,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/img/logo-pu.png")
//                 )
//               ),
//             )
//           ),
//           Center(
//             child: Lottie.asset(
//                 "assets/lottie/loading2.json",
//                 width: widths/2,
//                 height: heights/2,
//                 fit: BoxFit.fill
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// ModalFollows(BuildContext context,String id_user){
//   TextEditingController search = new TextEditingController();
//   ScrollController controller = new ScrollController();
//   bool following = true;
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true, // Agar tinggi dapat dikontrol
//     builder: (BuildContext context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return Container(
//             height: MediaQuery.of(context).size.height * 0.8, // 80% dari tinggi layar
//             width: double.maxFinite,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40)
//                 )
//             ),
//             child: Center(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       color: Colors.black,
//                       width: 50,
//                       height: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                       ),
//                       width: double.maxFinite,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: InkWell(
//                                 onTap: () {
//                                   following = true;
//                                   setState(() {
//
//                                   });
//                                 },
//                                 child: AnimatedContainer(
//                                   margin: EdgeInsets.all(5),
//                                   duration: Duration(seconds: 1),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: following ? PrimaryColors() : Colors.white
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Center(
//                                         child: Text(
//                                           "Following",
//                                           style: TextStyle(
//                                               color: following ? Colors.white : Colors.black
//                                           ),
//                                         )
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: InkWell(
//                                 onTap: () {
//                                   following = false;
//                                   setState(() {
//
//                                   });
//                                 },
//                                 child: AnimatedContainer(
//                                   margin: EdgeInsets.all(5),
//                                   duration: Duration(seconds: 1),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: following==false ? PrimaryColors() : Colors.white
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Center(
//                                         child: Text(
//                                           "Follower",
//                                           style: TextStyle(
//                                               color: following==false ? Colors.white : Colors.black
//                                           ),
//                                         )
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: FutureBuilder(
//                         future: FollowList(context, following,id_user),
//                         builder: (context, snapshot) {
//                           if(snapshot.hasData){
//                             return ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: snapshot.requireData.length,
//                               physics: BouncingScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     toSearchProfile(context, false,snapshot.requireData[index]['id']);
//                                   },
//                                   child: Container(
//                                     margin: EdgeInsets.all(5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: BackgroundGray2()
//                                     ),
//                                     child: Padding(
//                                         padding: const EdgeInsets.all(5.0),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius: BorderRadius.circular(50),
//                                                       color: PrimaryColors(),
//                                                       image: DecorationImage(
//                                                           image: snapshot.requireData[index]['photo_profile'] == "null"
//                                                               ? AssetImage("assets/img/Kembang.png")
//                                                               : NetworkImage(
//                                                               snapshot.requireData[index]['photo_profile'])
//                                                       )
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(snapshot.requireData[index]['name']),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         )
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           }else{
//                             return Container();
//                           }
//                         },
//                       )
//                     ),
//                   ],
//                 )
//             ),
//           );
//         },
//       );
//     },
//   );
// }
// ModalSearchPerson(BuildContext context){
//   TextEditingController search = new TextEditingController();
//   ScrollController controller = new ScrollController();
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true, // Agar tinggi dapat dikontrol
//     builder: (BuildContext context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return Container(
//             height: MediaQuery.of(context).size.height * 0.8, // 80% dari tinggi layar
//             width: double.maxFinite,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40)
//               )
//             ),
//             child: Center(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       color: Colors.black,
//                       width: 50,
//                       height: 1,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(),
//                     Container(
//                         child: TextField(
//                           style: TextStyle(
//                               fontSize: DefaultFontSize()
//                           ),
//                           controller: search,
//                           decoration: InputDecoration(
//                             hintText: 'Search Here',
//                             labelText: 'Search Here',
//                             prefixIcon: Icon(Icons.search),
//                           ),
//                           keyboardType: TextInputType.text,
//                           textInputAction: TextInputAction.done,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                         )
//                     ),
//                     Expanded(
//                       child: search.text.length < 1 ?
//                       Container(
//                         width: double.maxFinite,
//                         height: double.maxFinite,
//                         child: Center(child: Text("Search Please")),
//                       )
//                           :
//                       FutureBuilder(
//                         future: SearchPerson(context, search.text),
//                         builder: (context, snapshot) {
//                           if(snapshot.hasData){
//                             return ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: snapshot.requireData.length,
//                               physics: BouncingScrollPhysics(),
//                               controller: controller,
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     toSearchProfile(context, false,snapshot.requireData[index]['id']);
//                                   },
//                                   child: Container(
//                                     margin: EdgeInsets.all(5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: BackgroundGray2()
//                                     ),
//                                     child: Padding(
//                                         padding: const EdgeInsets.all(5.0),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius: BorderRadius.circular(50),
//                                                       color: PrimaryColors(),
//                                                       image: DecorationImage(
//                                                           image: snapshot.requireData[index]['photo_profile']!= 'null'
//                                                               ? CheckerGoogle(snapshot.requireData[index]['photo_profile'])
//                                                                 ? NetworkImage(snapshot.requireData[index]['photo_profile'])
//                                                                 : NetworkImage(ProfileImageBaseURL()+snapshot.requireData[index]['photo_profile'])
//                                                               : AssetImage("assets/img/Kembang.png")
//                                                       )
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(snapshot.requireData[index]['name']),
//                                                 ),
//                                                 FutureBuilder(future: CheckFollow(
//                                                     context,
//                                                     snapshot.requireData[index]['id']
//                                                 ),
//                                                   builder: (context, snapshots) {
//                                                     if(snapshots.hasData){
//                                                       if(snapshots.requireData == "0"){
//                                                         return InkWell(
//                                                           onTap: () async {
//                                                             await FollowingPost(context, snapshot.requireData[index]['id']);
//                                                             setState(() {
//
//                                                             });
//                                                           },
//                                                           child: Container(
//                                                             margin: EdgeInsets.all(5),
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius: BorderRadius.circular(10),
//                                                                 color: Colors.white,
//                                                                 border: Border.all(
//                                                                   color: Colors.grey
//                                                                 )
//                                                             ),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.all(5.0),
//                                                               child: Text(
//                                                                 "Follow",
//                                                                 style: TextStyle(
//                                                                     color: Colors.grey
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         );
//                                                       }else if(snapshots.requireData == "1"){
//                                                         return InkWell(
//                                                           onTap: () async {
//                                                             await FollowingPost(context, snapshot.requireData[index]['id']);
//                                                             setState(() {
//
//                                                             });
//                                                           },
//                                                           child: Container(
//                                                             margin: EdgeInsets.all(5),
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius: BorderRadius.circular(10),
//                                                                 color: Colors.white,
//                                                                 border: Border.all(
//                                                                     color: Colors.green
//                                                                 )
//                                                             ),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.all(5.0),
//                                                               child: Text(
//                                                                 "Followed",
//                                                                 style: TextStyle(
//                                                                     color: Colors.green
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         );
//                                                       }else{
//                                                         return InkWell(
//                                                           onTap: () async {
//                                                             await FollowingPost(context, snapshot.requireData[index]['id']);
//                                                             setState(() {
//
//                                                             });
//                                                           },
//                                                           child: Container(
//                                                             margin: EdgeInsets.all(5),
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius: BorderRadius.circular(10),
//                                                                 color: Colors.white,
//                                                                 border: Border.all(
//                                                                     color: PrimaryColors()
//                                                                 )
//                                                             ),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.all(5.0),
//                                                               child: Text(
//                                                                 "Friend",
//                                                                 style: TextStyle(
//                                                                     color: PrimaryColors()
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         );
//                                                       }
//                                                     }else{
//                                                       return Container(
//                                                         margin: EdgeInsets.all(5),
//                                                         decoration: BoxDecoration(
//                                                             borderRadius: BorderRadius.circular(10),
//                                                             color: PrimaryColors()
//                                                         ),
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.all(5.0),
//                                                           child: Text(
//                                                             "Follow",
//                                                             style: TextStyle(
//                                                                 color: Colors.white
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       );
//                                                     }
//                                                   },
//                                                 )
//
//                                               ],
//                                             ),
//                                           ],
//                                         )
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           }else{
//                             return Container();
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 )
//             ),
//           );
//         },
//       );
//     },
//   );
// }
// ChangeingUsername(BuildContext context){
//   TextEditingController controllerUsername = new TextEditingController();
//   showGeneralDialog(
//     barrierLabel: '',
//     barrierDismissible: true,
//     transitionDuration: Duration(milliseconds: 200),
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Container();
//     },
//     transitionBuilder: (context, animation, secondaryAnimation, child) {
//       return ScaleTransition(
//         scale: Tween<double>(begin: 0.5,end: 1.0).animate(animation),
//         child: AlertDialog(
//           title: Center(
//               child: Text("Make Username")
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                   child: TextField(
//                     controller: controllerUsername,
//                     decoration: InputDecoration(
//                         hintText: 'Your Username...',
//                         prefixIcon: Icon(Icons.person),
//                         labelText: 'Username',
//                         border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.text,
//                     textInputAction: TextInputAction.done,
//                   )
//               ),
//               InkWell(
//                 onTap: () async{
//                   PostChangeUsername(context, controllerUsername.text);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.green
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Center(child: Text("Confirm",style: TextStyle(color: Colors.white),)),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           shape: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide.none
//           ),
//         ),
//       );
//     },
//   );
// }
//
// DialogComment(BuildContext context,String id_post){
//   showGeneralDialog(
//     barrierLabel: '',
//     barrierDismissible: true,
//     transitionDuration: Duration(milliseconds: 200),
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Container();
//     },
//     transitionBuilder: (context, animation, secondaryAnimation, child) {
//       return ScaleTransition(
//         scale: Tween<double>(begin: 0.5,end: 1.0).animate(animation),
//         child: AlertDialog(
//           title: Center(
//               child: Text("Register Success !")
//           ),
//           content: FutureBuilder(
//               future: GetComment(context, id_post),
//               builder: (context, snapshot) {
//                 if(snapshot.hasData){
//                   TextEditingController controllerSubComment = new TextEditingController();
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.requireData.length,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: BackgroundGray2()
//                         ),
//                         child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                       width: 50,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(50),
//                                           color: PrimaryColors(),
//                                           image: DecorationImage(
//                                               image: NetworkImage(
//                                                   snapshot.requireData[index]['photo_profile']
//                                               )
//                                           )
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Expanded(
//                                       child: Text(snapshot.requireData[index]['name']),
//                                     )
//                                   ],
//                                 ),
//                                 IntrinsicHeight(
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         width: 50,
//                                         margin: EdgeInsets.only(top: 5,bottom: 5),
//                                         child: Center(
//                                             child: VerticalDivider(
//                                               thickness: 1,
//                                               color: Colors.black, // Warna divider
//                                             )
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Expanded(
//                                         child: Text(snapshot.requireData[index]['comment']),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 FutureBuilder(
//                                   future: ProfileData(context),
//                                   builder: (context, snapshots) {
//                                     if(snapshots.requireData.isNotEmpty){
//                                       return Row(
//                                         children: [
//                                           Container(
//                                             width: 50,
//                                             height: 50,
//                                             decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(50),
//                                                 color: PrimaryColors(),
//                                                 image: DecorationImage(
//                                                     image: NetworkImage(
//                                                         snapshots.requireData[index]['photo_profile']
//                                                     )
//                                                 )
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               children: [
//                                                 Container(
//                                                     width: double.maxFinite,
//                                                     child: Text(snapshots.requireData[index]['name'])),
//                                                 Container(
//                                                     child: TextField(
//                                                       style: TextStyle(
//                                                           fontSize: DefaultFontSize()
//                                                       ),
//                                                       controller: controllerSubComment,
//                                                       decoration: InputDecoration(
//                                                         hintText: 'Comment Here',
//                                                         labelText: 'Comment Here',
//                                                       ),
//                                                       keyboardType: TextInputType.text,
//                                                       textInputAction: TextInputAction.done,
//                                                     )
//                                                 ),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       );
//                                     }else{
//                                       return Container(
//                                         width: 50,
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(50),
//                                             color: PrimaryColors(),
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     snapshot.requireData[index]['photo_profile']
//                                                 )
//                                             )
//                                         ),
//                                       );
//                                     }
//                                   },
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       width: 15,
//                                     ),
//                                     Expanded(
//                                       child: ListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: snapshot.requireData[index]['subcomment'].length,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemBuilder: (context, index2) {
//                                           return Container(
//                                             margin: EdgeInsets.all(5),
//                                             decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(10),
//                                                 color: BackgroundGray2()
//                                             ),
//                                             child: Padding(
//                                                 padding: const EdgeInsets.all(5.0),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         Container(
//                                                           width: 50,
//                                                           height: 50,
//                                                           decoration: BoxDecoration(
//                                                               borderRadius: BorderRadius.circular(50),
//                                                               color: PrimaryColors(),
//                                                               image: DecorationImage(
//                                                                   image: NetworkImage(
//                                                                       snapshot.requireData[index]['subcomment'][index2]['photo_profile']
//                                                                   )
//                                                               )
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 10,
//                                                         ),
//                                                         Expanded(
//                                                           child: Text(snapshot.requireData[index]['subcomment'][index2]['name']),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     IntrinsicHeight(
//                                                       child: Row(
//                                                         children: [
//                                                           Container(
//                                                             width: 50,
//                                                             margin: EdgeInsets.only(top: 5,bottom: 5),
//                                                             child: Center(
//                                                                 child: VerticalDivider(
//                                                                   thickness: 1,
//                                                                   color: Colors.black, // Warna divider
//                                                                 )
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 10,
//                                                           ),
//                                                           Expanded(
//                                                             child: Text(snapshot.requireData[index]['subcomment'][index2]['label']),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             )
//                         ),
//                       );
//                     },
//                   );
//                 }else{
//                   return Container();
//                 }
//               },
//           ),
//           shape: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide.none
//           ),
//         ),
//       );
//     },
//   );
// }
// void showPrivacyPolicyDialog(BuildContext context) {
//   WebViewController controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//           LoadingContainer(200,200);
//         },
//         onPageStarted: (String url) {},
//         onPageFinished: (String url) {},
//         onHttpError: (HttpResponseError error) {},
//         onWebResourceError: (WebResourceError error) {},
//         onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     )
//     ..loadRequest(Uri.parse('https://kembang-api.podomorouniversity.ac.id/Privacy'));
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Center(child: Text("Privacy and Policy")),
//         content: Container(
//           width: double.maxFinite,
//           height: 400, // Atur tinggi sesuai kebutuhan
//           child: WebViewWidget(controller: controller),
//           // child: WebView(
//           //   initialUrl: '',
//           //   javascriptMode: JavascriptMode.unrestricted,
//           // ),
//         ),
//         actions: [
//           InkWell(
//             onTap: () {
//               Navigator.of(context).pop(); // Menutup dialog
//             },
//             child: Container(
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.red
//               ),
//               child : Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Center(
//                   child: Text("Close",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//       );
//     },
//   );
// }
// RegisterSuccessMessage(BuildContext context,name){
//   showGeneralDialog(
//     barrierLabel: '',
//     barrierDismissible: true,
//     transitionDuration: Duration(milliseconds: 200),
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Container();
//     },
//     transitionBuilder: (context, animation, secondaryAnimation, child) {
//       return ScaleTransition(
//         scale: Tween<double>(begin: 0.5,end: 1.0).animate(animation),
//         child: AlertDialog(
//           title: Center(
//               child: Text("Register Success !")
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Text("You are succesfully Registered  as $name you can now login "),
//               const SizedBox(height: 10),
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                   toLogin(context);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.red
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Center(child: Text("Close",style: TextStyle(color: Colors.white),)),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           shape: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide.none
//           ),
//         ),
//       );
//     },
//   );
// }
// LoginSuccessMessage(BuildContext context,name){
//   showGeneralDialog(
//     barrierLabel: '',
//     barrierDismissible: true,
//     transitionDuration: Duration(milliseconds: 200),
//     context: context,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Container();
//     },
//     transitionBuilder: (context, animation, secondaryAnimation, child) {
//       return ScaleTransition(
//         scale: Tween<double>(begin: 0.5,end: 1.0).animate(animation),
//         child: AlertDialog(
//           title: Center(
//               child: Text("Login Success !")
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Text("You are logged in as "+name,textAlign: TextAlign.center),
//               const SizedBox(height: 10),
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                   toDashboard(context, false);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.red
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Center(child: Text("Close",style: TextStyle(color: Colors.white),)),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           shape: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide.none
//           ),
//         ),
//       );
//     },
//   );
// }

