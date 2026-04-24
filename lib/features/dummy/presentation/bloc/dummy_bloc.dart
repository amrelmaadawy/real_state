import 'package:real_state/core/state/base_bloc.dart';
import 'package:real_state/core/state/base_state.dart';
import 'dummy_event.dart';
import '../../data/models/dummy_post.dart';
import '../../domain/repositories/dummy_repository.dart';

class DummyBloc extends BaseBloc<DummyEvent, List<DummyPost>> {
  final DummyRepository repository;

  DummyBloc(this.repository) : super() {
    on<GetPostsEvent>((event, emit) async {
      await executeEmitter(() => repository.getPosts(), emit);
    });
  }
}
