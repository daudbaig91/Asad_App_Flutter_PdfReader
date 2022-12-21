class SurahModel {
  int surah;
  int page;

  SurahModel({required this.surah,required this.page});

  SurahModel fromJson(json) {
    return SurahModel(
        surah: json['surah'], page: json['page']);
  }

  Map<String, dynamic> toJson() {
    return {'surah': surah, 'page': page};
  }
}
