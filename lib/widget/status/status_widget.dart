import 'package:library_core/widget/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_core/styles/my_color.dart';
import 'package:library_core/styles/my_style.dart';
import 'package:library_core/misc/constant.dart';

class StatusWidget {
  static rectangle({required String status}){
    switch(status.toLowerCase()) {
      case 'draft': //Pending
        return ChipWidget(isBullet: true, label: status, labelColor: MyColor.blue[700], backgroundColor: MyColor.blue[100]);
      case 'konsep': //Pending
        return ChipWidget(isBullet: true, label: status, labelColor: MyColor.blue[700], backgroundColor: MyColor.blue[100]);
      case 'active': //Approved
        return ChipWidget(isBullet: true, label: STATUS_ACTIVE, labelColor: MyColor.green[700], backgroundColor: MyColor.green[100]);
      case 'aktif': //Approved
        return ChipWidget(isBullet: true, label: STATUS_ACTIVE, labelColor: MyColor.green[700], backgroundColor: MyColor.green[100]);
      case 'inactive': //Waiting Payment
        return ChipWidget(isBullet: true, label: STATUS_IN_ACTIVE, labelColor: MyColor.red[700], backgroundColor: MyColor.red[100]);
      case 'not active': //Waiting Payment
        return ChipWidget(isBullet: true, label: STATUS_IN_ACTIVE, labelColor: MyColor.red[700], backgroundColor: MyColor.red[100]);
      default:
        return Container();
    }
  }

  static payment({required String status}){
    switch(status.toLowerCase()) {
      case 'draft': //Pending
        return ChipWidget(isBullet: true, label: STATUS_PAY_DRAFT, labelColor: MyColor.draft, backgroundColor: MyColor.bgDraft);
      case 'in progress': //Pending
        return ChipWidget(isBullet: true, label: STATUS_PAY_IN_PROGRESS, labelColor: MyColor.inProgress, backgroundColor: MyColor.bgInProgress);
      case 'ready to release': //Approved
        return ChipWidget(isBullet: true, label: STATUS_PAY_READY_TO_RELEASE, labelColor: MyColor.readyToRelease, backgroundColor: MyColor.bgReadyToRelease);
      case 'released': //Approved
        return ChipWidget(isBullet: true, label: STATUS_PAY_RELEASE, labelColor: MyColor.release, backgroundColor: MyColor.bgRelease);
      case 'rejected': //Waiting Payment
        return ChipWidget(isBullet: true, label: STATUS_PAY_REJECTED, labelColor: MyColor.rejected, backgroundColor: MyColor.bgRejected);
      case 'paid': //Waiting Payment
        return ChipWidget(isBullet: true, label: STATUS_PAY_PAID, labelColor: MyColor.paid, backgroundColor: MyColor.bgPaid);
      case 'canceled': //Waiting Payment
        return ChipWidget(isBullet: true, label: STATUS_PAY_CANCELED, labelColor: MyColor.canceled, backgroundColor: MyColor.bgCanceled);
      default:
        return Container();
    }
  }
}