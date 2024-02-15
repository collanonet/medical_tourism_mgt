import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import '../../feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'change_language.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Scaffold(
      backgroundColor: context.appTheme.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<AuthModel>(
            builder: (context, model, child) {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin:
                      EdgeInsets.all(context.appTheme.spacing.marginExtraLarge),
                  padding:
                      EdgeInsets.all(context.appTheme.spacing.marginExtraLarge),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    ),
                    color: context.appTheme.secondaryBackgroundColor,
                  ),
                  child: ColumnSeparated(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.appTheme.spacing.marginLarge,
                      );
                    },
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '事業再構築補助金',
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Image.asset(
                        Images.logoTitle,
                        package: 'core_ui',
                      ),
                      Text(
                        '医療渡航支援企業',
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: context.appTheme.primaryColor),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'ID',
                            style: context.textTheme.bodySmall,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginExtraSmall,
                          ),
                          ReactiveTextField(
                            formControlName: 'email',
                            decoration: const InputDecoration(
                              hintText: '入力してください',
                            ),
                            onSubmitted: (value) {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'パスワード',
                            style: context.textTheme.bodySmall,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginExtraSmall,
                          ),
                          ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ReactiveTextField(
                                formControlName: 'password',
                                obscureText: obscureText,
                                decoration: InputDecoration(
                                  hintText: '入力してください',
                                  suffixIcon: IconButton(
                                    color: context.appTheme.primaryColor,
                                    icon: Icon(
                                      obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                  ),
                                ),
                                onSubmitted: (value) =>
                                    onSubmit(formGroup, model),
                              );
                            },
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            context.l10n.labelForgotPassword,
                          ),
                        ),
                      ),
                      const ChangeLanguageWidget(),
                      ReactiveFormConsumer(
                        builder: (context, form, _) {
                          return ElevatedButton(
                            onPressed: model.loginData.loading
                                ? null
                                : () => onSubmit(formGroup, model),
                            child: WithLoadingButton(
                                isLoading: model.loginData.loading,
                                child: Text(context.l10n.actionLogin)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void onSubmit(FormGroup formGroup, AuthModel model) {
    if (formGroup.valid) {
      model
          .logIn(
        formGroup.control('email').value,
        formGroup.control('password').value,
      )
          .catchError((error) {
        snackBarWidget(
          message: error.toString(),
        );
      });
    } else {
      snackBarWidget(
        message: context.l10n.mgsRequireInputLogin,
      );
    }
  }
}
