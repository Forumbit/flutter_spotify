import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/domain/entities/track.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';
import 'package:flutter_spotify/ui/navigation/main_navigation.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/home/home_model.dart';
import 'package:flutter_spotify/ui/widgets/main_screens/home/tabs/artists_widget.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        SizedBox(height: 24),
        _SliderCarouselWidget(),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.only(left: 32),
          child: Text(
            'Today\'s hits',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(height: 12),
        _TracksWidget(),
        SizedBox(height: 32),
        _MenuWidget(),
      ],
    );
  }
}

class _MenuWidget extends StatelessWidget {
  const _MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              physics: BouncingScrollPhysics(),
              labelPadding: EdgeInsets.symmetric(horizontal: 24),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              isScrollable: true,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              tabs: [
                Text('Artists'),
                Text('Album'),
                Text('Genre'),
                Text('Podcast'),
              ],
            ),
            const Divider(),
            Container(
              constraints: const BoxConstraints(
                minHeight: 0,
                maxHeight: 400,
              ),
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const ArtistsWidget(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.build, size: 48),
                        Text('Sorry! This sector is under development'),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.build, size: 48),
                        Text('Sorry! This sector is under development'),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.build, size: 48),
                        Text('Sorry! This sector is under development'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliderCarouselWidget extends StatelessWidget {
  const _SliderCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 152,
        viewportFraction: 1,
        autoPlay: true,
      ),
      items: [1, 2, 3]
          .map((i) => Builder(builder: (BuildContext context) {
                return _SliderCarouselWidgetBody(index: i);
              }))
          .toList(),
    );
  }
}

class _SliderCarouselWidgetBody extends StatelessWidget {
  const _SliderCarouselWidgetBody({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 128,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _SliderCarouselWidgetBodyText(),
              Image(image: AssetImage(AppImages.mahalini))
            ],
          ),
        ),
      ),
    );
  }
}

class _SliderCarouselWidgetBodyText extends StatelessWidget {
  const _SliderCarouselWidgetBodyText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 20),
        Text(
          'Popular',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Sisa Rasa',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Mahalini',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _TracksWidget extends StatelessWidget {
  const _TracksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tracks = context.watch<HomeModel>().tracks;
    return Container(
      padding: const EdgeInsets.only(left: 32),
      height: 170,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemExtent: 144,
        scrollDirection: Axis.horizontal,
        itemCount: tracks.length,
        itemBuilder: (BuildContext context, int index) {
          return _TracksWidgetItem(index: index);
        },
      ),
    );
  }
}

class _TracksWidgetItem extends StatelessWidget {
  final int index;
  const _TracksWidgetItem({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final track = context.read<HomeModel>().tracks[index];
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(track.image.replaceAll('\\/', '/')),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF818181),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Image(
                        image: AssetImage(AppImages.play),
                        width: 8,
                        height: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                track.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                track.artistName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => Navigator.pushNamed(context, MainNavigationRouteNames.trackDetail, arguments: track),
            ),
          )
        ],
      ),
    );
  }
}