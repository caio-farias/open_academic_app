import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/models/search_filter_options.dart';
import 'package:open_academic_app/common/stores/filter_store/filter.store.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'package:open_academic_app/common/utils/enums.dart';
import 'package:open_academic_app/screens/search-page/components/filter/filter_option.dart';

Widget buildDialogForm(BuildContext context) {
  final _filterStore = GetIt.I.get<FilterStore>();
  UserSearchFilterOptions filterOptionFields = _filterStore.getSearchFilter;
  List<Widget> formFields = [];
  filterOptionFields.toMap().forEach((key, value) {
    return formFields.add(
      buildFilterFormField(
        key,
        value.name,
        enums[key] as List<String>,
        value.content,
        key == 'expirienceTime' ? (String label) => 'Até $label anos' : null,
      ),
    );
  });

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: formFields,
  );
}

Widget buildFilterFormField(
    String key, String name, List<String> labels, List<String> content,
    [Function? changeLabelText]) {
  final _filterStore = GetIt.I.get<FilterStore>();

  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        left: 6,
      ),
      child: FilterOption(
        name: name,
        labels: labels,
        updateValue: (String option) {
          if (_filterStore.contains(key, option)) {
            return _filterStore.remove(key, option);
          }
          _filterStore.add(key, option);
        },
        changeLabelText: changeLabelText,
        markedValues: content,
      ),
    ),
  );
}

Widget buildDialogHeader(BuildContext context) {
  return Row(
    children: [
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 120),
        child: Text(
          'Filtros',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: boldMainTextColor,
          ),
        ),
      ),
    ],
  );
}

class FilterFormBody extends StatelessWidget {
  const FilterFormBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        controller: ScrollController(keepScrollOffset: true),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [buildDialogHeader(context), buildDialogForm(context)],
        ),
      ),
    );
  }
}
