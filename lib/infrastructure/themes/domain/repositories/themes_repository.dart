
import 'package:flutter/material.dart';

import '../entities/app_theme.dart';

abstract class ThemesRepository {

  AppTheme get lightTheme;

  AppTheme get darkTheme;
}