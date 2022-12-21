class BookMarkModel {
  String surah;
  String parah;
  int page;
  String title;
  String desc;


  BookMarkModel({required this.surah,required this.parah,required this.page,
    required this.title,required this.desc});

  BookMarkModel fromJson(json) {
    return BookMarkModel(
        surah: json['surah'], parah: json['parah'], page: json['page'],
        title: 'title', desc: 'desc');
  }

  Map<String, dynamic> toJson() {
    return {'surah': surah, 'parah': parah,'page': page, 'title': title,
      'desc': desc};
  }
}
