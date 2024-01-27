import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  ImagePickerEvents() {}

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GalleryImagePickerEvent extends ImagePickerEvents {}

class CameraImagePickerEvent extends ImagePickerEvents {}
