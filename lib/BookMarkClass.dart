
class BookMarkClass {
  late final String surah;
  late final String parah;
  late final int page;
  late final String title;
  late final String desc;

  BookMarkClass({
    required this.surah,
    required this.parah,
    required this.page,
    required this.title,
    required this.desc,

  });
  BookMarkClass.fromMap(Map<String, dynamic> result)
      : surah = result["surah"],
        parah = result["parah"],
        page = result["page"],
        title = result["title"],
        desc = result["desc"];
  Map<String, Object> toMap() {
    return {
      'surah': surah,
      'parah': parah,
      'page': page,
      'title': title,
      'desc': desc,

    };
  }
}