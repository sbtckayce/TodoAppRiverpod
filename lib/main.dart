import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:todo_riverpod/feature/auth/controller/auth_controller.dart';
import 'package:todo_riverpod/provider/connective_provider.dart';
import 'package:todo_riverpod/router.dart';
import 'package:todo_riverpod/shared/widgets/widgets.dart';
import 'package:todo_riverpod/theme/pallete.dart';

import 'db/task_database.dart';

import 'models/user/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TaskDatabase.instance.init();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isConnected = ref.watch(connectivityStatusProviders);

    return isConnected == ConnectivityStatus.isConnected
        ? ref.watch(authStateChangeProvider).when(
              data: (data) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
               
                routerDelegate: RoutemasterDelegate(
                  routesBuilder: (context) {
                    if (data != null) {
                      getData(ref, data);
                      final user = ref.read(userProvider);
                      if (user != null) {
                        return logginRoute;
                      }
                    }
                    return logoutRoute;
                  },
                ),
                routeInformationParser: const RoutemasterParser(),
              ),
              error: (error, stackTrace) => ErrorText(errorText: error),
              loading: () => const LoadingCircle(),
            )
        : MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ref.watch(themeProvider),
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                return sqliteRoute;
              },
            ),
            routeInformationParser: const RoutemasterParser());
   
  }
}
