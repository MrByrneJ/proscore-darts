import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/enums.dart';
import '../../domain/entities/bobs.dart';
import '../../domain/entities/atc.dart';
import '../../domain/entities/darts_match.dart';
import '../../domain/scoring_screen_state.dart';
import '../../domain/usecases/scoring_screen_event.dart';
import '../providers/scoring_screen_provider.dart';
import 'board.dart';
import 'field.dart';
import 'keypad.dart';
import 'rounded_container.dart';

class ScoringInputs extends StatelessWidget {
  const ScoringInputs(
      {super.key, required this.state, required this.size, required this.ref});
  final ScoringScreenState state;
  final Size size;
  final WidgetRef ref;

  Color getColor(ScoringScreenState state) {
    switch (state.selectedMultiplier) {
      case SelectedMultiplier.single:
        return secondaryWhite;
      case SelectedMultiplier.double:
        return secondaryGreen;
      case SelectedMultiplier.treble:
        return secondaryRed;
    }
  }

  Widget getInput(ScoringInputMethod inputMethod) {
    switch (inputMethod) {
      case ScoringInputMethod.keypad:
        return Keypad(state: state);
      case ScoringInputMethod.board:
        return Board(size: size);
      case ScoringInputMethod.field:
        return Field(state: state);
      case ScoringInputMethod.simple:
        return SimpleButtons(state: state, ref: ref);
      case ScoringInputMethod.cricket:
        return ElevatedButton(
          onPressed: () => ref.read(scoringScreenProvider.notifier).handleEvent(
              ScoringScreenEvent.submitScored(
                  state.dartsMatch.sets.last.legs.last.throws.last.scored)),
          child: const Text('Next'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: darkShadowColor,
        ),
        width: size.width,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            getInput(state.selectedInput),
          ],
        ));
  }
}

class InputButton extends StatefulWidget {
  const InputButton(
      {super.key,
      this.whenTapped,
      this.width,
      this.height,
      this.forgroundColor,
      this.errorColor,
      this.backgroundColor,
      required this.lable,
      this.isSelected = false});
  final VoidCallback? whenTapped;
  final String lable;
  final double? width;
  final double? height;
  final Color? forgroundColor;
  final Color? errorColor;
  final Color? backgroundColor;
  final bool isSelected;

  @override
  State<InputButton> createState() => _InputButtonState();
}

class _InputButtonState extends State<InputButton>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation =
        ColorTween(begin: primaryWhite, end: primaryRed).animate(_controller);
    super.initState();
  }

  void animate() {
    _controller.forward().then((value) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: widget.whenTapped,
        highlightColor: widget.errorColor,
        splashColor: widget.errorColor,
        onHighlightChanged: (b) async {
          if (widget.errorColor == null) return;
          await _controller.forward();
          _controller.reverse();
        },
        child: RoundedContainer(
          color: widget.isSelected
              ? highlightColor
              : widget.backgroundColor ?? primaryBlack,
          width: widget.width,
          height: widget.height,
          margin: const EdgeInsets.all(2.5),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => Text(widget.lable,
                maxLines: 1,
                style: TextStyle(
                    color: _animation.value, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class SimpleButtons extends StatelessWidget {
  const SimpleButtons({super.key, required this.ref, required this.state});

  final ScoringScreenState state;
  final WidgetRef ref;

  Widget buttons() {
    final List<Dart> darts =
        state.dartsMatch.sets.last.legs.last.throws.last.darts;
    if (state.dartsMatch is Bobs) {
      var bobs = state.dartsMatch as Bobs;
      return Row(
        children: [
          InputButton(
              whenTapped: () => ref
                  .read(scoringScreenProvider.notifier)
                  .handleEvent(ScoringScreenEvent.throwDart(Dart(
                      dartIndex: darts.length + 1,
                      section:
                          bobs.targetNumbers[state.getTurn(state.dartsMatch)],
                      multiplier: 2))),
              lable: bobs.targetNumbers[state.getTurn(state.dartsMatch)] == 25
                  ? 'Bull'
                  : 'D${bobs.targetNumbers[state.getTurn(state.dartsMatch)]}'),
          InputButton(
              whenTapped: () => ref
                  .read(scoringScreenProvider.notifier)
                  .handleEvent(ScoringScreenEvent.throwDart(Dart(
                      dartIndex: darts.length + 1, section: 0, multiplier: 1))),
              lable: 'Miss')
        ],
      );
    }
    if (state.dartsMatch is ATC) {
      var clock = state.dartsMatch as ATC;
      return Row(
        children: [
          InputButton(
              whenTapped: () => ref
                  .read(scoringScreenProvider.notifier)
                  .handleEvent(ScoringScreenEvent.throwDart(Dart(
                      dartIndex: darts.length + 1,
                      section:
                          clock.targetNumbers[state.getTurn(state.dartsMatch)],
                      multiplier: 1))),
              lable: clock.targetNumbers[state.getTurn(state.dartsMatch)] == 50
                  ? 'Bull'
                  : '${clock.targetNumbers[state.getTurn(state.dartsMatch)]}'),
          if (clock.targetNumbers[state.getTurn(state.dartsMatch)] < 21)
            InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(ScoringScreenEvent.throwDart(Dart(
                        dartIndex: darts.length + 1,
                        section: clock
                            .targetNumbers[state.getTurn(state.dartsMatch)],
                        multiplier: 2))),
                lable:
                    'D${clock.targetNumbers[state.getTurn(state.dartsMatch)]}'),
          if (clock.targetNumbers[state.getTurn(state.dartsMatch)] < 21)
            InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(ScoringScreenEvent.throwDart(Dart(
                        dartIndex: darts.length + 1,
                        section: clock
                            .targetNumbers[state.getTurn(state.dartsMatch)],
                        multiplier: 3))),
                lable:
                    'T${clock.targetNumbers[state.getTurn(state.dartsMatch)]}'),
          InputButton(
              whenTapped: () => ref
                  .read(scoringScreenProvider.notifier)
                  .handleEvent(ScoringScreenEvent.throwDart(Dart(
                      dartIndex: darts.length + 1, section: 0, multiplier: 1))),
              lable: 'Miss')
        ],
      );
    }
    return const Center(
      child: Text('Error', style: TextStyle(color: primaryRed)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buttons();
  }
}
