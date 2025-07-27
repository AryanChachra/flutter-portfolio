import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    description: "Bachelor of Technology in Artificial Intelligence and Data Science\nCDGI, Indore.",
    grades: "CGPA: 7.32",
    period: "2021 - 2025",
  ),
  Education(
    description:
        "12th (Maharashtra Board)\nGirme Junior College, Pune.",
    grades: "Percentage: 88.67%",
    period: "2021",
  ),
  Education(
    description:
        "10th (Maharashtra Board)\nCygnet Public School, Pune.",
    grades: "Percentage: 73%",
    period: "2019",
  ),
];

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);
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
              "EDUCATION",
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
                    "My academic journey with a strong emphasis on curiosity, growth, and real-world application of knowledge.",
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
                  children: educationList
                      .map(
                        (education) => Container(
                          width: constraints.maxWidth / 2.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                education.period,
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
                                education.description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                education.grades,
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
