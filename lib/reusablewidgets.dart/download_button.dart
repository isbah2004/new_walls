import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:new_walls/provider/full_screen_provider.dart';
import 'package:new_walls/theme/theme_data.dart';
import 'package:new_walls/utils/utils.dart';
import 'package:provider/provider.dart';

class DownloadButton extends StatelessWidget {
  final String imageUrl;
  const DownloadButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<FullScreenProvider>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () {
              FileDownloader.downloadFile(
                  url: imageUrl,
                  onProgress: (fileName, progress) {
                    value.setLoading(true);
                    debugPrint(fileName);
                  },
                  onDownloadCompleted: (String path) {
                    value.setLoading(false);
                    Utils.showToastMessage(
                        message: 'Wallpaper Downloaded Successfully');
                  },
                  onDownloadError: (String error) {
                    value.setLoading(false);
                    Utils.showToastMessage(
                        message: 'Failed to Download Wallpaper');
                  });
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(70, 0, 0, 0),
                  borderRadius: BorderRadius.circular(16)),
              child: value.loading
                  ? const CircularProgressIndicator(
                      color: AppTheme.whiteColor,
                    )
                  : Text(
                      'Download Wallpaper',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
