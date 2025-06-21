import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:portfolio_eriel/data/service/claude/claude_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';

abstract class ResumeGeneratorEvent {
  const ResumeGeneratorEvent();

  List<Object?> get props => [];
}

class InitializeTechStack extends ResumeGeneratorEvent {
  final List<Project> projects;

  const InitializeTechStack(this.projects);

  @override
  List<Object?> get props => [projects];
}

class ToggleTechTag extends ResumeGeneratorEvent {
  final String tag;

  const ToggleTechTag(this.tag);

  @override
  List<Object?> get props => [tag];
}

class ToggleJob extends ResumeGeneratorEvent {
  final Project project;

  const ToggleJob(this.project);

  @override
  List<Object?> get props => [project];
}

class ClearSelectedTags extends ResumeGeneratorEvent {}

class UpdateJobDescription extends ResumeGeneratorEvent {
  final String description;

  const UpdateJobDescription(this.description);

  @override
  List<Object?> get props => [description];
}

class UpdateAdditionalContext extends ResumeGeneratorEvent {
  final String context;

  const UpdateAdditionalContext(this.context);

  @override
  List<Object?> get props => [context];
}

class GenerateResumeFromTechStack extends ResumeGeneratorEvent {}

class GenerateResumeFromJobDescription extends ResumeGeneratorEvent {}

class CopyResumeToClipboard extends ResumeGeneratorEvent {}

class DownloadResumeAsPdf extends ResumeGeneratorEvent {
  final String markdown;

  const DownloadResumeAsPdf(this.markdown);

  @override
  List<Object?> get props => [markdown];
}

// States
abstract class ResumeGeneratorState {
  final Map<String, List<String>> techCategories;
  final Set<String> selectedTechTags;
  final List<Project> jobs;
  final List<Project> selectedJobs;
  final String jobDescription;
  final String additionalContext;
  final String? generatedResume;
  final String? errorMessage;
  final bool isLoading;

  const ResumeGeneratorState({
    this.techCategories = const {},
    this.jobs = const [],
    this.selectedTechTags = const {},
    this.selectedJobs = const [],
    this.jobDescription = '',
    this.additionalContext = '',
    this.generatedResume,
    this.errorMessage,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        jobs,
        techCategories,
        selectedTechTags,
        selectedJobs,
        jobDescription,
        additionalContext,
        generatedResume,
        errorMessage,
        isLoading,
      ];
}

class ResumeGeneratorInitial extends ResumeGeneratorState {}

class ResumeGeneratorLoaded extends ResumeGeneratorState {
  const ResumeGeneratorLoaded({
    required super.jobs,
    required super.techCategories,
    super.selectedTechTags,
    super.selectedJobs,
    super.jobDescription,
    super.additionalContext,
    super.generatedResume,
    super.errorMessage,
    super.isLoading,
  });

  ResumeGeneratorLoaded copyWith({
    List<Project>? jobs,
    Map<String, List<String>>? techCategories,
    Set<String>? selectedTechTags,
    List<Project>? selectedJobs,
    String? jobDescription,
    String? additionalContext,
    String? generatedResume,
    String? errorMessage,
    bool? isLoading,
  }) {
    return ResumeGeneratorLoaded(
      jobs: jobs ?? this.jobs,
      techCategories: techCategories ?? this.techCategories,
      selectedTechTags: selectedTechTags ?? this.selectedTechTags,
      selectedJobs: selectedJobs ?? this.selectedJobs,
      jobDescription: jobDescription ?? this.jobDescription,
      additionalContext: additionalContext ?? this.additionalContext,
      generatedResume: generatedResume ?? this.generatedResume,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ResumeCopiedToClipboard extends ResumeGeneratorState {
  const ResumeCopiedToClipboard({
    required super.techCategories,
    required super.selectedTechTags,
    required super.jobDescription,
    required super.additionalContext,
    required super.generatedResume,
  });
}

// BLoC
class ResumeGeneratorBloc
    extends Bloc<ResumeGeneratorEvent, ResumeGeneratorState> {
  final ClaudeService _claudeService;

  ResumeGeneratorBloc({
    required ClaudeService claudeService,
  })  : _claudeService = claudeService,
        super(ResumeGeneratorInitial()) {
    on<InitializeTechStack>(_onInitialize);
    on<ToggleTechTag>(_onToggleTechTag);
    on<ToggleJob>(_onToggleJob);
    on<ClearSelectedTags>(_onClearSelectedTags);
    on<UpdateJobDescription>(_onUpdateJobDescription);
    on<UpdateAdditionalContext>(_onUpdateAdditionalContext);
    on<GenerateResumeFromTechStack>(_onGenerateResumeFromTechStack);
    on<GenerateResumeFromJobDescription>(_onGenerateResumeFromJobDescription);
    on<CopyResumeToClipboard>(_onCopyResumeToClipboard);
    on<DownloadResumeAsPdf>(_onDownloadResumeAsPdf);
  }

  void _onInitialize(
    InitializeTechStack event,
    Emitter<ResumeGeneratorState> emit,
  ) {
    final techCategories = _categorizeTechTags(event.projects);

    emit(ResumeGeneratorLoaded(
      jobs: event.projects,
      selectedJobs: event.projects,
      techCategories: techCategories,
    ));
  }

  void _onToggleTechTag(
    ToggleTechTag event,
    Emitter<ResumeGeneratorState> emit,
  ) {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;
      final updatedTags = Set<String>.from(currentState.selectedTechTags);

      if (updatedTags.contains(event.tag)) {
        updatedTags.remove(event.tag);
      } else {
        updatedTags.add(event.tag);
      }

      emit(currentState.copyWith(
        selectedTechTags: updatedTags,
        errorMessage: null,
      ));
    }
  }

  void _onToggleJob(
    ToggleJob event,
    Emitter<ResumeGeneratorState> emit,
  ) {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;
      final updatedJobs = List<Project>.from(currentState.selectedJobs);

      if (updatedJobs.contains(event.project)) {
        updatedJobs.remove(event.project);
      } else {
        updatedJobs.add(event.project);
      }

      emit(currentState.copyWith(
        selectedJobs: updatedJobs,
        errorMessage: null,
      ));
    }
  }

  void _onClearSelectedTags(
    ClearSelectedTags event,
    Emitter<ResumeGeneratorState> emit,
  ) {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;
      emit(currentState.copyWith(
        selectedTechTags: {},
        errorMessage: null,
      ));
    }
  }

  void _onUpdateJobDescription(
    UpdateJobDescription event,
    Emitter<ResumeGeneratorState> emit,
  ) {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;
      emit(currentState.copyWith(
        jobDescription: event.description,
        errorMessage: null,
      ));
    }
  }

  void _onUpdateAdditionalContext(
    UpdateAdditionalContext event,
    Emitter<ResumeGeneratorState> emit,
  ) {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;
      emit(currentState.copyWith(
        additionalContext: event.context,
      ));
    }
  }

  Future<void> _onGenerateResumeFromTechStack(
    GenerateResumeFromTechStack event,
    Emitter<ResumeGeneratorState> emit,
  ) async {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;

      if (currentState.selectedJobs.isEmpty) {
        emit(currentState.copyWith(
          errorMessage: 'Please select at least one jobs',
        ));
        return;
      }
      if (currentState.selectedTechTags.isEmpty) {
        emit(currentState.copyWith(
          errorMessage: 'Please select at least one technology to focus on',
        ));
        return;
      }

      emit(currentState.copyWith(isLoading: true, errorMessage: null));

      try {
        final resume = await _claudeService.generateResumeContent(
          projects: state.selectedJobs,
          focusedTechStack: currentState.selectedTechTags.toList(),
          additionalContext: currentState.additionalContext.isNotEmpty
              ? currentState.additionalContext
              : null,
        );

        emit(currentState.copyWith(
          generatedResume: resume,
          isLoading: false,
        ));
      } catch (e) {
        emit(currentState.copyWith(
          errorMessage: 'Failed to generate resume. Please try again.',
          isLoading: false,
        ));
      }
    }
  }

  Future<void> _onGenerateResumeFromJobDescription(
    GenerateResumeFromJobDescription event,
    Emitter<ResumeGeneratorState> emit,
  ) async {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;

      if (currentState.jobDescription.trim().isEmpty) {
        emit(currentState.copyWith(
          errorMessage: 'Please paste a job description to analyze',
        ));
        return;
      }

      emit(currentState.copyWith(isLoading: true, errorMessage: null));

      try {
        final resume = await _claudeService.generateResumeFromJobDescription(
          projects: state.selectedJobs,
          jobDescription: currentState.jobDescription,
          additionalContext: currentState.additionalContext.isNotEmpty
              ? currentState.additionalContext
              : null,
        );

        emit(currentState.copyWith(
          generatedResume: resume,
          isLoading: false,
        ));
      } catch (e) {
        emit(currentState.copyWith(
          errorMessage: 'Failed to generate resume. Please try again.',
          isLoading: false,
        ));
      }
    }
  }

  void _onCopyResumeToClipboard(
    CopyResumeToClipboard event,
    Emitter<ResumeGeneratorState> emit,
  ) {
    if (state is ResumeGeneratorLoaded) {
      final currentState = state as ResumeGeneratorLoaded;
      if (currentState.generatedResume != null) {
        emit(ResumeCopiedToClipboard(
          techCategories: currentState.techCategories,
          selectedTechTags: currentState.selectedTechTags,
          jobDescription: currentState.jobDescription,
          additionalContext: currentState.additionalContext,
          generatedResume: currentState.generatedResume,
        ));

        // Return to loaded state after showing copied state
        emit(currentState);
      }
    }
  }

  void _onDownloadResumeAsPdf(
    DownloadResumeAsPdf event,
    Emitter<ResumeGeneratorState> emit,
  ) async {
    try {
      final pdf = pw.Document();
      final List<Widget> markdownWidgets = await HTMLToPdf().convertMarkdown(event.markdown);

      pdf.addPage(MultiPage(maxPages: 200, build: (context) => markdownWidgets));

      final Uint8List pdfBytes = await pdf.save();

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfBytes,
      );
    } catch (e) {
      print('Error generating PDF: $e');
    }
  }

  Map<String, List<String>> _categorizeTechTags(List<Project> projects) {
    final Set<String> allTags = {};
    for (final project in projects) {
      allTags.addAll(project.techTags.map((tag) => tag.toString()));
    }

    final categories = <String, List<String>>{
      'Languages': [],
      'Frameworks': [],
      'Databases': [],
      'Tools': [],
      'Other': [],
    };

    final patterns = {
      'Languages': [
        'dart',
        'python',
        'javascript',
        'typescript',
        'java',
        'kotlin',
        'swift',
        'c++',
        'c#',
        'go',
        'rust',
        'php',
        'ruby'
      ],
      'Frameworks': [
        'flutter',
        'react',
        'angular',
        'vue',
        'django',
        'spring',
        'express',
        'rails',
        'laravel',
        '.net'
      ],
      'Databases': [
        'mysql',
        'postgresql',
        'mongodb',
        'firebase',
        'redis',
        'sqlite',
        'oracle',
        'dynamodb'
      ],
      'Tools': [
        'git',
        'docker',
        'kubernetes',
        'jenkins',
        'aws',
        'gcp',
        'azure',
        'figma',
        'jira'
      ],
    };

    for (final tag in allTags) {
      final lowerTag = tag.toLowerCase();
      bool categorized = false;

      for (final entry in patterns.entries) {
        if (entry.value.any((pattern) => lowerTag.contains(pattern))) {
          categories[entry.key]!.add(tag);
          categorized = true;
          break;
        }
      }

      if (!categorized) {
        categories['Other']!.add(tag);
      }
    }

    // Remove empty categories and sort
    categories.removeWhere((key, value) => value.isEmpty);
    categories.forEach((key, value) => value.sort());

    return categories;
  }
}
