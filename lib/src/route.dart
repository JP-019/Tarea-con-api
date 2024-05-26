import 'dart:convert';

import 'package:app1/model/give.dart';
import 'package:app1/page/detalles.dart';
import 'package:app1/page/drink.dart';
import 'package:app1/page/home.dart';
import 'package:app1/page/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'list',
          builder: (BuildContext context, GoRouterState state) {
            return const BebidasLink();
          },
        ),
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPage();
          },
        ),
        GoRoute(
          path: 'detalles',
          builder: (context, state) {
            final Map<String, String>? params =
                state.pathParameters as Map<String, String>?;
            if (params != null && params.containsKey('drink')) {
              final give drink = give.fromJson(jsonDecode(params['drink']!));
              return DrinkDetail(drink: drink);
            } else {
              return Container(); // O cualquier otro widget apropiado
            }
          },
        ),
      ],
    ),
  ],
);
