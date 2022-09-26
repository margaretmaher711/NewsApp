import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/web_view/web_view.dart';

class Component {
  static Widget buildArticleItem(article, context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => WebViewScreen(article['url'])),
            ),
          );
        },
        child: Padding(
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
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      )),
                      Text(
                        '${article['publishedAt']}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  static Widget myDivider() => const Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Divider(
          color: Colors.blueGrey,
        ),
      );
  static Widget articleBuilder(List list, context, {isSearch = false}) =>
      ConditionalBuilder(
          builder: (context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Component.buildArticleItem(list[index], context);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Component.myDivider();
              },
            );
          },
          condition: list.isNotEmpty,
          fallback: (BuildContext context) => isSearch
              ? Container()
              : const Center(
                  child: CircularProgressIndicator(),
                ));

  static Widget defaultFormField({
    required TextEditingController controller,
    required TextInputType type,
    bool isPassword = false,
    bool isClickable = true,
    Function(String)? onSubmit,
    Function(String)? onChange,
    Function()? onTap,
    required String? Function(String?) validate,
    required String label,
    required IconData prefix,
    IconData? suffix,
    Function()? suffixPressed,
  }) =>
      TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: const OutlineInputBorder(),
        ),
      );
}
