// https://www.youtube.com/playlist?list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE

class Constants {
  static String? getYoutubeThumbnail(String videoUrl) {
    final uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return null;
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  static List<BasicTreatment> stories = [
    BasicTreatment(
        title: 'د. أحمد رمزي | اساسيات الاسعافات الأولية | ادراك - استعدوا',
        url:
            'https://www.youtube.com/watch?v=YHmIxsTqDzk&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=1'),
    BasicTreatment(
        title: 'د. أحمد رمزي | كورس اساسيات الاسعافات الأولية - ادراك',
        url:
            'https://www.youtube.com/watch?v=EROaFrSSN5g&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=2'),
    BasicTreatment(
        title: 'د. أحمد رمزي | الاسعافات الأولية | 1. قواعد مهمة قبل البداية',
        url:
            'https://www.youtube.com/watch?v=o3WnKBJIlaQ&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=3'),
    BasicTreatment(
        title:
            'د. أحمد رمزي | الاسعافات الأولية | 2. التعرف علي المواقف الطارئة والخطوات الاولي',
        url:
            'https://www.youtube.com/watch?v=XaddSpn-Crg&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=4'),
    BasicTreatment(
        title: 'د. أحمد رمزي | الاسعافات الأولية | 3. سلامتك أولا _ فحص المكان',
        url:
            'https://www.youtube.com/watch?v=5wR6C67u4mQ&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=5'),
    BasicTreatment(
        title: 'د. أحمد رمزي | اساسيات الاسعافات الأولية | ادراك - استعدوا',
        url:
            'https://www.youtube.com/watch?v=XaddSpn-Crg&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=4'),
    BasicTreatment(
        title: 'د. أحمد رمزي | كورس اساسيات الاسعافات الأولية - ادراك',
        url:
            'https://www.youtube.com/watch?v=EROaFrSSN5g&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=2'),
    BasicTreatment(
        title: 'د. أحمد رمزي | الاسعافات الأولية | 1. قواعد مهمة قبل البداية',
        url:
            'https://www.youtube.com/watch?v=o3WnKBJIlaQ&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=3'),
    BasicTreatment(
        title:
            'د. أحمد رمزي | الاسعافات الأولية | 2. التعرف علي المواقف الطارئة والخطوات الاولي',
        url:
            'https://www.youtube.com/watch?v=XaddSpn-Crg&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=4'),
    BasicTreatment(
        title: 'د. أحمد رمزي | اساسيات الاسعافات الأولية | ادراك - استعدوا',
        url:
            'https://www.youtube.com/watch?v=5wR6C67u4mQ&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=5'),
    BasicTreatment(
        title: 'د. أحمد رمزي | اساسيات الاسعافات الأولية | ادراك - استعدوا',
        url:
            'https://www.youtube.com/watch?v=YHmIxsTqDzk&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=1'),
    BasicTreatment(
        title: 'د. أحمد رمزي | كورس اساسيات الاسعافات الأولية - ادراك',
        url:
            'https://www.youtube.com/watch?v=EROaFrSSN5g&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=2'),
    BasicTreatment(
        title: 'د. أحمد رمزي | الاسعافات الأولية | 1. قواعد مهمة قبل البداية',
        url:
            'https://www.youtube.com/watch?v=o3WnKBJIlaQ&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=3'),
    BasicTreatment(
        title:
            'د. أحمد رمزي | الاسعافات الأولية | 2. التعرف علي المواقف الطارئة والخطوات الاولي',
        url:
            'https://www.youtube.com/watch?v=XaddSpn-Crg&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=4'),
    BasicTreatment(
        title: 'د. أحمد رمزي | اساسيات الاسعافات الأولية | ادراك - استعدوا',
        url:
            'https://www.youtube.com/watch?v=5wR6C67u4mQ&list=PL2KKBLjtT0mYtViotkeJ2lTbvOQgvv1ZE&index=5'),
  ];
}

class BasicTreatment {
  String title;
  String url;

  BasicTreatment({required this.title, required this.url});
}
