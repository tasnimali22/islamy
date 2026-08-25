import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamyapp/core/utils/assets.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class CustomSoundWave extends StatefulWidget {
  const CustomSoundWave({
    super.key,
    required this.title,
    required this.isPlaying,
    required this.onpressed,
  });
  final String title;
  final bool isPlaying;
  final VoidCallback onpressed;

  @override
  State<CustomSoundWave> createState() => _CustomSoundWaveState();
}

class _CustomSoundWaveState extends State<CustomSoundWave> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title, style: Styles.textStyle20b),
        Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                width: 390.w,
                DataAssets.haditihMosque,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: widget.onpressed,

                  icon: Icon(
                    widget.isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    color: kBlack,
                    size: 44,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_up, color: kBlack, size: 44),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
