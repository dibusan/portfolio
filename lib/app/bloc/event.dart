import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/app/bloc/state.dart';

part 'event.freezed.dart';

@freezed
abstract class FilterEvent with _$FilterEvent {
  const factory FilterEvent.init() = FilterEventInit;

  const factory FilterEvent.datetime({
    required DateFilter dateTime,
  }) = FilterEventDateTime;

  const factory FilterEvent.writeFilterTag({
    @Default("") String value,
  }) = FilterEventWriteTag;

  const factory FilterEvent.techTag({
    required String name,
    required bool removed,
  }) = FilterEventTechTag;
}
