import 'package:dartz/dartz.dart';

abstract class Usecase<FunctionReturnType,FunctionParameter> {

 Future<Either<Failure, FunctionReturnType>> execute([FunctionParameter parameter]);

}
class Failure{}
class NoParameter{}

// track order
// profile with address