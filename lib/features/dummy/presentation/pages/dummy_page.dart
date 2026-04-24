import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/state/base_state.dart';
import 'package:real_state/core/widgets/app_loader.dart';
import 'package:real_state/core/widgets/app_error_widget.dart';
import 'package:real_state/core/network/api_client.dart';
import 'package:real_state/core/di/injection.dart';

import '../bloc/dummy_bloc.dart';
import '../bloc/dummy_event.dart';
import '../../domain/repositories/dummy_repository.dart';
import '../../data/models/dummy_post.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DummyBloc(DummyRepository(getIt<ApiClient>()))..add(GetPostsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Core Validation'),
        ),
        body: BlocBuilder<DummyBloc, BaseState<List<DummyPost>>>(
          builder: (context, state) {
            if (state is BaseLoading) {
              return const AppLoader();
            }
            if (state is BaseError) {
              return AppErrorWidget(
                failure: (state as BaseError).failure,
                onRetry: () => context.read<DummyBloc>().add(GetPostsEvent()),
              );
            }
            if (state is BaseSuccess<List<DummyPost>>) {
              final posts = state.data;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(
                      post.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(post.body),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
