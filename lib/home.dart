import 'package:flutter/material.dart';
import 'package:predictex/cat_and_dog/catanddog.dart';
import 'package:predictex/constant.dart';
import 'package:predictex/face_detection/facemaskdetect.dart';
import 'package:predictex/flower_detection/flower_detection.dart';
import 'package:predictex/ocr1/ocr.dart';
import 'package:predictex/textScan/cameraSc.dart';
import 'package:predictex/webViewer/webview.dart';

import 'digit_recognizer/screens/draw_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool theme = true;
  Color mainColor = Color(0xFFE8FC40);
  Color blackk = Color(0xFF222222);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.black87,
        // ),
        iconTheme: IconThemeData(color: Colors.black),
        //TODO: hiden until moved to getX arcitecture
        // actions: [
        //   IconButton(
        //     icon: Icon(theme ? Icons.wb_sunny : Icons.brightness_2, color: theme ? Colors.amberAccent : blackk),
        //     onPressed: () {
        //       setState(() {
        //         theme = !theme;
        //       });
        //     },
        //   ),
        // ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Predictex',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  'For predicting result using Deep learning',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MaterialButton(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color(0xFF003D64),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0.0, 10.0),
                                  blurRadius: 10.0)
                            ]),
                      ),
                      Container(
                        alignment: FractionalOffset.centerRight,
                        child: const Image(
                          image: AssetImage(
                            'images/1.png',
                          ),
                          height: 190,
                          width: 190,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Model Prediction',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'Using TFlite',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Container(
                              height: 40.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFF00578D),
                              ),
                              child: Center(
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Learn More',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        alignment: PlaceholderAlignment.middle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SecondScreen(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      cards(
                        colour: Color(0xFF6674F1),
                        img: 'images/wear_mask.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        title: ' Face Mask ',
                        subtitle: 'Detection',
                        wid: const FaceDetectPage(),
                      ),
                      cards(
                        colour: Color(0xFFE44E4F),
                        img: 'images/flower.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        title: 'Flower',
                        subtitle: 'Detection',
                        wid: FlowerDetect(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      cards(
                        colour: Color(0xFF1A95B6),
                        img: 'images/cat_dog_icon.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        title: 'Cats & Dogs',
                        subtitle: 'Detection',
                        wid: CatDog(),
                      ),
                      cards(
                        colour: Color(0xFFE67E49),
                        img: 'images/ocr.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        title: ' Text OCR',
                        subtitle: 'Recognition-1',
                        wid: OCR1(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      cards(
                        colour: Color(0xFFE67E49),
                        img: 'images/ocr.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        title: ' Text OCR',
                        subtitle: 'Recognition-2',
                        wid: CameraScreen(),
                      ),
                      cards(
                        colour: Color(0xFFE67E49),
                        img: 'images/ocr.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        title: 'Digit Recognizer',
                        subtitle: 'from Drawing',
                        wid: DrawScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Predictex',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF003D64),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => HomePage(),
                //   ),
                // );
              },
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(
                Icons.info,
                color: Colors.black,
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => AboutPage(),
                //   ),
                // );
              },
            ),
            ListTile(
              title: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.black,
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => ContactPage(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
