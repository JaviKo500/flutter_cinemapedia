import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.movie_outlined,
                  color: colors.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('Cinemapedia', style: titleStyle),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    final searchMovieCallback = ref.read( movieRepositoryProvider ).getSearchMovies;
                    showSearch(
                      context: context, 
                      delegate: SearchMovieDelegate(
                        searchMovieCallback: searchMovieCallback
                      ),

                    );
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
          ),
        ));
  }
}
