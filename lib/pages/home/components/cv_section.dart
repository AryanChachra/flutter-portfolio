import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/design_process.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "AVGEEK",
    imagePath: "assets/avgeek.png",
    subtitle:
        "An aviation enthusiast who enjoys planespotting and staying updated with the world of flight.",
  ),
  DesignProcess(
    title: "GDSC LEAD '24",
    imagePath: "assets/google.png",
    subtitle:
        "Former Google Developer Student Clubs Lead at CDGI, leading innovation and community collaboration.",
  ),
  DesignProcess(
    title: "BLOGGING",
    imagePath: "assets/blogging.png",
    subtitle:
        "I enjoy writing tech content, project documentation, and thought pieces that simplify complex ideas.",
  ),
  DesignProcess(
    title: "TECH MENTOR",
    imagePath: "assets/mentor.png",
    subtitle:
        "I enjoy helping juniors get started with tech — from AI basics to full-stack development guidance",
  ),
];

class CvSection extends StatelessWidget {
  const CvSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        key: key,
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          minWidth: width,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ScreenHelper.isDesktop(context) || ScreenHelper.isTablet(context) ?
                  "Curious about what I bring to the table? Grab my CV!" : "Grab my CV!",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final url = 'assets/Aryan_Resume.pdf';
                    if (kIsWeb) {
                      await launchUrl(Uri.parse(url),
                          webOnlyWindowName: '_blank');
                    } else {
                      final fallbackUrl = Uri.parse(
                          'https://drive.google.com/file/d/1iAZAr1xX8nOd-2UepyDjcQLpeI5TbztH/view?usp=drive_link');
                      if (await canLaunchUrl(fallbackUrl)) {
                        await launchUrl(fallbackUrl);
                      }
                    }
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "DOWNLOAD CV",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                Text(
                  'ABOUT ME',
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    height: 1.3,
                  ),
                ),
              ],
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 250.0,
                    // Hack to adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              designProcesses[index].imagePath,
                              width: 40.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              designProcesses[index].title,
                              style: GoogleFonts.oswald(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          designProcesses[index].subtitle,
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: designProcesses.length,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
