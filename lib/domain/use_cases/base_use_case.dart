import 'package:dartz/dartz.dart';

import '../../app/network_failure/failure.dart';



abstract class BaseUseCase<In,Out>{

  Future<Either<Failure, Out>> execute(In input);
}