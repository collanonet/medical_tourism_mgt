// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';

class DicomViewerWidget extends StatefulWidget {
  final List<DicomDetailResponse> dicomFiles;

  const DicomViewerWidget({
    super.key,
    required this.dicomFiles,
  });

  @override
  State<DicomViewerWidget> createState() => _DicomViewerWidgetState();
}

class _DicomViewerWidgetState extends State<DicomViewerWidget> {
  int selectedImageIndex = 0;
  int currentFrame = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.dicomFiles.isEmpty) {
      return const Center(
        child: Text('DICOMファイルが見つかりません'),
      );
    }

    final selectedDicom = widget.dicomFiles[selectedImageIndex];
    final totalFrames = selectedDicom.numberOfFrames ?? 1;

    return Row(
      children: [
        // 左側のサムネイルリスト（赤枠部分）
        Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            color: Colors.grey[100],
          ),
          child: Column(
            children: [
              // DICOM Explorer ヘッダー
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DICOM Explorer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      selectedDicom.patientName ?? 'Unknown Patient',
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      _formatDate(selectedDicom.acquisitionDate),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              // サムネイルリスト
              Expanded(
                child: ListView.builder(
                  itemCount: widget.dicomFiles.length,
                  itemBuilder: (context, index) {
                    final dicom = widget.dicomFiles[index];
                    final isSelected = index == selectedImageIndex;
                    
                    return Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey,
                          width: isSelected ? 3 : 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedImageIndex = index;
                            currentFrame = 0;
                          });
                        },
                        child: Column(
                          children: [
                            // サムネイル画像（実際の実装では適切なサムネイルを表示）
                            Container(
                              height: 60,
                              width: double.infinity,
                              color: Colors.grey[300],
                              child: Center(
                                child: Text(
                                  dicom.seriesDescription ?? 'Series ${index + 1}',
                                  style: const TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            // シリーズ情報
                            Container(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dicom.seriesDescription ?? 'Unknown',
                                    style: const TextStyle(fontSize: 8),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (dicom.numberOfFrames != null && dicom.numberOfFrames! > 1)
                                    Text(
                                      '${dicom.numberOfFrames} frames',
                                      style: const TextStyle(fontSize: 7),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // 右側のメイン画像表示エリア（青枠部分）
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              color: Colors.black,
            ),
            child: Column(
              children: [
                // メイン画像表示エリア
                Expanded(
                  child: _buildMainImageViewer(selectedDicom),
                ),
                // 下部のフレーム情報とコントロール
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[800],
                  child: Row(
                    children: [
                      // フレーム情報
                      Text(
                        'Frame: [$currentFrame] $currentFrame/$totalFrames',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // ズーム情報
                      const Text(
                        'Zoom: 121.95%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // ウィンドウ/レベル
                      const Text(
                        'Window/Level: 350/40',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      // フレームナビゲーション
                      Row(
                        children: [
                          IconButton(
                            onPressed: currentFrame > 0
                                ? () {
                                    setState(() {
                                      currentFrame--;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.skip_previous, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: currentFrame < totalFrames - 1
                                ? () {
                                    setState(() {
                                      currentFrame++;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.skip_next, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainImageViewer(DicomDetailResponse dicom) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Stack(
        children: [
          // 中央の画像表示エリア（実際の実装では適切な画像を表示）
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image,
                      size: 64,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'DICOM Image Display',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Series: ${dicom.seriesDescription ?? 'Unknown'}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      'Frame: $currentFrame/${dicom.numberOfFrames ?? 1}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 患者情報（左上）
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dicom.patientName ?? 'Unknown',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    'DOB: ${_formatDate(dicom.patientBirthDate)}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'ID: ${dicom.patientId ?? 'N/A'}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Sex: ${dicom.patientSex ?? 'N/A'}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Age: ${_calculateAge(dicom.patientBirthDate)} Years',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          // 研究情報（右上）
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    dicom.institutionName ?? 'Unknown Institution',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    dicom.studyDescription ?? 'Unknown Study',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Study ID: ${dicom.studyId ?? 'N/A'}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Ac. Nb: ${dicom.acquisitionNumber ?? 'N/A'}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Acq.: ${_formatDate(dicom.acquisitionDate)}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Acq.: ${_formatTime(dicom.acquisitionTime)}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          // 方向マーカー（R, A）
          Positioned(
            bottom: 60,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'R',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'A',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // スケールバー（右下）
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: 80,
              height: 2,
              color: Colors.white,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '20cm',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ),
          // シリーズ情報（右下）
          Positioned(
            bottom: 60,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(4),
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Series Nb: ${dicom.seriesNumber ?? 'N/A'}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    dicom.seriesDescription ?? 'Unknown',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Thickness: ${dicom.sliceThickness ?? 'N/A'} mm',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Location: ${dicom.imagePositionPatient ?? 'N/A'} mm',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.month}/${date.day}/${date.year}';
  }

  String _formatTime(String? time) {
    if (time == null) return 'N/A';
    // DICOM時間フォーマットから表示用フォーマットに変換
    return time;
  }

  String _calculateAge(DateTime? birthDate) {
    if (birthDate == null) return 'N/A';
    final now = DateTime.now();
    final age = now.year - birthDate.year;
    if (now.month < birthDate.month || 
        (now.month == birthDate.month && now.day < birthDate.day)) {
      return (age - 1).toString();
    }
    return age.toString();
  }
}
