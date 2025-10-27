import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:x_twitter_clone/features/auth/data/datasources/session_local_datasource.dart';
import 'package:x_twitter_clone/features/auth/data/repository/fake_auth_repository.dart';
import 'package:x_twitter_clone/features/auth/domain/services/user_session_service.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/login_use_case.dart';
import 'package:x_twitter_clone/features/auth/domain/usecases/register_use_case.dart';
import 'package:x_twitter_clone/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:x_twitter_clone/features/auth/presentation/login/pages/login_page.dart';
import 'package:x_twitter_clone/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:x_twitter_clone/features/auth/presentation/register/pages/register_page.dart';
import 'package:x_twitter_clone/features/splash/presentation/pages/splash_page.dart';
import 'package:x_twitter_clone/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    final SessionLocalDatasource sessionLocalDatasource =
        SessionLocalDatasourceImpl(secureStorage: secureStorage);
    final UserSessionService userSessionService = UserSessionService(
      sessionLocalDatasource: sessionLocalDatasource,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RegisterBloc(
            registerUseCase: RegisterUseCase(
              authRepository: FakeAuthRepository(),
            ),
            userSessionService: userSessionService,
          ),
        ),

        BlocProvider(
          create: (context) => LoginBloc(
            loginUseCase: LoginUseCase(authRepository: FakeAuthRepository()),
            userSessionService: userSessionService,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'X (Twitter) Clone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // initialRoute: '/login',
        home: SplashPage(userSessionService: userSessionService),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
