# homeapp

## Flutter Stable Version 

3.24.52 

# SigninScreen build
# otp & otpVerification screen build
# folder structure change
# profile screen build
# Service Provider Screen build
# Looking for service screen build
# home screen build
# search filter screen build
# electric service screen build
# electrician booking services build
# plumber service provider screen build
# my order screen build



//  Image Upload Code 


            File? _imageFile;
            final ImagePicker _picker = ImagePicker();
            final List<String> allowedFileTypes = ['jpeg', 'jpg', 'png', 'webp'];
            
            
            
            
            Widget postUpload() {
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
            onTap: () => _selectImage(context),
            child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            _imageFile == null
            ? Image.asset(
            FileProvider.upload,
            height: 200,
            )
            : Image.file(
            File(_imageFile!.path),
            height: 200,
            fit: BoxFit.contain,
            ),
            ],
            ),
            ),
            ),
            );
            }
            
            
            void _selectImage(BuildContext context) async {
            showModalBottomSheet(
            context: context,
            builder: (context) => Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
            color: ColorConstants.kWhiteColor,
            borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            ),
            ),
            height: 200,
            child: Column(
            children: [
            SizedBox(height: 20.sp),
            ListTile(
            leading: const Icon(Icons.camera_alt,
            color: ColorConstants.kPrimaryColor),
            title: Text(
            Localization.translate("camera") ?? "Camera",
            style: GoogleFonts.poppins(
            color: ColorConstants.kPrimaryColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            ),
            ),
            onTap: () async {
            Navigator.pop(context);
            final pickedFile =
            await _picker.pickImage(source: ImageSource.camera);
            if (pickedFile != null &&
            allowedFileTypes.contains(
            pickedFile.path.split('.').last.toLowerCase())) {
            setState(() {
            _imageFile = File(pickedFile.path);
            });
            } else {
            Toast.showErrorToast(
            context,
            'Unsupported file format. Please select a JPEG, JPG, PNG, or WEBP file.',
            );
            return;
            }
            },
            ),
            ListTile(
            leading: const Icon(Icons.photo_library,
            color: ColorConstants.kPrimaryColor),
            title: Text(
            Localization.translate("gallery") ?? "Gallery",
            style: GoogleFonts.poppins(
            color: ColorConstants.kPrimaryColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            ),
            ),
            onTap: () async {
            Navigator.pop(context);
            final pickedFile =
            await _picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null &&
            allowedFileTypes.contains(
            pickedFile.path.split('.').last.toLowerCase())) {
            setState(() {
            _imageFile = File(pickedFile.path);
            });
            } else {
            Toast.showErrorToast(
            context,
            'Unsupported file format. Please select a JPEG, JPG, PNG, or WEBP file.',
            );
            return;
            }
            },
            ),
            ListTile(
            leading:
            const Icon(Icons.folder, color: ColorConstants.kPrimaryColor),
            title: Text(
            Localization.translate("files") ?? "Files",
            style: GoogleFonts.poppins(
            color: ColorConstants.kPrimaryColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            ),
            ),
            onTap: () async {
            Navigator.pop(context);
            final pickedFile =
            await _picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null &&
            allowedFileTypes.contains(
            pickedFile.path.split('.').last.toLowerCase())) {
            setState(() {
            _imageFile = File(pickedFile.path);
            });
            } else {
            Toast.showErrorToast(
            context,
            'Unsupported file format. Please select a JPEG, JPG, PNG, or WEBP file.',
            );
            return;
            }
            },
            ),
            ],
            ),
            ),
            );
            }