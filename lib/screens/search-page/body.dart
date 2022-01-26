import 'package:flutter/material.dart';
import 'package:open_academic_app/common/components/loading.dart';
import 'package:open_academic_app/common/models/user.dart';
import 'package:open_academic_app/common/repositories/users_repo.dart';
import 'package:open_academic_app/common/ui_config/colors.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String query = '';
  String label = 'Busque por pessoas';
  late UsersRepository _usersRepository;
  bool isLoading = true;
  @override
  void initState() {
    _usersRepository = UsersRepository();
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: _usersRepository.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Loading(
              width: 100,
              height: 100,
              color: Colors.blue,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('ERROR'),
            );
          }
          final users = snapshot.data;
          return buildList(users!);
        });
  }

  Widget buildList(List<User> users) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
          },
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (context, index) =>
              buildUserCard(context, users[index])),
    );
  }
}

Widget buildUserCard(BuildContext context, User user) {
  return Container(
    decoration: const BoxDecoration(
      color: mainPurple,
    ),
    constraints: const BoxConstraints(
        maxWidth: 300, maxHeight: 150, minWidth: 300, minHeight: 150),
    child: buildUserCardBody(context, user),
  );
}

Widget buildUserCardBody(BuildContext context, User user) {
  String? firstName = user.firstName;
  String? lastName = user.lastName;
  num? prodCount = user.productionsCount;
  String? grad = user.qualifications!.education!.gradDegrees!.isNotEmpty
      ? user.qualifications!.education!.gradDegrees![0].degreeSubject
      : '';

  String? gradUni = user.qualifications!.education!.gradDegrees!.isNotEmpty
      ? user.qualifications!.education!.gradDegrees![0].university
      : '';

  String? msc = user.qualifications!.education!.gradDegrees!.isNotEmpty
      ? user.qualifications!.education!.masterDegress![0].degreeSubject
      : '';
  String? mscUni = user.qualifications!.education!.gradDegrees!.isNotEmpty
      ? user.qualifications!.education!.masterDegress![0].university
      : '';

  return Padding(
    padding: const EdgeInsets.only(top: 14.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 100,
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: NetworkImage(
                      user.profilePhoto == null
                          ? "https://lolitajoias.com.br/wp-content/uploads/2020/09/no-image.jpg"
                          : user.profilePhoto!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '$prodCount',
                style: TextStyle(
                  fontStyle: Theme.of(context).textTheme.bodyText1!.fontStyle,
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'produções',
                style: TextStyle(
                  fontStyle: Theme.of(context).textTheme.bodyText1!.fontStyle,
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w100,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    firstName! + ' ' + lastName!,
                    style: TextStyle(
                      fontStyle:
                          Theme.of(context).textTheme.bodyText1!.fontStyle,
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Formação',
                style: TextStyle(
                  fontStyle: Theme.of(context).textTheme.bodyText1!.fontStyle,
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text('Bacharel em $grad - $gradUni',
                  style: TextStyle(
                    fontStyle: Theme.of(context).textTheme.bodyText1!.fontStyle,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(
                height: 1,
              ),
              const SizedBox(
                height: 1,
              ),
              Text('Mestre em $msc - $mscUni ',
                  style: TextStyle(
                    fontStyle: Theme.of(context).textTheme.bodyText1!.fontStyle,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
