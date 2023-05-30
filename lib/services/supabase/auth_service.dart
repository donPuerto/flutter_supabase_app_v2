// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../pages/profile/view_profile_page.dart';
import '../../shared/widgets/custom_snackbar_widget.dart';
import 'client_service.dart';
import 'user_service.dart';

class AuthService {
  Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final AuthResponse res = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final Session? session = res.session;
      if (session != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const ViewProfilePage(),
          ),
        );
      }

      final UserService userService = UserService();
      final userId = await userService.getCurrentUserId();
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackbarWidget(
          message: error.message,
          type: SnackBarType.Error,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackbarWidget(
          message: 'Unexpected error occurred',
          type: SnackBarType.Error,
        ),
      );
    }
  }
}
