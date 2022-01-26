import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

class TextFormFieldWithLabel extends StatefulWidget {
  const TextFormFieldWithLabel({Key? key}) : super(key: key);

  @override
  _TextFormFieldWithLabelState createState() => _TextFormFieldWithLabelState();
}

class _TextFormFieldWithLabelState extends State<TextFormFieldWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
