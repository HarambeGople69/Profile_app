import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/widgets/our_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Can't launch");
    }
  }

  List<Map<String, String>> mywork = [
    {
      "title": "Number System Converter: Convert and Learn",
      "image": "images/1.png",
      "url":
          "https://play.google.com/store/apps/details?id=com.utsav.Number_Conversion",
    },
    {
      "title": "Image to pdf converter",
      "image": "images/2.png",
      "url":
          "https://play.google.com/store/apps/details?id=com.PDFUtsavForth.image",
    },
    {
      "title": "Tic Tac Toe",
      "image": "images/3.png",
      "url":
          "https://play.google.com/store/apps/details?id=com.TicUtsavToeShrestha.TTT",
    },
    {
      "title": "COVID-19 Tracker",
      "image": "images/4.png",
      "url": "https://github.com/HarambeGople69/COVID_19-provider",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.red,
            height: ScreenUtil().setSp(350),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "images/background.jpg",
                  height: ScreenUtil().setSp(300),
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: -ScreenUtil().setSp(
                      30,
                    ),
                    left: ScreenUtil().setSp(20),
                    right: ScreenUtil().setSp(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setSp(40),
                        ),
                        color: Colors.white,
                      ),
                      height: ScreenUtil().setSp(110),
                      width: double.infinity,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Text("data1"),
                          Positioned(
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                ScreenUtil().setSp(40),
                              ),
                              child: Image.asset(
                                "images/utsav1.jpeg",
                                height: ScreenUtil().setSp(140),
                                width: ScreenUtil().setSp(120),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              right: ScreenUtil().setSp(60),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: ScreenUtil().setSp(10),
                                  ),
                                  Text("Utsav Shrestha", style: titleStyle),
                                  SizedBox(
                                    height: ScreenUtil().setSp(5),
                                  ),
                                  Text(
                                    "Flutter Developer",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _launchUrl(
                                              "https://www.facebook.com/utsav.shrestha.589/");
                                        },
                                        icon: Icon(
                                          Icons.facebook,
                                          color: Colors.blue[900],
                                          size: ScreenUtil().setSp(30),
                                        ),
                                      ),
                                      // Icon(Icons.instagr)
                                      IconButton(
                                        onPressed: () {
                                          _launchUrl(
                                              "https://www.instagram.com/utsav__shrestha/");
                                        },
                                        icon: FaIcon(
                                          FontAwesomeIcons.instagram,
                                          color: Colors.amber[900],
                                          size: ScreenUtil().setSp(30),
                                        ),
                                      ),
                                      // Text("1"),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setSp(10),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mywork.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(20),
                      vertical: ScreenUtil().setSp(5),
                    ),
                    child: Text(
                      "My works",
                      style: titleStyle,
                    ),
                  );
                }
                return Container(
                  child: InkWell(
                    onTap: () {
                      _launchUrl("${mywork[index - 1]["url"]}");
                    },
                    child: ListTile(
                      title: Text(
                        "${mywork[index - 1]["title"]}",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      leading: Image.asset(
                        "${mywork[index - 1]["image"]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(20),
              vertical: ScreenUtil().setSp(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OurButton(
                  title: "Hire me",
                  function: () {},
                ),
                OurButton(
                  title: "View CV",
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ViewPdf();
                    }));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ViewPdf extends StatelessWidget {
  const ViewPdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My CV",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(25),
          ),
        ),
      ),
      body: SfPdfViewer.asset(
        "images/Resume.pdf",
      ),
    );
  }
}
