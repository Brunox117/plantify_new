import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantify/infrastructure/datasources/isar_local_storage_datasource.dart';
import 'package:plantify/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRespositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDataSource());
});
