import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/bloc/security/security_bloc.dart';
import 'package:portfolio_eriel/app/navigator.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/small_banding_banner.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityBloc, SecurityState>(
      builder: (_, state) => _SecurityPage(
        bloc: BlocProvider.of<SecurityBloc>(context),
        state: state,
      ),
    );
  }
}

class _SecurityPage extends StatelessWidget {
  final SecurityBloc bloc;
  final SecurityState state;

  _SecurityPage({super.key, required this.bloc, required this.state});

  final TextEditingController controller = TextEditingController(text: '');

  _submit(value, {Developer? developer}) {
    if (developer == null) return;
    bloc.add(SecurityCheckPasswordEvent(password: value, developer: developer));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SecurityBloc, SecurityState>(
      listener: (context, state) {
        if (state.isAuth) {
          context.goNamed(AppRoute.home.name);
        }
      },
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, projectState) {
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: GlassContainer.clearGlass(
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    width: 350,
                    height: 500,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Form(
                        key: bloc.formKey,
                        child: Column(
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,
                              leading: BackButton(
                                onPressed: () => context.goNamed(AppRoute.home.name),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                                child: SmallBrandingBanner(developer: projectState.developer),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Center(
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: controller,
                                    onFieldSubmitted: state.loading ? null : (value) => _submit(value, developer: projectState.developer),
                                    onSaved: state.loading ? null : (value) => _submit(value, developer: projectState.developer),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                      floatingActionButton: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: state.loading
                                ? null
                                : () {
                                    if (bloc.formKey.currentState?.validate() ?? false) {
                                      _submit(controller.text, developer: projectState.developer);
                                    }
                                  },
                            child: const Text("Check Admin Password"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LinearProgressIndicator(
                            value: state.loading ? null : 0,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
