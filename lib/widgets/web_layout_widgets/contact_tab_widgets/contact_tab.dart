import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/contact_tab_widgets/contact_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    Uri email = Uri(
      scheme: 'mailto',
      path: 'caglarkullu@gmail.com',
    );
    Uri linkedin =
        Uri.tryParse("https://www.linkedin.com/in/caglar-kullu-b23085163/")!;
    Uri github = Uri.tryParse("https://github.com/CaglarKullu")!;
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            width: size.width * 0.6,
            height: size.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(247, 239, 138, 1),
                  Color.fromRGBO(237, 201, 103, 1),
                  Color.fromRGBO(210, 172, 71, 1),
                  Color.fromRGBO(174, 134, 37, 1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 0.2.w,
                        width: size.width / 8,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Contact Me",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 0.2.w,
                        width: size.width / 8,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ContactLauncher(
                    link: "caglarkullu@gmail.com",
                    iconData: Icons.email,
                    url: email),
                ContactLauncher(
                    link: "https://www.linkedin.com/in/caglar-kullu-b23085163/",
                    iconData: FontAwesome5.linkedin,
                    url: linkedin),
                ContactLauncher(
                    link: "https://github.com/CaglarKullu",
                    iconData: FontAwesome5.github,
                    url: github)
              ],
            )),
      )),
    ));
  }
}
