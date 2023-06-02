import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import '../../../../services/supabase/auth_service.dart';
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
  late bool _isLoading = false;
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
      body: OrientationLayoutBuilder(
        portrait: (BuildContext context) => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            _buildLayout(),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
        landscape: (BuildContext context) => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(child: _buildLayout()),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayout() {
    AuthService authService = AuthService();

    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CustomTextWidget(
                text: 'Welcome back!',
                textSize: TextSize.headlineMedium,
              )
            ],
          ),
          Row(
            children: const [
              CustomTextWidget(
                text: 'Signin into your account',
              )
            ],
          ),
          Form(
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
                const SizedBox(height: 8.0),
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
                const SizedBox(height: 14.0),
                CustomSubmitButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      await authService.signIn(
                        _emailController.text,
                        _passwordController.text,
                        context,
                      );
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  buttonText: 'Sign In',
                  buttonType: ButtonType.ElevatedButton,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
