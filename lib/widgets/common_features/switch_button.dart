import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SwichButton extends StatefulWidget {
  const SwichButton({super.key});

  @override
  State<SwichButton> createState() => _SwichButtonState();
}

class _SwichButtonState extends State<SwichButton> {
  Artboard? _riveArtboard;
  SMIInput<bool>? _isClicked;
  @override
  void initState() {
    super.initState();
    rootBundle
        .load('assets/animations/button_animation.riv')
        .then((data) async {
      // Load the RiveFile from the binary data.
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller =
          StateMachineController.fromArtboard(artboard, 'State Machine 1');
      if (controller != null) {
        artboard.addController(controller);
        _isClicked = controller.findInput('isClicked');
      }
      setState(() => _riveArtboard = artboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard == null
        ? const SizedBox()
        : GestureDetector(
            onTap: () {
              _isClicked!.value = !_isClicked!.value;
            },
            child: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Rive(artboard: _riveArtboard!),
              ),
            ),
          );
  }
}
