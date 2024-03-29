// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
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
              height: 100,
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
                                categorieName: _controller
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
                      width: size.width * 0.86,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              height: 40,
                              width: 40,
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
                                iconSize: 25,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
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
                                  (_controller.listFavoriteCategories[index]
                                          .nameInter)
                                      .i18n(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Savoye Let",
                                    fontSize: 19,
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
                        borderRadius: BorderRadius.circular(25),
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
