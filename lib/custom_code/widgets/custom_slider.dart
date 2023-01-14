// Automatic FlutterFlow imports
// ignore: unused_import
import '../../backend/backend.dart';
// ignore: unused_import
import '../../flutter_flow/flutter_flow_theme.dart';
// ignore: unused_import
import '../../flutter_flow/flutter_flow_util.dart';
// ignore: unused_import
import 'index.dart'; // Imports other custom widgets
// ignore: unused_import
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    this.width,
    this.height,
    this.sliderValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? sliderValue;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Color(0xFFFFCD3C),
        inactiveTickMarkColor: Color(0xFF132651),
        thumbColor: Colors.grey,
        thumbShape: SliderComponentShape.noThumb,
        overlayColor: Colors.transparent,
      ),
      child: Slider(
        value: widget.sliderValue!,
        min: 0.0,
        max: 1000.0,
        onChanged: (double newValue) {},
      ),
    );
  }
}
