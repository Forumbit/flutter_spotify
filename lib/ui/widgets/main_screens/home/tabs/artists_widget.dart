import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';

class ArtistsWidget extends StatelessWidget {
  const ArtistsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return const ArtistsItemWidget();
      },
    );
  }
}

class ArtistsItemWidget extends StatelessWidget {
  const ArtistsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 25),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const Image(
                  image: AssetImage(AppImages.adele),
                ),
              ),
              const SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Adele',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '43,877,516 monthly listeners',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Image(image: AssetImage(AppImages.chevronRight))
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
