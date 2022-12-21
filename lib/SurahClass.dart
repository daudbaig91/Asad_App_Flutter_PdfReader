
class SurahClass {
  late final int surah;
  late final int page;


  SurahClass({
    required this.surah,
    required this.page,
  });
  SurahClass.fromMap(Map<String, dynamic> result)
      : surah = result["surah"],
        page = result["page"];

  Map<String, Object> toMap() {
    return {
      'surah': surah,
      'page': page,
    };
  }
}