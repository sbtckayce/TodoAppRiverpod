import 'package:fpdart/fpdart.dart';

import 'failue.dart';

typedef FutureEither<T> = Future<Either<Failue, T>>;
typedef FutureVoid = FutureEither<void>;
typedef FutureInt = FutureEither<int>;
