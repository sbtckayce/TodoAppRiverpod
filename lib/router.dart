import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'feature/auth/screens/auth_screen.dart';
import 'feature/task_firebase/screens/add_task_firebase_screen.dart';

import 'feature/task_firebase/screens/task_screen_firebase_screen.dart';

import 'feature/task_firebase/screens/update_task_firebase_screen.dart';
import 'feature/task_sqlite/screens/add_task_sqlite_screen.dart';
import 'feature/task_sqlite/screens/task_screen_sqlite_screen.dart';
import 'feature/task_sqlite/screens/update_task_sqlite_screen.dart';

final logoutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
  
});

final logginRoute = RouteMap(routes: {
  '/': (_) => MaterialPage(child: TaskFirebaseScreen()),
  '/add-task-firebase': (_) => MaterialPage(child: AddTaskFirebaseScreen()),
  '/update-task-firebase/:id': (routeData) => MaterialPage(
        child: UpdateTaskFirebaseScreen(id: routeData.pathParameters['id']!),
      ),
});
final sqliteRoute =RouteMap(routes: {
  '/': (_) => MaterialPage(child: TaskSqliteScreen()),
  '/add-task-sqlite': (_) => MaterialPage(child: AddTaskSqliteScreen()),
  '/update-task-sqlite/:id': (routeData) => MaterialPage(
        child: UpdateTaskSqliteScreen(
          id: (routeData.pathParameters['id']!),
        ),
      )
});