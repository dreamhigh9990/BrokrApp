import 'dart:io';

import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PhotosBuildingSection extends StateFullCustom {
  final ListingBuildingBloc bloc;
  PhotosBuildingSection({super.key, required this.bloc});

  @override
  State<PhotosBuildingSection> createState() => _PhotosBuildingSectionState();
}

class _PhotosBuildingSectionState extends State<PhotosBuildingSection> {
  final ImagePicker _picker = ImagePicker();

  _selectMultiPhotos() async {
    final List<XFile> images = await _picker.pickMultiImage();
    final photos = images.map((e) => File(e.path)).toList();
    widget.bloc.addPhotos(photos);
  }

  _selectSinglePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      widget.bloc.addCover([File(image.path)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.responsive.wp(5),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: widget.responsive.hp(6)),
              child: const Text(
                  "Void using photos that contain phone numbers, company logos or waterwarks. Photos that contain this information will be adited or removed."),
            ),
            _buildSectionPhotos(
                false, widget.bloc.coverStream, "Upload cover photo"),
            SizedBox(height: widget.responsive.hp(5)),
            _buildSectionPhotos(
                true, widget.bloc.photosStream, "Upload photos"),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionPhotos<T>(
      bool isMultiple, Stream<T> stream, String label) {
    return StreamBuilder(
      stream: stream,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GestureDetector(
          onTap: () => isMultiple ? _selectMultiPhotos() : _selectSinglePhoto(),
          onLongPress: () {},
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            color: Colors.grey.shade400,
            strokeWidth: 2,
            dashPattern: const [8, 4],
            child: SizedBox(
              height: widget.responsive.hp(30),
              child: snapshot.data.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.upload,
                              color: widget.colorsTheme.textOpacity),
                          SizedBox(height: widget.responsive.hp(3)),
                          Text(
                            label,
                            style: widget.fontSize.subtitle1(
                              color: widget.colorsTheme.textOpacity,
                            ),
                          )
                        ],
                      ),
                    )
                  : _buildPhotos(snapshot.data, isMultiple),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPhotos(List<File> photos, bool canRemove) {
    return Stack(
      children: [
        Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              photos.length,
              (index) => Stack(
                children: [
                  Image.file(
                    photos[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  canRemove
                      ? Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.7)),
                            child: IconButton(
                              color: widget.colorsTheme.primary,
                              onPressed: () => widget.bloc.removePhotos(index),
                              icon: const FaIcon(FontAwesomeIcons.trash),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
