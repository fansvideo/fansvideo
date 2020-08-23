class Video {
  String id;
  String user;
  String userPic;
  String videoTitle;
  String songName;
  String likes;
  String students;
  String url;

  Video(
      {this.id,
      this.user,
      this.userPic,
      this.videoTitle,
      this.songName,
      this.likes,
      this.students,
      this.url});

  Video.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userPic = json['userPic'];
    videoTitle = json['videoTitle'];
    songName = json['songName'];
    likes = json['likes'];
    students = json['students'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user'] = this.user;
    data['userPic'] = this.userPic;
    data['videoTitle'] = this.videoTitle;
    data['songName'] = this.songName;
    data['likes'] = this.likes;
    data['students'] = this.students;
    data['url'] = this.url;
    return data;
  }
}
