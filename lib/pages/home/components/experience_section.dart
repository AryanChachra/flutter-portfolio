import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/experience.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

final List<Experience> experienceList = [
  Experience(
    description: "Taygete Software Solutions Pvt. Ltd.",
    position: "Software Development Intern",
    period: "JUL 2024 - JUL 2025",
  ),
];

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      key: key,
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EXPERIENCE",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 400.0),
                  child: Text(
                    "Gaining hands-on experience through impactful roles, turning ideas into working solutions.",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: experienceList
                      .map(
                        (experience) => Container(
                      width: constraints.maxWidth / 2.0 - 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            experience.period,
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            experience.description,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            experience.position,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          )
                        ],
                      ),
                    ),
                  ).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
