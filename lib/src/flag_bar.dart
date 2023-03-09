import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

/// Receives the user's parameters and provides the final [FlagBar] for the user.
class FlagBar extends StatefulWidget {
  /// Defines the list of flags to be used, each flag is a string.
  final List<String> flagList;

  /// The initial index of the flag list. The default is 0 (first flag on the left).
  final int initialIndex;

  /// Defines the callback function to be called when the toggle changes state. The [index] variable is the index of the flag list.
  final Function(int index) onChanged;

  /// The required parameters that later will be used or initialized in the initState.
  const FlagBar(
      {super.key,
      required this.flagList,
      required this.initialIndex,
      required this.onChanged});

  @override
  State<FlagBar> createState() => _FlagBarState();
}

/// Defines the [FlagBar] state.
class _FlagBarState extends State<FlagBar> {
  late int flagIndex;
  Widget invalidListWidget =
      const Center(child: Text("Error: flag list size < 2"));

  @override
  void initState() {
    super.initState();
    _initVariables();
  }

  /// Initializes variables and mitigates some abnormal states.
  void _initVariables() async {
    flagIndex = widget.initialIndex;
    if (flagIndex < 0 || flagIndex >= widget.flagList.length) flagIndex = 0;
  }

  /// The build method creates the AnimatedToggleSwitch based on the user's choices.
  @override
  Widget build(BuildContext context) {
    if (widget.flagList.length < 2) return invalidListWidget;
    return AnimatedToggleSwitch<int>.rollingByHeight(
      current: flagIndex,
      values: List.generate(widget.flagList.length, (index) => index),
      iconOpacity: 0.33,
      indicatorSize: const Size.fromWidth(1),
      customIconBuilder: (context, local, global) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SvgPicture.asset(
            'assets/flags/${widget.flagList[local.index].toLowerCase()}.svg',
            package: "simple_flag_toggle"),
      ),
      innerColor: Theme.of(context).primaryColor,
      onChanged: (index) {
        setState(() {
          flagIndex = index;
          widget.onChanged(index);
        });
      },
    );
  }
}
