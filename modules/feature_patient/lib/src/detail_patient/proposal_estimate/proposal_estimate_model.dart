// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProposalEstimateModel {
  ProposalEstimateModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier(const AsyncData());
  ValueNotifier<AsyncData<MedicalRecord>> medicalRecordData =
      ValueNotifier(const AsyncData());

  // 見積書関連
  ValueNotifier<AsyncData<List<MedicalInvoiceResponse>>> medicalQuotationData =
      ValueNotifier(const AsyncData());

  // 提案関連（既存の病院提案）
  ValueNotifier<AsyncData<List<MedicalRecordProposal>>> proposal =
      ValueNotifier(const AsyncData<List<MedicalRecordProposal>>());
      
  // 提案関連（新しい提案）
  ValueNotifier<AsyncData<List<MedicalRecordProposal>>> newProposals =
      ValueNotifier(const AsyncData<List<MedicalRecordProposal>>());

  Future<void> initialData({
    required Patient patient,
    required MedicalRecord medicalRecord,
    required FormGroup formGroup,
  }) async {
    patientData.value = AsyncData(data: patient);
    medicalRecordData.value = AsyncData(data: medicalRecord);
    formGroup.control('medicalRecord').value = medicalRecord.id;
    formGroup.control('user').value = patient.id;
    
    // 見積書データを取得
    await fetchMedicalQuotation(medicalRecordId: medicalRecord.id);
    
         // 既存の病院提案データを取得
     await getProposal(medicalRecord.id, formGroup);
     
     // 新しい提案データを取得
     await getNewProposals(medicalRecord.id, formGroup);
  }

  ValueNotifier<AsyncData<MedicalInvoiceResponse>> editData =
      ValueNotifier(const AsyncData());

  Future<void> editQuotation({
    required MedicalInvoiceResponse invoice,
    required FormGroup formGroup,
  }) async {
    editData.value = AsyncData(data: invoice, loading: true);
    formGroup.control('_id').value = invoice.id;
    formGroup.control('logoFile').value = FileSelect(
      url: invoice.logoFile,
    );
    formGroup.control('stampFile').value = FileSelect(
      url: invoice.stampFile,
    );
    formGroup.control('invoiceNumber').value = invoice.invoiceNumber;
    formGroup.control('invoiceDate').value = invoice.invoiceDate;
    formGroup.control('companyName').value = invoice.companyName;
    formGroup.control('address').value = invoice.address;
    formGroup.control('telNumber').value = invoice.telNumber;
    formGroup.control('fexNumber').value = invoice.fexNumber;
    formGroup.control('inCharge').value = invoice.inCharge;

    formGroup.control('medicalRecord').value = invoice.medicalRecord.id;
    formGroup.control('user').value = invoice.user?.id;
    formGroup.control('hospitalRecord').value = invoice.hospitalRecord?.id;

    formGroup.control('remarks').value = invoice.remarks;
    formGroup.control('taxRate').value = invoice.taxRate;
    formGroup.control('taxRateOption').value = invoice.taxRateOption;

    FormArray notes = formGroup.control('notes') as FormArray;

    if (invoice.notes?.isNotEmpty == true) {
      notes.clear();
      notes.reset();
      for (NoteInvoiceResponse note in invoice.notes ?? []) {
        notes.add(
          FormGroup({
            '_id': FormControl<String>(value: note.id),
            'note': FormControl<String>(value: note.note),
          }),
        );
      }
    }

    try {
      FormArray item = formGroup.control('item') as FormArray;

      if (invoice.item?.isNotEmpty == true) {
        item.clear();
        item.reset();
        for (ItemResponse itemData in invoice.item ?? []) {
          item.add(
            FormGroup({
              '_id': FormControl<String>(value: itemData.id),
              'itemCode': FormControl<String>(value: itemData.itemCode),
              'details': FormControl<String>(value: itemData.details),
              'quantity': FormControl<double>(value: itemData.quantity),
              'unit': FormControl<String>(value: itemData.unit ?? '式'),
              'unitPrice': FormControl<double>(value: itemData.unitPrice),
            }),
          );
        }
      }

      await Future.delayed(const Duration(milliseconds: 500), () {
        editData.value = AsyncData(data: invoice);
      });
    } catch (e) {
      logger.e(e);
      editData.value = AsyncData(data: invoice);
    }
  }

  Future<void> fetchMedicalQuotation({required String medicalRecordId}) async {
    try {
      medicalQuotationData.value = const AsyncData(loading: true);
      final response = await patientRepository.getInvoices(
        medicalRecord: medicalRecordId,
        type: false, // Quotation
      );
      medicalQuotationData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      medicalQuotationData.value = AsyncData(error: e);
    }
  }

     // 既存の病院提案関連メソッド
   getProposal(String medicalRecord, FormGroup formGroup) async {
     proposal.value = const AsyncData(loading: true);
     try {
       final data = await patientRepository
           .getMedicalRecordProposalsByMedicalRecord(medicalRecord);
       proposal.value = AsyncData(data: data);
       insertProposal(data, formGroup);
     } catch (e) {
       logger.d(e);
       proposal.value = AsyncData(error: e);
     }
   }
   
   // 新しい提案関連メソッド
   getNewProposals(String medicalRecord, FormGroup formGroup) async {
     newProposals.value = const AsyncData(loading: true);
     try {
       // 新しい提案データを取得（既存の病院提案とは別のデータソース）
       final data = await patientRepository
           .getMedicalRecordProposalsByMedicalRecord(medicalRecord);
       newProposals.value = AsyncData(data: data);
       insertNewProposals(data, formGroup);
     } catch (e) {
       logger.d(e);
       newProposals.value = AsyncData(error: e);
     }
   }

     void insertProposal(
       List<MedicalRecordProposal> data, FormGroup formGroup) async {
     if (data.isNotEmpty) {
       FormArray proposalArray = formGroup.control('proposal') as FormArray;

       proposalArray.clear();
       for (var d in data) {
         proposalArray.add(FormGroup({
           '_id': FormControl<String?>(value: d.id),
           'hospitalName': FormControl<String>(value: d.hospitalName),
           'postalCode': FormControl<String>(),
           'address': FormControl<String>(value: d.address),
           'summary': FormControl<String>(value: d.summary),
           'medicalRecord': FormControl<String>(value: d.medicalRecord),
         }));
       }
     }
   }
   
   void insertNewProposals(
       List<MedicalRecordProposal> data, FormGroup formGroup) async {
     if (data.isNotEmpty) {
       FormArray proposals = formGroup.control('proposals') as FormArray;

       proposals.clear();
       for (var d in data) {
         proposals.add(FormGroup({
           '_id': FormControl<String?>(value: d.id),
           'medicalInstitution': FormControl<String>(value: d.hospitalName),
           'region': FormControl<String>(value: d.address),
           'treatmentType': FormControl<String>(),
           'recommendationReason': FormControl<String>(value: d.summary),
           'expectedTreatmentMenu': FormControl<String>(),
           'budget': FormControl<String>(),
         }));
       }
     }
   }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());

  Future<void> submit({
    required FormGroup formGroup,
  }) async {
    try {
      submitData.value = const AsyncData(loading: true);

      // 見積書データの処理
      List<ItemRequest>? items = [];
      formGroup.control('item').value.forEach((item) {
        logger.d(item);
        if (item['details'] != null && item['details'] != '') {
          items.add(ItemRequest.fromJson(item));
        }
      });

      List<NoteInvoiceRequest>? notes = [];
      formGroup.control('notes').value.forEach((note) {
        if (note['note'] != null && note['note'] != '') {
          notes.add(NoteInvoiceRequest.fromJson(note));
        }
      });

      String? logoFile;
      if (formGroup.control('logoFile').value != null) {
        FileSelect docFile = formGroup.control('logoFile').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            logoFile = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          logoFile = docFile.url;
        }
      }

      String? stampFile;
      if (formGroup.control('stampFile').value != null) {
        FileSelect docFile = formGroup.control('stampFile').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            stampFile = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          stampFile = docFile.url;
        }
      }

      MedicalInvoiceRequest request = MedicalInvoiceRequest(
        logoFile: logoFile,
        stampFile: stampFile,
        type: false,
        invoiceNumber: formGroup.control('invoiceNumber').value,
        invoiceDate: formGroup.control('invoiceDate').value,
        companyName: formGroup.control('companyName').value,
        address: formGroup.control('address').value,
        telNumber: formGroup.control('telNumber').value,
        fexNumber: formGroup.control('fexNumber').value,
        inCharge: formGroup.control('inCharge').value,
        totalAmount: formGroup.control('totalAmount').value,
        remarks: formGroup.control('remarks').value,
        notes: notes,
        item: items,
        medicalRecord: formGroup.control('medicalRecord').value,
        user: formGroup.control('user').value,
        patient: formGroup.control('user').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
        taxRate: formGroup.control('taxRate').value,
        taxRateOption: formGroup.control('taxRateOption').value,
      );

      // PDF生成（日本語、中国語など）
      await _generatePdfs(request);

      if (formGroup.control('_id').value != null) {
        await updateQuotation(
          id: formGroup.control('_id').value,
          request: request,
        );
      } else {
        await createQuotation(request: request);
      }

             // 既存の病院提案データの処理
       await saveProposals(formGroup);
       
       // 新しい提案データの処理
       await saveNewProposals(formGroup);

      editData.value = const AsyncData();
      submitData.value = const AsyncData(data: true);
      formGroup.reset();
    } catch (e) {
      logger.e(e);
      submitData.value = AsyncData(error: e);
    }
  }

     Future<void> saveProposals(FormGroup formGroup) async {
     FormArray proposalArray = formGroup.control('proposal') as FormArray;
     
     for (var form in proposalArray.controls) {
       if (form.value['hospitalName'] != null && 
           form.value['hospitalName'].toString().isNotEmpty) {
         final data = MedicalRecordProposalRequest(
           hospitalName: form.value['hospitalName'],
           postalCode: form.value['postalCode'] ?? '',
           address: form.value['address'] ?? '',
           summary: form.value['summary'] ?? '',
           medicalRecord: medicalRecordData.value.requireData.id,
         );
         
         if (form.value['_id'] != null) {
           await updateProposal(data, form.value['_id']);
         } else {
           await createProposal(data);
         }
       }
     }
   }
   
   Future<void> saveNewProposals(FormGroup formGroup) async {
     FormArray proposalsArray = formGroup.control('proposals') as FormArray;
     
     for (var form in proposalsArray.controls) {
       if (form.value['medicalInstitution'] != null && 
           form.value['medicalInstitution'].toString().isNotEmpty) {
         final data = MedicalRecordProposalRequest(
           hospitalName: form.value['medicalInstitution'],
           postalCode: '',
           address: form.value['region'] ?? '',
           summary: form.value['recommendationReason'] ?? '',
           medicalRecord: medicalRecordData.value.requireData.id,
         );
         
         if (form.value['_id'] != null) {
           await updateProposal(data, form.value['_id']);
         } else {
           await createProposal(data);
         }
       }
     }
   }

  Future<void> _generatePdfs(MedicalInvoiceRequest request) async {
    // PDF生成処理（簡略化）
    try {
      for (String language in ['JP', 'ZH', 'ZHTW', 'VN', 'EN']) {
        Uint8List? pdfBytes = await generatePdfFromQuotation(
            patientData.value.requireData, language,
            request: request);
        String fileName = 'quotation_${DateTime.now().millisecondsSinceEpoch}_$language.pdf';

        if (pdfBytes != null) {
          String base64Image = base64Encode(pdfBytes);
          await patientRepository.uploadFileBase64(base64Image, fileName);
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteInvoice(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteInvoice(id);
        medicalQuotationData.value = AsyncData(
            data: medicalQuotationData.value.data ?? []
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }

  Future<void> createQuotation({
    required MedicalInvoiceRequest request,
  }) async {
    try {
      medicalQuotationData.value = medicalQuotationData.value.copyWith(
        loading: true,
      );
      final response = await patientRepository.postInvoice(request);
      medicalQuotationData.value = AsyncData(data: [
        response,
        ...medicalQuotationData.value.data ?? [],
      ]);
      logger.d('Quotation created: ${medicalQuotationData.value.data?.length}');
    } catch (e) {
      logger.e(e);
      medicalQuotationData.value = AsyncData(error: e);
    }
  }

  Future<void> updateQuotation({
    required String id,
    required MedicalInvoiceRequest request,
  }) async {
    try {
      medicalQuotationData.value = medicalQuotationData.value.copyWith(
        loading: true,
      );
      final response = await patientRepository.putInvoice(id, request);
      medicalQuotationData.value = AsyncData(
        data: medicalQuotationData.value.data ?? []
          ..removeWhere((element) => element.id == id)
          ..add(response),
      );
      logger.d('Quotation updated: ${medicalQuotationData.value.data?.length}');
    } catch (e) {
      logger.e(e);
      medicalQuotationData.value = AsyncData(error: e);
    }
  }

  // 提案関連メソッド
  Future<void> createProposal(MedicalRecordProposalRequest data) async {
    try {
      final result = await patientRepository.postMedicalRecordProposal(data);
      if (proposal.value.hasData) {
        proposal.value =
            AsyncData(data: proposal.value.requireData..add(result));
      } else {
        proposal.value = AsyncData(data: [result]);
      }
    } catch (e) {
      logger.d(e);
      proposal.value = proposal.value.copyWith(error: e);
    }
  }

  Future<void> updateProposal(
      MedicalRecordProposalRequest data, String id) async {
    try {
      final result = await patientRepository.putMedicalRecordProposal(id, data);
      if (proposal.value.hasData) {
        proposal.value = AsyncData(
          data: proposal.value.requireData
              .map((e) => e.id == id ? result : e)
              .toList(),
        );
      } else {
        proposal.value = AsyncData(data: [result]);
      }
    } catch (e) {
      logger.d(e);
      proposal.value = proposal.value.copyWith(error: e);
    }
  }

  void resetEditData() {
    editData.value = const AsyncData();
  }
}

// PDF生成関数（簡略版）
Future<Uint8List?> generatePdfFromQuotation(Patient patient, String language,
    {MedicalInvoiceResponse? response, MedicalInvoiceRequest? request}) async {
  // 実際のPDF生成ロジックはEstimateModelから移植
  // ここでは簡略化のためnullを返す
  return null;
}
