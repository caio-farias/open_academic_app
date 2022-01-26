import 'package:flutter/material.dart';

import 'logo.dart';

AppBar defaultAppbar(BuildContext context) => AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
        splashRadius: 25,
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );

AppBar noBackAppbar(BuildContext context, String? profilePhoto) => AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: const Center(child: Logo(size: '64')),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(
            iconSize: 35,
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      profilePhoto ??
                          "https://lolitajoias.com.br/wp-content/uploads/2020/09/no-image.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
