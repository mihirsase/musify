import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musify/bloc/player/player_event.dart';
import 'package:musify/bloc/player/player_state.dart';
import 'package:musify/models/song.dart';

class PlayerBloc extends Bloc<PlayerEvent, AudioPlayerState> {
  final Song song;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration? songDuration;
  Duration? songPosition;

  PlayerBloc({
    required this.song,
  }) : super(PlayerLoading());

  @override
  Stream<AudioPlayerState> mapEventToState(
    final PlayerEvent event,
  ) async* {
    if (event is LoadPlayer) {
      if (song.songUrl != null) {
        songDuration = await audioPlayer.setUrl(song.songUrl!);
        audioPlayer.positionStream.listen((Duration event) {
          songPosition = event;
          add(ChangePosition());
        });

        audioPlayer.playerStateStream.listen((state) {
          if (state.processingState == ProcessingState.completed) {
            add(Reload());
          }
        });
      }
      yield PlayerLoaded();
    } else if (event is ChangePosition) {
      yield PlayerLoaded();
    } else if (event is Reload) {
      audioPlayer.pause();
      audioPlayer.seek(Duration(milliseconds: 0));
      yield PlayerLoaded();
    } else if (event is Play) {
      audioPlayer.play();
      yield PlayerLoaded();
    } else if (event is Pause) {
      audioPlayer.pause();
      yield PlayerLoaded();
    }
  }

  String getFormattedDuration(Duration? duration) {
    if (duration != null) {
      return "${duration.inMinutes.remainder(60)}:${(duration.inSeconds.remainder(60))}";
    }
    return '0:00';
  }

  double get progressPercentage {
    if (songPosition == null || songDuration == null) {
      return 0.0;
    } else {
      return songPosition!.inMilliseconds / songDuration!.inMilliseconds;
    }
  }
}
