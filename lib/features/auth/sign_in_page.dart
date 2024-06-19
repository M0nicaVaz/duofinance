import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Home page',
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
