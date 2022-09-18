import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';


class Component {
  static Widget buildArticleItem(article) => Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${article['urlToImage']}',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      '${article['title']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  static Widget myDivider() => const Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Divider(
          color: Colors.blueGrey,
        ),
      );
  static Widget articleBuilder(list) => ConditionalBuilder(
        builder: (context) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Component.buildArticleItem(list[index + 1]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Component.myDivider();
            },
          );
        },
        condition: list.isNotEmpty,
        fallback: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
}
