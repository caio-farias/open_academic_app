import 'package:flutter/material.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

class CheckboxField extends StatefulWidget {
  final String name;
  final VoidCallback updateFilterValues;
  final bool? alreadyMarked;
  const CheckboxField({
    Key? key,
    required this.name,
    required this.updateFilterValues,
    this.alreadyMarked,
  }) : super(key: key);

  @override
  State<CheckboxField> createState() => _CheckboxStateField();
}

class _CheckboxStateField extends State<CheckboxField> {
  late bool? checkBoxValue;
  late final String name;

  @override
  void initState() {
    checkBoxValue = widget.alreadyMarked ?? false;
    name = widget.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;
    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
    return Theme(
      data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
      child: CheckboxListTile(
        selected: checkBoxValue!,
        contentPadding: EdgeInsets.zero,
        title: Transform.translate(
          offset: const Offset(-15, 0),
          child: Text(
            name,
            textAlign: TextAlign.start,
            style: !checkBoxValue!
                ? Theme.of(context).textTheme.bodyText2
                : TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                    color: mainPurple),
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: mainPurple,
        checkColor: Colors.transparent,
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        value: checkBoxValue,
        onChanged: (bool? value) {
          setState(() {
            checkBoxValue = value!;
            widget.updateFilterValues();
          });
        },
      ),
    );
  }
}
