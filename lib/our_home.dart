import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:node_connect/appText.dart';

import 'fader.dart';

class OurHome extends StatefulWidget {
  const OurHome({super.key});

  @override
  State<OurHome> createState() => _OurHomeState();
}

class _OurHomeState extends State<OurHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          //_NavbarDesktop(),
          Opacity(
            opacity: 0.6,
            child: EntranceFader(
              offset: const Offset(0, 0),
              delay: const Duration(seconds: 1),
              duration: const Duration(milliseconds: 800),
              // height: size.height,
              // width: size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/images/farm2.jpeg",
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Farm Area: 10000 msq"),
                    Text("Previous Irrigation Date : 22-01-2023"),
                  ]),
            ),
          ),
          Center(
            child: Container(
              width: size.width / 1.5,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleElement(
                          title: "Temperature : 25",
                          lottieFile:
                              "https://assets10.lottiefiles.com/packages/lf20_64okjrr7.json"),
                      // SingleElement(
                      //     title: "Moisture",
                      //     lottieFile:
                      //         "https://assets9.lottiefiles.com/packages/lf20_buzt1erl.json"),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleElement(
                          title: "Humidity : 40%",
                          lottieFile:
                              "https://assets1.lottiefiles.com/packages/lf20_nfxa6agk.json"),
                      SingleElement(
                          title: "Moisture : 90%",
                          lottieFile:
                              "https://assets10.lottiefiles.com/packages/lf20_iombyzfq.json"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            //width: 300,
            height: 70,
            child: Opacity(opacity: 1, child: NavBarLogo()),
          ),
        ],
      ),
    ));
  }
}

class SingleElement extends StatelessWidget {
  String title;
  String lottieFile;

  SingleElement({Key? key, required this.title, required this.lottieFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          //color: Colors.greenAccent
          ),
      width: 300,
      //height: 200,
      child: Column(children: [
        Container(
          height: 230,
          width: 200,
          child: Lottie.network(
            lottieFile,
          ),
        ),
        Container(
          // /color: Colors.white,
          child: Text(
            title,
            style: GoogleFonts.openSans(color: Colors.black, fontSize: 25),
          ),
        )
      ]),
    );
  }
}

class _NavbarDesktop extends StatelessWidget {
  const _NavbarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          const NavBarLogo(),
          SizedBox(
            width: 30,
          ),
          // ...NavBarUtils.names.asMap().entries.map(
          //       (e) => NavBarActionButton(
          //         label: e.value,
          //         index: e.key,
          //       ),
          //     ),
          // EntranceFader(
          //   offset: const Offset(0, -10),
          //   delay: const Duration(milliseconds: 100),
          //   duration: const Duration(milliseconds: 250),
          //   child: MaterialButton(
          //     hoverColor: AppTheme.c!.primary!.withAlpha(150),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(5.0),
          //       side: BorderSide(
          //         color: AppTheme.c!.primary!,
          //       ),
          //     ),
          //     onPressed: () {
          //       html.window.open(
          //         StaticUtils.resume,
          //         "pdf",
          //       );
          //     },
          //     child: Padding(
          //       padding: Space.all(1.25, 0.45),
          //       child: Text(
          //         'RESUME',
          //         style: AppText.l1b,
          //       ),
          //     ),
          //   ),
          // ),
          // Space.x!,
          // Switch(
          //   inactiveTrackColor: Colors.grey,
          //   value: appProvider.isDark,
          //   onChanged: (value) {
          //     appProvider.setTheme(
          //       !value ? ThemeMode.light : ThemeMode.dark,
          //     );
          //   },
          //   activeColor: AppTheme.c!.primary!,
          // ),
        ],
      ),
    );
  }
}

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("E-FARM",
              style: GoogleFonts.openSans(color: Colors.black, fontSize: 25)),
        ],
      ),
    );
  }
}
