import 'package:flutter/material.dart';

class SectionHeightsProvider with ChangeNotifier {
  double _introSectionHeight = 0.0;
  double _aboutMeSectionHeight = 0;
  double _skillsSectionHeight = 0;
  double _projectsSectionHeight = 0;
  double _contactMeSectionHeight = 0;
  double _projectHeadingHeight = 0;
  double _project0Height = 0;
  double _project1Height = 0;
  double _project2Height = 0;
  static const double SLANT_BOX_HEIGHT = 20.0;
  static const double PROJECT_SIZED_BOX = 100.0;
  static const double PADDING_BTW_PROJECTS = 80;
  static const double PROJECT_HEADING_PADDING = 100;

  double get introSectionHeight {
    final tempISH = _introSectionHeight;
    return tempISH;
  }

  double get aboutMeSectionPosition {
    final tempAMSP = _introSectionHeight;
    return tempAMSP;
  }

  double get skillsSectionPosition {
    final tempSSP = _introSectionHeight + _aboutMeSectionHeight;
    return tempSSP;
  }

  double get projectsSectionPostion {
    final tempPSP = _introSectionHeight +
        _aboutMeSectionHeight +
        _skillsSectionHeight +
        SLANT_BOX_HEIGHT +
        PROJECT_SIZED_BOX;
    return tempPSP;
  }

  double get contaceMeSectionPosition {
    final tempCMSP = _introSectionHeight +
        _aboutMeSectionHeight +
        _skillsSectionHeight +
        SLANT_BOX_HEIGHT +
        PROJECT_SIZED_BOX +
        _projectsSectionHeight;
    return tempCMSP;
  }

  double get project0SectionPosition {
    final tempP0SP = _introSectionHeight +
        _aboutMeSectionHeight +
        _skillsSectionHeight +
        SLANT_BOX_HEIGHT +
        PROJECT_HEADING_PADDING +
        _projectHeadingHeight;
    return tempP0SP;
  }

  double get project1SectionPosition {
    final tempP1SP = _introSectionHeight +
        _aboutMeSectionHeight +
        _skillsSectionHeight +
        SLANT_BOX_HEIGHT +
        PROJECT_HEADING_PADDING +
        _projectHeadingHeight +
        _project0Height +
        PADDING_BTW_PROJECTS;
    return tempP1SP;
  }

  double get project2SectionPosition {
    final tempP2SP = _introSectionHeight +
        _aboutMeSectionHeight +
        _skillsSectionHeight +
        SLANT_BOX_HEIGHT +
        PROJECT_HEADING_PADDING +
        _projectHeadingHeight +
        _project0Height +
        PADDING_BTW_PROJECTS +
        _project1Height +
        PADDING_BTW_PROJECTS;
    return tempP2SP;
  }

  void setIntroSectionHeight(double introSectionHeight) {
    _introSectionHeight = introSectionHeight;
    notifyListeners();
  }

  void setAboutMeSectionHeight(double aboutMeSectionHeight) {
    _aboutMeSectionHeight = aboutMeSectionHeight;
    notifyListeners();
  }

  void setSkillsSectionHeight(double skillsSectionHeight) {
    _skillsSectionHeight = skillsSectionHeight;
    notifyListeners();
  }

  void setProjectsSectionHeight(double projectsSectionHeight) {
    _projectsSectionHeight = projectsSectionHeight;
    notifyListeners();
  }

  void setContactMeSectionHeight(double contactMeSectionHeight) {
    _contactMeSectionHeight = contactMeSectionHeight;
    notifyListeners();
  }

  void setProject0Height(double project0Height) {
    _project0Height = project0Height;
    notifyListeners();
  }

  void setProject1Height(double project1Height) {
    _project1Height = project1Height;
    notifyListeners();
  }

  void setProject2Height(double project2Height) {
    _project2Height = project2Height;
    notifyListeners();
  }

  void setProjectHeadingHeight(double projectHeadingHeight) {
    _projectHeadingHeight = projectHeadingHeight;
    notifyListeners();
  }
}
