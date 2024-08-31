import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../provider/infinite_provider_class.dart';

class InfiniteScrollingPage extends StatelessWidget {
  const InfiniteScrollingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        title: const Text('Infinite Scroll Image',
            style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<InfiniteScrollProvider>(
        builder: (context, provider, child) {
          return RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView.builder(
              controller: ScrollController()
                ..addListener(() {
                  if (ScrollController().position.pixels ==
                      ScrollController().position.maxScrollExtent) {
                    provider.loadMore();
                  }
                }),
              itemCount: provider.items.length + (provider.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.items.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                final item = provider.items[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: FadeInAnimation(
                    child: Column(
                      children: [
                        _buildImageShowing(
                            provider.images[index % provider.images.length]),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageShowing(String image) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: ShapeDecoration(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        child: Card(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(27)),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}