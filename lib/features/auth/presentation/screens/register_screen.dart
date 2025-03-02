// import 'package:flutter/material.dart';
// import 'package:project_zero/core/constants/app_colors.dart';
// import 'package:project_zero/core/constants/assets.dart';
// import 'package:project_zero/core/utils/validators.dart';
// import 'login_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;

//   final _nameFocus = FocusNode();
//   final _emailFocus = FocusNode();
//   final _passwordFocus = FocusNode();
//   final _confirmPasswordFocus = FocusNode();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return SingleChildScrollView(
//               physics: const ClampingScrollPhysics(),
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Form(
//                   key: _formKey,
//                   autovalidateMode: AutovalidateMode.disabled,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 30),
//                       Image.asset(Assets.logoBlue, width: 90),
//                       const SizedBox(height: 15),
//                       const Text(
//                         "Let's get started",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.textPrimary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         "Create a new account",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: AppColors.textSecondary,
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       // Full Name Field
//                       TextFormField(
//                         controller: _nameController,
//                         focusNode: _nameFocus,
//                         textInputAction: TextInputAction.next,
//                         validator:
//                             (value) =>
//                                 value == null || value.isEmpty
//                                     ? 'Please enter your full name'
//                                     : value.length < 3
//                                     ? 'Name must be at least 3 characters'
//                                     : null,
//                         onFieldSubmitted: (_) => _emailFocus.requestFocus(),
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(
//                             Icons.person_outline,
//                             size: 20,
//                             color: AppColors.textSecondary,
//                           ),
//                           hintText: 'Full Name',
//                           hintStyle: const TextStyle(color: AppColors.textHint),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide: const BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),

//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color:
//                                   AppColors.primary, // Blue border when focused
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for errors
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for focused errors
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 14,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Email Field
//                       TextFormField(
//                         controller: _emailController,
//                         focusNode: _emailFocus,
//                         keyboardType: TextInputType.emailAddress,
//                         textInputAction: TextInputAction.next,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!Validators.isValidEmail(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                         onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(
//                             Icons.email_outlined,
//                             size: 20,
//                             color: AppColors.textSecondary,
//                           ),
//                           hintText: 'Email',
//                           hintStyle: const TextStyle(color: AppColors.textHint),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide: const BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color:
//                                   AppColors.primary, // Blue border when focused
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for errors
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for focused errors
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 14,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Password Field
//                       TextFormField(
//                         controller: _passwordController,
//                         focusNode: _passwordFocus,
//                         textInputAction: TextInputAction.next,
//                         validator:
//                             (value) => Validators.validatePassword(value),
//                         onFieldSubmitted:
//                             (_) => _confirmPasswordFocus.requestFocus(),
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscurePassword
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//                               size: 20,
//                               color: AppColors.textSecondary,
//                             ),
//                             onPressed:
//                                 () => setState(() {
//                                   _obscurePassword = !_obscurePassword;
//                                 }),
//                           ),
//                           prefixIcon: const Icon(
//                             Icons.lock_outlined,
//                             size: 20,
//                             color: AppColors.textSecondary,
//                           ),
//                           hintText: 'Password',
//                           hintStyle: const TextStyle(color: AppColors.textHint),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide: const BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color:
//                                   AppColors.primary, // Blue border when focused
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for errors
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for focused errors
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 14,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Confirm Password Field
//                       TextFormField(
//                         controller: _confirmPasswordController,
//                         focusNode: _confirmPasswordFocus,
//                         textInputAction: TextInputAction.done,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please confirm your password';
//                           }
//                           if (value != _passwordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                         onFieldSubmitted: (_) => _submitForm(),
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscureConfirmPassword
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//                               size: 20,
//                               color: AppColors.textSecondary,
//                             ),
//                             onPressed:
//                                 () => setState(() {
//                                   _obscureConfirmPassword =
//                                       !_obscureConfirmPassword;
//                                 }),
//                           ),
//                           prefixIcon: const Icon(
//                             Icons.lock_outlined,
//                             size: 20,
//                             color: AppColors.textSecondary,
//                           ),
//                           hintText: 'Confirm Password',
//                           hintStyle: const TextStyle(color: AppColors.textHint),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide: const BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.border,
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color:
//                                   AppColors.primary, // Blue border when focused
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for errors
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red, // Red for focused errors
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 14,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       // Sign Up Button
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           boxShadow: [
//                             BoxShadow(
//                               color: AppColors.primary.withOpacity(0.2),
//                               blurRadius: 6,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primary,
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             minimumSize: const Size(double.infinity, 46),
//                           ),
//                           onPressed: () {
//                             final isValid = _formKey.currentState!.validate();
//                             if (isValid) {
//                               _submitForm();
//                             } else {
//                               // Enable validation after first failed attempt
//                               setState(() {
//                                 _formKey.currentState!.validate();
//                               });
//                             }
//                           },
//                           child: const Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       // Already have account
//                       TextButton(
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           minimumSize: Size.zero,
//                           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             PageRouteBuilder(
//                               transitionDuration: const Duration(
//                                 milliseconds: 500,
//                               ), // Match duration
//                               reverseTransitionDuration: const Duration(
//                                 milliseconds: 500,
//                               ),
//                               pageBuilder:
//                                   (context, animation, secondaryAnimation) =>
//                                       const LoginScreen(),
//                               transitionsBuilder: (
//                                 context,
//                                 animation,
//                                 secondaryAnimation,
//                                 child,
//                               ) {
//                                 const begin = Offset(-1.0, 0.0);
//                                 const end = Offset.zero;
//                                 const curve = Curves.easeInOutCubic;

//                                 var tween = Tween(
//                                   begin: begin,
//                                   end: end,
//                                 ).chain(CurveTween(curve: curve));
//                                 var offsetAnimation = animation.drive(tween);

//                                 return SlideTransition(
//                                   position: offsetAnimation,
//                                   child: child,
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: RichText(
//                           text: const TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Already have an account? ",
//                                 style: TextStyle(
//                                   color: AppColors.textSecondary,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Sign In',
//                                 style: TextStyle(
//                                   color: AppColors.linkText,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // If valid, proceed with registration
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Processing Data')));
//       // TODO: Add registration logic
//     }
//   }
// }




import 'package:flutter/material.dart';
import 'package:project_zero/core/constants/app_colors.dart';
import 'package:project_zero/core/constants/assets.dart';
import 'package:project_zero/core/utils/validators.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _showValidationErrors = false;

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Color _getIconColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.error)) {
      return Colors.red;
    }
    if (states.contains(MaterialState.focused)) {
      return AppColors.primary;
    }
    return AppColors.textSecondary;
  }

  InputDecoration _buildDecoration({
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
    bool showError = false,
  }) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon, size: 20),
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColors.textHint),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      prefixIconColor: MaterialStateColor.resolveWith(_getIconColor),
      suffixIconColor: MaterialStateColor.resolveWith(_getIconColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: AppColors.border, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(6),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
        borderRadius: BorderRadius.circular(6),
      ),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: _showValidationErrors ? 12 : 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: _showValidationErrors 
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Image.asset(Assets.logoBlue, width: 90),
                        const SizedBox(height: 15),
                        const Text(
                          "Let's get started",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Create a new account",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Full Name Field
                        TextFormField(
                          controller: _nameController,
                          focusNode: _nameFocus,
                          textInputAction: TextInputAction.next,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your full name'
                              : value.length < 3
                                  ? 'Name must be at least 3 characters'
                                  : null,
                          onFieldSubmitted: (_) => _emailFocus.requestFocus(),
                          decoration: _buildDecoration(
                            hintText: 'Full Name',
                            prefixIcon: Icons.person_outline,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!Validators.isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
                          decoration: _buildDecoration(
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          obscureText: _obscurePassword,
                          textInputAction: TextInputAction.next,
                          validator: (value) => Validators.validatePassword(value),
                          onFieldSubmitted: (_) => _confirmPasswordFocus.requestFocus(),
                          decoration: _buildDecoration(
                            hintText: 'Password',
                            prefixIcon: Icons.lock_outlined,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword 
                                    ? Icons.visibility_off 
                                    : Icons.visibility,
                                size: 20,
                              ),
                              onPressed: () => setState(() {
                                _obscurePassword = !_obscurePassword;
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Confirm Password Field
                        TextFormField(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocus,
                          obscureText: _obscureConfirmPassword,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) => _submitForm(),
                          decoration: _buildDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: Icons.lock_outlined,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword 
                                    ? Icons.visibility_off 
                                    : Icons.visibility,
                                size: 20,
                              ),
                              onPressed: () => setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Sign Up Button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              minimumSize: const Size(double.infinity, 46),
                            ),
                            onPressed: () {
                              final isValid = _formKey.currentState!.validate();
                              setState(() => _showValidationErrors = !isValid);
                              if (isValid) _submitForm();
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Already have account
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) => const LoginScreen(),
                              transitionsBuilder: (_, animation, __, child) {
                                return SlideTransition(
                                  position: animation.drive(Tween<Offset>(
                                    begin: const Offset(-1, 0),
                                    end: Offset.zero,
                                  ).chain(CurveTween(curve: Curves.easeInOutCubic))),
                                  child: child,
                                );
                              },
                            ),
                          ),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 13,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                    color: AppColors.linkText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _submitForm() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
    // TODO: Add registration logic
  }
}