// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/models/category.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_detail_page.dart';
import 'package:localization/localization.dart';
import 'package:page_transition/page_transition.dart';

class GetFavorites extends StatefulWidget {
  GetFavorites({
    Key? key,
  }) : super(key: key);

  @override
  State<GetFavorites> createState() => _GetFavoritesState();
}

class _GetFavoritesState extends State<GetFavorites> {
  @override
  Widget build(BuildContext context) {
    final _controller = GetIt.instance.get<ControllerHome>();
    var size = MediaQuery.of(context).size;

    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Observer(builder: (context) {
      if (_controller.listFavoriteCategories.isEmpty) {
        return const SizedBox();
      } else
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * 0.7,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
              child: ListView.builder(
                itemCount: _controller.listFavoriteCategories.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: MeuGreenDetailPage(
                                categoryId: _controller
                                    .listFavoriteCategories[index].categoryId,
                                name: _controller
                                    .listFavoriteCategories[index].name,
                                assetsName: _controller
                                    .listFavoriteCategories[index].assetsName,
                                listSub: _controller
                                    .listFavoriteCategories[index].subCategory,
                                isSelect: false,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: size.width * 0.7,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorated = toggleIsFavorated(
                                        _controller
                                            .listFavoriteCategories[index]
                                            .isFavorited);
                                    _controller.listFavoriteCategories[index]
                                        .isFavorited = isFavorated;

                                    if (_controller
                                            .listFavoriteCategories[index]
                                            .isFavorited ==
                                        true) {
                                      _controller.addFavorite(_controller
                                          .listFavoriteCategories[index]);
                                    } else {
                                      _controller.removeFavorite(_controller
                                          .listFavoriteCategories[index]);
                                    }
                                  });
                                },
                                icon: Icon(
                                  _controller.listFavoriteCategories[index]
                                              .isFavorited ==
                                          true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                iconSize: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(
                                'assets/' +
                                    _controller.listFavoriteCategories[index]
                                        .assetsName +
                                    '.png',
                                fit: BoxFit.contain),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (_controller
                                          .listFavoriteCategories[index].name)
                                      .i18n(),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: _controller.listFavoriteCategories[index].color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
    });
  }
}
