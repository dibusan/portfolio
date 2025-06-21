import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/resume_generator/widgets/job_selector.dart';
import 'package:portfolio_eriel/app/presentation/resume_generator/widgets/resume_generator_header.dart';
import 'package:portfolio_eriel/data/service/claude/claude_service.dart';
import '../bloc/resume_generator_bloc.dart';
import '../widgets/tech_stack_selector.dart';
import '../widgets/job_description_input.dart';
import '../widgets/generated_resume_viewer.dart';

class ResumeGeneratorPage extends StatefulWidget {
  const ResumeGeneratorPage({
    super.key,
  });

  @override
  State<ResumeGeneratorPage> createState() => _ResumeGeneratorPageState();
}

class _ResumeGeneratorPageState extends State<ResumeGeneratorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _additionalContextController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _additionalContextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, stateProjects) {
        if (stateProjects.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return BlocProvider(
          create: (context) => ResumeGeneratorBloc(
            claudeService: ClaudeService(),
          )..add(InitializeTechStack(stateProjects.projects)),
          child: BlocConsumer<ResumeGeneratorBloc, ResumeGeneratorState>(
            listener: (context, state) {
              if (state is ResumeCopiedToClipboard) {
                Clipboard.setData(ClipboardData(text: state.generatedResume!));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Resume copied to clipboard!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 16,
                          children: [
                            ResumeGeneratorHeader(
                                tabController: _tabController),
                            Expanded(child: _buildBody(context, state))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 16,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: _buildGenerateButton(context, state),
                            ),
                            Expanded(
                                flex: 6,
                                child: GeneratedResumeViewer(
                                  resume: state.generatedResume,
                                  onCopy: () => context
                                      .read<ResumeGeneratorBloc>()
                                      .add(CopyResumeToClipboard()),
                                  onDownload: (markdown) => context
                                      .read<ResumeGeneratorBloc>()
                                      .add(DownloadResumeAsPdf(markdown)),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ResumeGeneratorState state) {
    if (state is ResumeGeneratorInitial) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is ResumeGeneratorLoaded || state is ResumeCopiedToClipboard) {
      return Column(
        spacing: 16,
        children: [
          JobSelector(
            jobs: state.jobs,
            selectedJobs: state.selectedJobs,
            onTagToggled: (job) =>
                context.read<ResumeGeneratorBloc>().add(ToggleJob(job)),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TechStackSelector(
                  techCategories: state.techCategories,
                  selectedTags: state.selectedTechTags,
                  onTagToggled: (tag) => context
                      .read<ResumeGeneratorBloc>()
                      .add(ToggleTechTag(tag)),
                  onClearAll: () => context
                      .read<ResumeGeneratorBloc>()
                      .add(ClearSelectedTags()),
                ),
                JobDescriptionInput(
                  jobDescription: state.jobDescription,
                  onChanged: (text) => context
                      .read<ResumeGeneratorBloc>()
                      .add(UpdateJobDescription(text)),
                ),
              ],
            ),
          ),
          _buildAdditionalContext(context, state),
          if (state.errorMessage != null)
            _buildErrorMessage(state.errorMessage!),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildAdditionalContext(
      BuildContext context, ResumeGeneratorState state) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.add_circle_outline, color: Colors.grey.shade700),
              const SizedBox(width: 8),
              const Text(
                'Additional Context',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '(Optional)',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _additionalContextController,
            onChanged: (text) => context
                .read<ResumeGeneratorBloc>()
                .add(UpdateAdditionalContext(text)),
            decoration: InputDecoration(
              hintText: 'E.g., "5+ years experience, seeking senior roles, '
                  'specialized in mobile development"',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            maxLines: 4,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenerateButton(
      BuildContext context, ResumeGeneratorState state) {
    final currentTabIndex = _tabController.index;
    final canGenerate = currentTabIndex == 0
        ? state.selectedTechTags.isNotEmpty
        : state.jobDescription.trim().isNotEmpty;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 40,
      width: 300,
      decoration: BoxDecoration(
        gradient: canGenerate
            ? const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: state.isLoading || !canGenerate
            ? null
            : () {
                if (currentTabIndex == 0) {
                  context
                      .read<ResumeGeneratorBloc>()
                      .add(GenerateResumeFromTechStack());
                } else {
                  context
                      .read<ResumeGeneratorBloc>()
                      .add(GenerateResumeFromJobDescription());
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: state.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    currentTabIndex == 0
                        ? Icons.auto_awesome
                        : Icons.psychology,
                    size: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    currentTabIndex == 0
                        ? 'Generate Resume'
                        : 'Generate Tailored Resume',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
