import 'package:caglar_portfolio/consts/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLauncher extends ConsumerWidget {
  final IconData iconData;
  final Uri url;
  final String link;
  const ContactLauncher(
      {required this.link,
      required this.iconData,
      required this.url,
      super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black,
              size: size.width / 50,
            ),
            SizedBox(
              width: size.width / 50,
            ),
            Text(
              link,
              style: TextStyle(color: Colors.black, fontSize: 15.sp),
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
