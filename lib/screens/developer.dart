import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DeveloperCard(new Developer(
          "Mrigank Anand",
          "https://media-exp1.licdn.com/dms/image/C4E03AQGgcLs_4ff6-w/profile-displayphoto-shrink_400_400/0/1605192688356?e=1626307200&v=beta&t=qQZnJhuGMI38H-F59st08_Nz7tzg1MYq0KhI_enIc6k",
          "https://www.linkedin.com/in/mrigankanand/",
          "https://github.com/spiderxm",
          "mrigank.anand52@gmail.com")),
    );
  }
}

class Developer {
  final String name;
  final String imageUrl;
  final String linkedinUrl;
  final String githubUrl;
  final String email;

  Developer(
      this.name, this.imageUrl, this.linkedinUrl, this.githubUrl, this.email);
}

class DeveloperCard extends StatelessWidget {
  final Developer _developer;

  DeveloperCard(this._developer);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Center(
                      child: Text(
                        _developer.name,
                        style: GoogleFonts.adventPro(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        _developer.email,
                        style: GoogleFonts.adventPro(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () {
                              UrlServices.openUrl(_developer.githubUrl);
                            }),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () {
                              UrlServices.openUrl(_developer.linkedinUrl);
                            })
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 20,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  boxShadow: []),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(_developer.imageUrl),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UrlServices {
  static void openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    }
  }
}
