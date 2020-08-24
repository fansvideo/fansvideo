import 'package:fansvideo/models/video.dart';

class FakeRepository {
  static List<Video> videos = [
    Video(
        id: "1",
        videoTitle: "Video 1",
        url: "https://9gag.com/photo/amvg1G6_460sv.mp4",
        students: "143",
        likes: "3223",
        songName: "Song 1 - Artist 1",
        user: "User 1",
        userPic:
            "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
    Video(
        id: "2",
        videoTitle: "Video 2",
        url:
            "https://v16.tiktokcdn.com/2a0a8d30d734164b8786f850dc8a29e0/5f1641d7/video/tos/useast2a/tos-useast2a-ve-0068c001/35701cc3d63146b5a55d0af44306896a/",
        students: "143",
        likes: "3223",
        songName: "Song 2 - Artist 2",
        user: "User 2",
        userPic:
            "https://i.pinimg.com/originals/5e/eb/8d/5eeb8d615bea040425f9937699392751.jpg"),
    Video(
        id: "3",
        videoTitle: "Video 3",
        url:
            "https://v16m.tiktokcdn.com/4ca13a402903817b4becdca9cd29dc16/5f1633c1/video/tos/useast2a/tos-useast2a-pve-0068/1b92fd6422a54a9dad497608d56dd18d/?a=1233&br=1872&bt=936&cr=0&cs=0&dr=0&ds=3&er=&l=202007201815480101150170071B30A435&lr=tiktok_m&mime_type=video_mp4&qs=0&rc=M2xpO3hvbjtpdTMzOzczM0ApNzM5ZzZlZ2Q7NzZpM2dlZGdqNl5fcnNzLTRfLS01MTZzcy8yMi8uYDFhYWItYWFfYTE6Yw%3D%3D&vl=&vr=",
        students: "143",
        likes: "3223",
        songName: "Song 3 - Artist 3",
        user: "User 3",
        userPic:
            "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg")
  ];
}
