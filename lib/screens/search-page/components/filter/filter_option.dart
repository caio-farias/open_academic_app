import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/components/checkbox.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

class FilterOption extends StatefulWidget {
  final String name;
  final List<String> labels;
  final Function updateValue;
  final Function? changeLabelText;
  final List<String> markedValues;
  const FilterOption({
    Key? key,
    required this.name,
    required this.labels,
    this.changeLabelText,
    required this.updateValue,
    required this.markedValues,
  }) : super(key: key);

  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 10),
          child: Text(
            widget.name,
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: boldMainTextColor,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => CheckboxField(
                    alreadyMarked:
                        widget.markedValues.contains(widget.labels[index]),
                    name: widget.changeLabelText != null
                        ? widget
                            .changeLabelText!(widget.labels[index].toString())
                        : widget.labels[index],
                    updateFilterValues: () =>
                        widget.updateValue(widget.labels[index]),
                  ),
              separatorBuilder: (BuildContext context, int index) =>
                  const VerticalDivider(
                    width: 100,
                  ),
              itemCount: widget.labels.length),
        )
      ],
    );
  }
}
