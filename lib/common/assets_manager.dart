class AssetsManager {
  factory AssetsManager() => _instance;
  AssetsManager._();

  static final AssetsManager _instance = AssetsManager._();
  static const _path = 'assets';

  static const icon = '$_path/logo.png';

  //resources
  static const questions = '$_path/resources/preguntas.json';
}
