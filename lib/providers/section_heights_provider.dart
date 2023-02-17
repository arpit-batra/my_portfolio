import 'package:flutter/material.dart';

class SectionHeightsProvider with ChangeNotifier {
  double _introSectionHeight = 0.0;
  double _aboutMeSectionHeight = 0;
  double _skillsSectionHeight = 0;
  double _projectsSectionHeight = 0;
  double _contactMeSectionHeight = 0;
  static const double SLANT_BOX_HEIGHT = 20.0;
  static const double PROJECT_SIZED_BOX = 100.0;

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
}
