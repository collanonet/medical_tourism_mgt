import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primaryColor,
      body: Consumer<AuthModel>(
        builder: (context, model, child) {
          if(model.loginData.data != null){
            model.syncAuthState();
            logger.d('auth here');
          }
          return ReactiveFormConfig(
              validationMessages: validationMessagesLogin(context),
              child: ReactiveFormBuilder(
                form: () => formLogin(),
                builder: (context, formGroup, child) {
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: EdgeInsets.all(
                          context.appTheme.spacing.marginExtraLarge),
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
                          Image.asset(
                            Images.logoTitle,
                            package: 'core_ui',
                          ),
                          Text(
                            context.l10n.titleAppJP,
                            style: context.textTheme.headlineLarge?.copyWith(
                                color: context.appTheme.primaryColor),
                          ),
                          ReactiveTextFormField(
                            formControlName: 'email',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelId,
                              ),
                              hintText:
                                  context.l10n.labelPleaseEnterYourInformation,
                            ),
                            onSubmitted: (value) {
                              setState(() {});
                            },
                          ),
                          ReactiveTextFormField(
                            formControlName: 'password',
                            obscureText: true,
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPassword,
                              ),
                              hintText:
                                  context.l10n.labelPleaseEnterYourInformation,
                            ),
                            onSubmitted: (value) {
                              setState(() {});
                            },
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
                          FilledButton(
                            onPressed: model.loginData.loading
                                ? null
                                : () {
                                    if (formGroup.valid) {
                                      model.logIn(
                                        formGroup.control('email').value,
                                        formGroup.control('password').value,
                                      );
                                    } else {
                                      snackBarWidget(
                                        context: context,
                                        mgs: context.l10n.mgsRequireInputLogin,
                                      );
                                    }
                                  },
                            child: model.loginData.loading
                                ? const CircularProgressIndicator()
                                : Text(context.l10n.actionLogin),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
