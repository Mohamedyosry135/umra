import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:umra/consts/colors.dart';

class AudioPreviewWidget extends StatefulWidget {
  final String attachment;
  final bool isLocal;
  const AudioPreviewWidget({Key? key,required this.attachment,this.isLocal = false}) : super(key: key);

  @override
  State<AudioPreviewWidget> createState() => _AudioPreviewWidgetState();
}

class _AudioPreviewWidgetState extends State<AudioPreviewWidget> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    setAudio();
    super.initState();
  }
  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    if(widget.isLocal){
      audioPlayer.setSourceDeviceFile(widget.attachment);
    }else{
      audioPlayer.setSourceUrl(widget.attachment);
    }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value)async{
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position.inSeconds),
                    ),
                    Text(
                      formatTime(duration.inSeconds),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 25,
                child: IconButton(
                  onPressed: ()async{
                    if(isPlaying){
                      await audioPlayer.pause();
                    }else{
                      if(widget.isLocal){
                        await audioPlayer.play(DeviceFileSource(widget.attachment));
                      }else{
                        await audioPlayer.play(UrlSource(widget.attachment));
                      }
                    }
                  },
                  icon: Icon(
                    isPlaying? Icons.pause : Icons.play_arrow
                  ),
                  iconSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  formatTime(int timeInSecond) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min":"$min";
    String second = sec.toString().length <= 1 ? "0$sec":"$sec";
    return "$minute : $second";
  }
}
