import 'package:bloc/bloc.dart';
import 'package:bloc2/bloc/image_picker/image_picker_event.dart';
import 'package:bloc2/bloc/image_picker/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  ImagePickerBloc() : super(ImagePickerStates()) {
    on<GalleryImagePickerEvent>(_increment);
    on<CameraImagePickerEvent>(_decrement);
  }

  Future<void> _increment(
      GalleryImagePickerEvent event, Emitter<ImagePickerStates> emit) async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    emit(state.copyWith(file: image));
  }

  void _decrement(
      CameraImagePickerEvent event, Emitter<ImagePickerStates> emit) async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    emit(state.copyWith(file: image));
  }
}
