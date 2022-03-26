part of 'components.dart';

class CustomImage extends StatefulWidget {
  final String? url;
  final double? width, height;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final bool showBlackGradient;
  final bool? zoomOnTap;
  final String? errorAssets;
  final BoxShape? boxShape;
  final bool? fixedSize;

  const CustomImage({
    Key? key,
    @required this.url,
    this.width,
    this.height,
    this.borderRadius,
    this.errorAssets,
    this.fit = BoxFit.cover,
    this.zoomOnTap = false,
    this.showBlackGradient = false,
    this.fixedSize = false,
    this.boxShape,
  }) : super(key: key);

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  bool _fullPortrait = false;
  @override
  void initState() {
    if (widget.fixedSize ?? false) {
      _calculateImageDimension(widget.url ?? "").then((value) {
        if (value.height > value.width) {
          setState(() {
            _fullPortrait = true;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (widget.zoomOnTap ?? false)
          ? () => ZoomDialog(
                child: CustomImage(
                  url: widget.url,
                  boxShape: widget.boxShape,
                  errorAssets: widget.errorAssets,
                  fit: widget.fit,
                  height: widget.height,
                  width: widget.width,
                  showBlackGradient: false,
                  zoomOnTap: false,
                ),
              ).show(context)
          : null,
      child: Container(
        height: (widget.fixedSize ?? false)
            ? _fullPortrait
                ? deviceHeight(context)
                : (widget.height ?? double.infinity)
            : (widget.height ?? double.infinity),
        width: (widget.fixedSize ?? false)
            ? _fullPortrait
                ? deviceWidth(context)
                : (widget.width ?? double.infinity)
            : (widget.width ?? double.infinity),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: widget.boxShape != null ? null : (widget.borderRadius ?? BorderRadius.circular(0.0)),
          shape: widget.boxShape ?? BoxShape.rectangle,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              fit: (widget.fixedSize ?? false)
                  ? _fullPortrait
                      ? BoxFit.cover
                      : BoxFit.contain
                  : widget.fit,
              imageUrl: widget.url ?? "",
              placeholder: (context, string) => Container(
                alignment: Alignment.center,
                child: ShimmeringObject(radius: widget.borderRadius ?? BorderRadius.circular(0.0)),
              ),
              errorWidget: (context, string, obj) => Image.asset(
                widget.errorAssets ?? "$imageAsset/no-image.jpg",
                fit: (widget.fixedSize ?? false)
                    ? _fullPortrait
                        ? BoxFit.cover
                        : BoxFit.contain
                    : widget.fit,
              ),
            ),
            if (widget.showBlackGradient)
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.black.withOpacity(.7), Colors.transparent, Colors.black.withOpacity(.7)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              )
          ],
        ),
      ),
    );
  }

  Future<Size> _calculateImageDimension(String url) {
    Completer<Size> completer = Completer();
    Image image = Image(image: CachedNetworkImageProvider(url)); // I modified this line
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          try {
            var myImage = image.image;
            Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
            completer.complete(size);
          } catch (e) {
            completer.complete(const Size(0, 0));
          }
        },
      ),
    );
    return completer.future;
  }
}
