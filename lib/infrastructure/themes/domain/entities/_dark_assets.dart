
part of 'app.assets.dart';

class _DarkAssets extends _CommonAssets implements AppAssetsContract {

  static const String _assetsPath = 'assets/graphics/dark';

  final AppAssetsIconsContract icons = _DarkIcons();

  @override
  final String logo = '$_assetsPath/logo.png';

  @override
  final String placeholder = '$_assetsPath/placeholder.png';
}