import 'package:fansvideo/fansvideo_app.dart';
import 'package:fansvideo/providers/auth_provider.dart';
import 'package:fansvideo/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  final authRepository = AuthRepository(
    apiClient: AuthApiClient()
  );
  runApp(FansVideoApp(authRepository: authRepository,));
}
