import 'package:flutter/material.dart';

class StyledHeading extends StatelessWidget {
  const StyledHeading(this.content, {super.key, this.style});
  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.titleMedium!.merge(
        TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1).merge(style),
      ),
    );
  }
}

class CardHeading extends StatelessWidget {
  const CardHeading(this.content, {super.key, this.style});
  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium!.merge(
        TextStyle(fontWeight: FontWeight.bold).merge(style),
      ),
    );
  }
}

class StyledDisplay extends StatelessWidget {
  const StyledDisplay(this.content, {super.key, this.style});
  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.headlineMedium!.merge(
        TextStyle(fontWeight: FontWeight.bold).merge(style),
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(this.content, {super.key, this.style});
  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(content, style: style);
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.content, {super.key, this.style});
  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium!.merge(
        TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.grey[600],
        ).merge(style),
      ),
    );
  }
}

class StyledScreenTitle extends StatelessWidget {
  const StyledScreenTitle(this.content, {super.key, this.style});
  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content.toUpperCase(),
      style: Theme.of(context).textTheme.labelLarge!.merge(
        TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.grey[700],
        ).merge(style),
      ),
    );
  }
}

class StyledLabel extends StatelessWidget {
  const StyledLabel(this.content, {super.key, this.style});
  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall!.merge(
        TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.grey[700],
        ).merge(style),
      ),
    );
  }
}
