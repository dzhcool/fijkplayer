import 'package:flutter/material.dart';

import 'video_page.dart';

@immutable
class MediaUrl {
  const MediaUrl({required this.url, this.title, this.audioTrack});

  final String? title;
  final String url;
  final int? audioTrack;

  MediaUrl.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        audioTrack = json['audioTrack'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'audioTrack': audioTrack,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaUrl &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          url == other.url;

  @override
  int get hashCode => title.hashCode ^ url.hashCode;
}

class MediaItem extends StatelessWidget {
  MediaItem({
    required this.mediaUrl,
  });

  final MediaUrl mediaUrl;

  @override
  Widget build(BuildContext context) {
    List<Widget> ws = <Widget>[];

    if (mediaUrl.title != null) {
      ws.add(Text(
        mediaUrl.title!,
        style: TextStyle(fontSize: 15),
      ));
    }
    ws.add(Text(
      mediaUrl.url,
      style: TextStyle(fontSize: 13),
    ));
    return ButtonTheme(
//      height: mediaUrl.title == null ? 50 : 60,

      child: TextButton(
          key: ValueKey(mediaUrl.url),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoScreen(url: mediaUrl.url, audioTrack: mediaUrl.audioTrack,)));
          },
          child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: ws,
              ))),
    );
  }
}
