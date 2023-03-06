import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';
import 'package:flutter_spotify/styles/app_colors.dart';

class ProfilWidget extends StatelessWidget {
  const ProfilWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _ProfilHeadWidget(),
            SizedBox(height: 24),
            _FeatureProfilWidget(),
            SizedBox(height: 40),
            _TracksPlayedWidget(),
          ],
        ),
      ),
    );
  }
}

class _ProfilHeadWidget extends StatelessWidget {
  const _ProfilHeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 48),
      decoration: const BoxDecoration(
        color: AppColors.neutralGrey,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(64),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const _ProfilAvatarWidget(),
          const SizedBox(height: 16),
          const _ProfilFullnameWidget(),
          const SizedBox(height: 4),
          const _ProfilEmailWidget(),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 92),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [_FollowersWidget(), _FollowingWidget()],
            ),
          )
        ],
      ),
    );
  }
}

class _ProfilAvatarWidget extends StatelessWidget {
  const _ProfilAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: const Image(
        image: AssetImage(AppImages.profil),
        width: 96,
      ),
    );
  }
}

class _ProfilFullnameWidget extends StatelessWidget {
  const _ProfilFullnameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Fauzian Ahmad',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _ProfilEmailWidget extends StatelessWidget {
  const _ProfilEmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'fauzianahmad04@gmail.com',
      style: TextStyle(
        fontSize: 14,
      ),
    );
  }
}

class _FollowersWidget extends StatelessWidget {
  const _FollowersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Followers',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '129',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class _FollowingWidget extends StatelessWidget {
  const _FollowingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Following',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '238',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class _FeatureProfilWidget extends StatelessWidget {
  const _FeatureProfilWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 77),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Image(
                image: AssetImage(AppImages.addPerformer),
              ),
              Text(
                'Find Friend',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Column(
            children: const [
              Image(
                image: AssetImage(AppImages.share),
              ),
              Text(
                'Share',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _TracksPlayedWidget extends StatelessWidget {
  const _TracksPlayedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mostly played',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        _ProfilPlayedTracksImage(),
                        SizedBox(width: 16),
                        _ProfilPlayedTracksDescription(),
                        Spacer(),
                        Image(image: AssetImage(AppImages.ellipsisVertical))
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfilPlayedTracksImage extends StatelessWidget {
  const _ProfilPlayedTracksImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: const Image(
        image: AssetImage(AppImages.tracks),
        width: 64,
        height: 64,
      ),
    );
  }
}

class _ProfilPlayedTracksDescription extends StatelessWidget {
  const _ProfilPlayedTracksDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Dekat Di Hati',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Text(
          'RAN',
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
