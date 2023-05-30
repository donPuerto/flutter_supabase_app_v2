import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import '../../../../shared/utils/validators.dart';
import '../../../../shared/widgets/custom_checkbox_widget.dart';
import '../../../../shared/widgets/custom_link_label_widget.dart';
import '../../../../shared/widgets/custom_password_textfield_widget.dart';
import '../../../../shared/widgets/custom_submit_button.dart';
import '../../../../shared/widgets/custom_text_widget.dart';
import '../../../../shared/widgets/custom_textfield_widget.dart';
import '../../forgot_password_page.dart';
import '../widgets/remember_forgot_widget.dart';

class MobileTypeLayoutSignInScreen extends StatefulWidget {
  const MobileTypeLayoutSignInScreen({Key? key}) : super(key: key);

  @override
  State<MobileTypeLayoutSignInScreen> createState() =>
      _MobileTypeLayoutSignInScreenState();
}

class _MobileTypeLayoutSignInScreenState
    extends State<MobileTypeLayoutSignInScreen> {
  bool _isLoading = false;
  bool _obscureTextPassword = true;
  bool _rememberMe = false;
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Toggles the password show status
  void _togglePassword() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile type layout on Sign In Screen'),
      ),
      body: OrientationLayoutBuilder(
        portrait: (BuildContext context) => _buildPortraitLayout(),
        landscape: (BuildContext context) => _buildLandscapeLayout(),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            CustomTextFieldWidget(
              key: const Key('email'),
              controller: _emailController,
              labelText: 'Email Address',
              hintText: 'Enter your email',
              validator: (value) => emailError(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 8.0),
            CustomPasswordTextFieldWidget(
              key: const Key('password'),
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: _obscureTextPassword,
              validator: validatePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              togglePasswordVisibility: _togglePassword,
            ),
            const SizedBox(height: 6.0),
            RememberMeForgotPasswordWidget(
              leftWidget: Row(
                children: [
                  CustomCheckboxWidget(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(width: 2.0),
                  const CustomTextWidget(
                    text: 'Remember Me',
                  ),
                ],
              ),
              rightWidget: const CustomLinkLabelWidget(
                page: ForgotPasswordPage(),
                text: "Forgot Password?",
              ),
            ),
            const SizedBox(height: 8.0),
            CustomSubmitButton(
              submitFunction: (BuildContext context) async {
                // Call your sign-in function or perform the sign-in operation here
                //await authService.signIn(_email, _password, context);
              },
              buttonText: 'Sign In',
              buttonType: ButtonType.ElevatedButton,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFieldWidget(
              key: const Key('email'),
              controller: _emailController,
              labelText: 'Email Address',
              hintText: 'Enter your email',
              validator: (value) => emailError(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 15.0),
            CustomPasswordTextFieldWidget(
              key: const Key('password'),
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: _obscureTextPassword,
              validator: validatePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              togglePasswordVisibility: _togglePassword,
            ),
          ],
        ),
      ),
    );
  }
}
