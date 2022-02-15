import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_academic_app/common/components/full_screen_dialog.dart';
import 'package:open_academic_app/common/repositories/users_repo.dart';
import 'package:open_academic_app/common/stores/filter_store/filter.store.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';
import 'components/filter/filter_form_body.dart';
import 'components/search_result/search_result.dart';

Widget buildSearchPlaceholder(BuildContext context) {
  return SvgPicture.asset('assets/icons/woman-and-laptop.svg');
}

Future<void> showFilterForm(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
    builder: (BuildContext context) => const SafeArea(
      child: FullScreenDialogDemo(
        body: FilterFormBody(),
      ),
    ),
  );
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _seachValueController = TextEditingController();
  final _filterStore = GetIt.I.get<FilterStore>();
  late UsersRepository _usersRepository;
  late Duration duration;
  static String _searchValue = '';
  final String label = 'Busque aqui..';

  @override
  void initState() {
    _usersRepository = UsersRepository();
    _seachValueController.addListener(() {});
    super.initState();
  }

  void _attemptSearch() {
    setState(() {
      _searchValue = _seachValueController.value.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              controller: _seachValueController,
              autocorrect: true,
              maxLines: 1,
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: secTextColor,
              ),
              decoration: InputDecoration(
                hintText: 'Busque aqui..',
                hintStyle: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: secTextColor,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: const UnderlineInputBorder(),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => _attemptSearch(),
                        icon: const Icon(Icons.search_outlined)),
                    IconButton(
                      onPressed: () => showFilterForm(context),
                      color: secTextColor,
                      icon: const Icon(
                        Icons.filter_list,
                      ),
                    )
                  ],
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Observer(
            builder: (_) => Center(
              child: _searchValue.isEmpty && _filterStore.getIsEmpty
                  ? buildSearchPlaceholder(context)
                  : buildSearchResult(
                      context, _usersRepository.getUsers(_searchValue)),
            ),
          ),
        ],
      ),
    );
  }
}
