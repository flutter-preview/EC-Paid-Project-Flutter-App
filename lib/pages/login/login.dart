import 'dart:ui';

import 'package:flutter/material.dart';

import '../../urls/urls.dart';
import 'components/input_box.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(0.0),
        children:[ Container(
         
          padding:EdgeInsets.symmetric(horizontal: 20),
          height:MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
  // gradient: LinearGradient(
  //   colors: [Color.fromARGB(255, 9, 126, 181), Colors.white],
  //   stops: [0.8, 20],
  //   begin: Alignment.bottomLeft,
  //   end: Alignment.topRight,
  // ),
  image: DecorationImage(
    image: NetworkImage(
      'https://w.forfun.com/fetch/59/59eea5bf2b204449655f734f3ea97a9c.jpeg?h=300&r=0.5',
    ),
    fit: BoxFit.cover,
  ),
),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Expanded(child:SizedBox()),
                   SizedBox(
                  // height: 60,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                    const SizedBox(height: 40),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          width: double.infinity,
                        // margin:EdgeInsets.fromLTRB(10,0,10,0),
                          padding: const EdgeInsets.all(10),
                          // color: Colors.white.withOpacity(0),
                          decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.solid,width: 2,color: Colors.black.withOpacity(0.2)
                            ),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(blurRadius: 10,spreadRadius: 40.0,offset:Offset(0,10),color:Color.fromARGB(4, 247, 240, 240)
                              )
                            ],
                            color:Colors.white.withOpacity(0.0)
                          ),
                          
                          child:MyInputBox(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                     SizedBox(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async{
// final a=await getAll()       ;                        print(a);    
Navigator.of(context).pushNamed("/gridpage");
},
                                  child: const Text('Login'),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 9.9,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                ),
                              ),
                    Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.golf_course),
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.apple),
                        ),
                      ],
                    ),
                        Expanded(child: SizedBox()),
            SafeArea(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [TextButton(onPressed: (){}, child: Text("not signedup yet?  signup")
            ,)],
            ),
            )
                  ],
                ),
              ),
        
            ),
      ]),

    
    );
  }
}
