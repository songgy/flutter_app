class LogUtils {
  static bool isRelease = false;

  static final String _tag = "moon";

  static void println(String msg) {
    if (!isRelease) {
      print("$_tag: $msg");
    }
  }
}
