import 'package:flutter/material.dart';

class Globals {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static final aboutKey = GlobalKey();
  static final educationKey = GlobalKey();
  static final experienceKey = GlobalKey();
  static final skillsKey = GlobalKey();
  static final projectsKey = GlobalKey();
  static final contactKey = GlobalKey();

  static final scrollController = ScrollController();
}