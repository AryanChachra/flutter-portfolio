import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/components/carousel.dart';
import 'package:portfolio/pages/home/components/cv_section.dart';
import 'package:portfolio/pages/home/components/education_section.dart';
import 'package:portfolio/pages/home/components/footer.dart';
import 'package:portfolio/pages/home/components/header.dart';
import 'package:portfolio/pages/home/components/project_careconnect.dart';
import 'package:portfolio/pages/home/components/skill_section.dart';
import 'package:portfolio/pages/home/components/project_pawsitive.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';
import 'components/experience_section.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: kPrimaryColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final item = headerItems[index];
                return item.isButton
                    ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kDangerColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        item.onTap();
                      },
                      child: Text(
                        headerItems[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
                    : ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    item.onTap();
                  },
                  title: Text(
                    headerItems[index].title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: Globals.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Container(
                key: Globals.aboutKey,
                child: Carousel()),
            SizedBox(
              height: 20.0,
            ),
            CvSection(),
            SizedBox(
              height: 35.0,
            ),
            Container(
                key: Globals.educationKey,
                child: EducationSection()),
            SizedBox(
              height: 35.0,
            ),
            Container(
                key: Globals.experienceKey,
                child: ExperienceSection()),
            SizedBox(
              height: 35.0,
            ),
            Container(
                key: Globals.skillsKey,
                child: SkillSection()),
            SizedBox(
              height: 35.0,
            ),
            Container(
                key: Globals.projectsKey,
                child: CareConnect()),
            SizedBox(
              height: 35.0,
            ),
            Pawsitive(),
            Container(
                key: Globals.contactKey,
                child: Footer()),
          ],
        ),
      ),
    );
  }
}