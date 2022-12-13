import 'package:equatable/equatable.dart';

abstract class BaseEntity<T> with EquatableMixin {
  T toModel();
}
