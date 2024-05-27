enum StatusEnum { active, inactive, draft }

extension StatusEnumExt on StatusEnum {
  static StatusEnum parse(int status) {
    switch (status) {
      case 0:
        return StatusEnum.inactive;
      case 1:
        return StatusEnum.active;
      case 2:
        return StatusEnum.draft;
      default:
        return StatusEnum.active;
    }
  }

  static int parseBoolToInt(bool value) {
    switch (value) {
      case true:
        return StatusEnum.active.toInt;
      case false:
        return StatusEnum.inactive.toInt;
      default:
        return StatusEnum.active.toInt;
    }
  }

  String get label {
    switch (this) {
      case StatusEnum.active:
        return 'Aktif';
      case StatusEnum.draft:
        return 'Konsep';
      case StatusEnum.inactive:
        return 'Non-Aktif';
      default:
        return 'Aktif';
    }
  }

  int get toInt {
    switch (this) {
      case StatusEnum.inactive:
        return 0;
      case StatusEnum.active:
        return 1;
      case StatusEnum.draft:
        return 2;
      default:
        return 1;
    }
  }
}

enum Acl {
  createRole,
  readRole,
  updateRole,
  deleteRole,
  readRoleMenu,
  createJob,
  readJob,
  updateJob,
  deleteJob,
  readJobMenu,
  createUser,
  readUser,
  updateUser,
  deleteUser,
  readUserMenu,
  createPermission,
  readPermission,
  updatePermission,
  deletePermission,
  readPermissionMenu,
  createRegion,
  readRegion,
  updateRegion,
  deleteRegion,
  readRegionMenu,
  createArea,
  readArea,
  updateArea,
  deleteArea,
  readAreaMenu,
  createCompany,
  readCompany,
  updateCompany,
  deleteCompany,
  readCompanyMenu,
  createCurrency,
  readCurrency,
  updateCurrency,
  deleteCurrency,
  readCurrencyMenu,
  createBankAccountType,
  readBankAccountType,
  updateBankAccountType,
  deleteBankAccountType,
  readBankAccountTypeMenu,
  createCustomerType,
  readCustomerType,
  updateCustomerType,
  deleteCustomerType,
  readCustomerTypeMenu,
  createCustomerAccountType,
  readCustomerAccountType,
  updateCustomerAccountType,
  deleteCustomerAccountType,
  readCustomerAccountTypeMenu,
  createFundAllocationCategory,
  readFundAllocationCategory,
  updateFundAllocationCategory,
  deleteFundAllocationCategory,
  readFundAllocationCategoryMenu,
  createPaymentCategory,
  readPaymentCategory,
  updatePaymentCategory,
  deletePaymentCategory,
  readPaymentCategoryMenu,
  createPaymentType,
  readPaymentType,
  updatePaymentType,
  deletePaymentType,
  readPaymentTypeMenu,
  createPaymentChannel,
  readPaymentChannel,
  updatePaymentChannel,
  deletePaymentChannel,
  readPaymentChannelMenu,
  createBillType,
  readBillType,
  updateBillType,
  deleteBillType,
  readBillTypeMenu,
  createAgingReceivableGroup,
  readAgingReceivableGroup,
  updateAgingReceivableGroup,
  deleteAgingReceivableGroup,
  readAgingReceivableGroupMenu,
  createCustomerGroup,
  readCustomerGroup,
  updateCustomerGroup,
  deleteCustomerGroup,
  readCustomerGroupMenu,
  createAccount,
  readAccount,
  updateAccount,
  deleteAccount,
  readAccountMenu,
  createBank,
  readBank,
  updateBank,
  deleteBank,
  readBankMenu,
  createCustomer,
  readCustomer,
  updateCustomer,
  deleteCustomer,
  readCustomerMenu,
  createAccountReceivable,
  readAccountReceivable,
  updateAccountReceivable,
  deleteAccountReceivable,
  readAccountReceivableMenu,
  createPlacementFund,
  readPlacementFund,
  updatePlacementFund,
  deletePlacementFund,
  readPlacementFundMenu,
  createBankBalance,
  readBankBalance,
  updateBankBalance,
  deleteBankBalance,
  readBankBalanceMenu,
  createPayment,
  readPayment,
  updatePayment,
  deletePayment,
  readPaymentMenu,
  readPenerimaan,
  readPenerimaanMenu,
  createCurrencyLog,
  readCurrencyLog,
  updateCurrencyLog,
  deleteCurrencyLog,
  readCurrencyLogMenu,
  readReportAgingGroupMenu,
  readReportAgingGroup,
  readReportSummaryPiutangMenu,
  readReportSummaryPiutang,
  readReportBankBalanceMenu,
  readReportBankBalance,
  readReportPlacementFund,
  readReportPlacementFundMenu,
  readReportRealisasiPenerimaanMenu,
  readReportPenerimaan,
  readReportRencanaPenerimaanMenu,
  readReportRealisasiPembayaranMenu,
  readReportRencanaPembayaranMenu,
  readReportPembayaran,
  readIdleCashMenu,
  readDashboardMenu,
  createKelompokPelanggan,
  updateKelompokPelanggan,
  readKelompokPelanggan,
  deleteKelompokPelanggan,
  readKelompokpelangganMenu,
  unknown,
}

extension AclExtension on Acl {
  String get value {
    switch (this) {
      case Acl.createRole:
        return 'create-role';
      case Acl.readRole:
        return 'read-role';
      case Acl.updateRole:
        return 'update-role';
      case Acl.deleteRole:
        return 'delete-role';
      case Acl.readRoleMenu:
        return 'read-role-menu';
      case Acl.createJob:
        return 'create-job';
      case Acl.readJob:
        return 'read-job';
      case Acl.updateJob:
        return 'update-job';
      case Acl.deleteJob:
        return 'delete-job';
      case Acl.readJobMenu:
        return 'read-job-menu';
      case Acl.createUser:
        return 'create-user';
      case Acl.readUser:
        return 'read-user';
      case Acl.updateUser:
        return 'update-user';
      case Acl.deleteUser:
        return 'delete-user';
      case Acl.readUserMenu:
        return 'read-user-menu';
      case Acl.createPermission:
        return 'create-permission';
      case Acl.readPermission:
        return 'read-permission';
      case Acl.updatePermission:
        return 'update-permission';
      case Acl.deletePermission:
        return 'delete-permission';
      case Acl.readPermissionMenu:
        return 'read-permission-menu';
      case Acl.createRegion:
        return 'create-region';
      case Acl.readRegion:
        return 'read-region';
      case Acl.updateRegion:
        return 'update-region';
      case Acl.deleteRegion:
        return 'delete-region';
      case Acl.readRegionMenu:
        return 'read-region-menu';
      case Acl.createArea:
        return 'create-area';
      case Acl.readArea:
        return 'read-area';
      case Acl.updateArea:
        return 'update-area';
      case Acl.deleteArea:
        return 'delete-area';
      case Acl.readAreaMenu:
        return 'read-area-menu';
      case Acl.createCompany:
        return 'create-company';
      case Acl.readCompany:
        return 'read-company';
      case Acl.updateCompany:
        return 'update-company';
      case Acl.deleteCompany:
        return 'delete-company';
      case Acl.readCompanyMenu:
        return 'read-company-menu';
      case Acl.createCurrency:
        return 'create-currency';
      case Acl.readCurrency:
        return 'read-currency';
      case Acl.updateCurrency:
        return 'update-currency';
      case Acl.deleteCurrency:
        return 'delete-currency';
      case Acl.readCurrencyMenu:
        return 'read-currency-menu';
      case Acl.createBankAccountType:
        return 'create-bank-account-type';
      case Acl.readBankAccountType:
        return 'read-bank-account-type';
      case Acl.updateBankAccountType:
        return 'update-bank-account-type';
      case Acl.deleteBankAccountType:
        return 'delete-bank-account-type';
      case Acl.readBankAccountTypeMenu:
        return 'read-bank-account-type-menu';
      case Acl.createCustomerType:
        return 'create-customer-type';
      case Acl.readCustomerType:
        return 'read-customer-type';
      case Acl.updateCustomerType:
        return 'update-customer-type';
      case Acl.deleteCustomerType:
        return 'delete-customer-type';
      case Acl.readCustomerTypeMenu:
        return 'read-customer-type-menu';
      case Acl.createCustomerAccountType:
        return 'create-customer-account-type';
      case Acl.readCustomerAccountType:
        return 'read-customer-account-type';
      case Acl.updateCustomerAccountType:
        return 'update-customer-account-type';
      case Acl.deleteCustomerAccountType:
        return 'delete-customer-account-type';
      case Acl.readCustomerAccountTypeMenu:
        return 'read-customer-account-type-menu';
      case Acl.createFundAllocationCategory:
        return 'create-fund-allocation-category';
      case Acl.readFundAllocationCategory:
        return 'read-fund-allocation-category';
      case Acl.updateFundAllocationCategory:
        return 'update-fund-allocation-category';
      case Acl.deleteFundAllocationCategory:
        return 'delete-fund-allocation-category';
      case Acl.readFundAllocationCategoryMenu:
        return 'read-fund-allocation-category-menu';
      case Acl.createPaymentCategory:
        return 'create-payment-category';
      case Acl.readPaymentCategory:
        return 'read-payment-category';
      case Acl.updatePaymentCategory:
        return 'update-payment-category';
      case Acl.deletePaymentCategory:
        return 'delete-payment-category';
      case Acl.readPaymentCategoryMenu:
        return 'read-payment-category-menu';
      case Acl.createPaymentChannel:
        return 'create-paymentchannel';
      case Acl.readPaymentChannel:
        return 'read-paymentchannel';
      case Acl.updatePaymentChannel:
        return 'update-paymentchannel';
      case Acl.deletePaymentChannel:
        return 'delete-paymentchannel';
      case Acl.readPaymentChannelMenu:
        return 'read-paymentchannel-menu';
      case Acl.createBillType:
        return 'create-bill-type';
      case Acl.readBillType:
        return 'read-bill-type';
      case Acl.updateBillType:
        return 'update-bill-type';
      case Acl.deleteBillType:
        return 'delete-bill-type';
      case Acl.readBillTypeMenu:
        return 'read-bill-type-menu';
      case Acl.createPaymentType:
        return 'create-payment-type';
      case Acl.readPaymentType:
        return 'read-payment-type';
      case Acl.updatePaymentType:
        return 'update-payment-type';
      case Acl.deletePaymentType:
        return 'delete-payment-type';
      case Acl.readPaymentTypeMenu:
        return 'read-payment-type-menu';
      case Acl.createAgingReceivableGroup:
        return 'create-aging-receivable-group';
      case Acl.readAgingReceivableGroup:
        return 'read-aging-receivable-group';
      case Acl.updateAgingReceivableGroup:
        return 'update-aging-receivable-group';
      case Acl.deleteAgingReceivableGroup:
        return 'delete-aging-receivable-group';
      case Acl.readAgingReceivableGroupMenu:
        return 'read-aging-receivable-group-menu';
      case Acl.createCustomerGroup:
        return 'create-customer-group';
      case Acl.readCustomerGroup:
        return 'read-customer-group';
      case Acl.updateCustomerGroup:
        return 'update-customer-group';
      case Acl.deleteCustomerGroup:
        return 'delete-customer-group';
      case Acl.readCustomerGroupMenu:
        return 'read-customer-group-menu';
      case Acl.createAccount:
        return 'create-account';
      case Acl.readAccount:
        return 'read-account';
      case Acl.updateAccount:
        return 'update-account';
      case Acl.deleteAccount:
        return 'delete-account';
      case Acl.readAccountMenu:
        return 'read-account-menu';
      case Acl.createBank:
        return 'create-bank';
      case Acl.readBank:
        return 'read-bank';
      case Acl.updateBank:
        return 'update-bank';
      case Acl.deleteBank:
        return 'delete-bank';
      case Acl.readBankMenu:
        return 'read-bank-menu';
      case Acl.createCustomer:
        return 'create-customer';
      case Acl.readCustomer:
        return 'read-customer';
      case Acl.updateCustomer:
        return 'update-customer';
      case Acl.deleteCustomer:
        return 'delete-customer';
      case Acl.readCustomerMenu:
        return 'read-customer-menu';
      case Acl.createAccountReceivable:
        return 'create-accountreceivable';
      case Acl.readAccountReceivable:
        return 'read-accountreceivable';
      case Acl.updateAccountReceivable:
        return 'update-accountreceivable';
      case Acl.deleteAccountReceivable:
        return 'delete-accountreceivable';
      case Acl.readAccountReceivableMenu:
        return 'read-accountreceivable-menu';
      case Acl.createPlacementFund:
        return 'create-placement-fund';
      case Acl.readPlacementFund:
        return 'read-placement-fund';
      case Acl.updatePlacementFund:
        return 'update-placement-fund';
      case Acl.deletePlacementFund:
        return 'delete-placement-fund';
      case Acl.readPlacementFundMenu:
        return 'read-placement-fund-menu';
      case Acl.createBankBalance:
        return 'create-bank-balance';
      case Acl.readBankBalance:
        return 'read-bank-balance';
      case Acl.updateBankBalance:
        return 'update-bank-balance';
      case Acl.deleteBankBalance:
        return 'delete-bank-balance';
      case Acl.readBankBalanceMenu:
        return 'read-bank-balance-menu';
      case Acl.createPayment:
        return 'create-trpayment';
      case Acl.readPayment:
        return 'read-trpayment';
      case Acl.updatePayment:
        return 'update-trpayment';
      case Acl.deletePayment:
        return 'delete-trpayment';
      case Acl.readPaymentMenu:
        return 'read-trpayment-menu';
      case Acl.readPenerimaan:
        return 'read-trinvoice';
      case Acl.readPenerimaanMenu:
        return 'read-trinvoice-menu';
      case Acl.createCurrencyLog:
        return 'create-trcurrencylogs';
      case Acl.readCurrencyLog:
        return 'read-trcurrencylogs';
      case Acl.updateCurrencyLog:
        return 'update-trcurrencylogs';
      case Acl.deleteCurrencyLog:
        return 'delete-trcurrencylogs';
      case Acl.readCurrencyLogMenu:
        return 'read-trcurrencylog-menu';
      case Acl.readIdleCashMenu:
        return 'report-idle-cash-menu';
      case Acl.readDashboardMenu:
        return 'read-dashboard-menu';
      case Acl.readReportAgingGroupMenu:
        return 'report-aginggroup-menu';
      case Acl.readReportAgingGroup:
        return 'report-aginggroup';
      case Acl.readReportSummaryPiutangMenu:
        return 'report-summarypiutang-menu';
      case Acl.readReportSummaryPiutang:
        return 'report-summarypiutang';
      case Acl.readReportBankBalanceMenu:
        return 'report-bankbalance-menu';
      case Acl.readReportBankBalance:
        return 'report-bankbalance';
      case Acl.readReportPlacementFund:
        return 'report-placementfund';
      case Acl.readReportPlacementFundMenu:
        return 'report-placementfundmenu';
      case Acl.readReportRealisasiPenerimaanMenu:
        return 'report-realisasi-penerimaan-menu';
      case Acl.readReportPenerimaan:
        return 'report-penerimaan';
      case Acl.readReportRencanaPenerimaanMenu:
        return 'report-rencana-penerimaan-menu';
      case Acl.readReportRealisasiPembayaranMenu:
        return 'report-realisasi-pembayaran-menu';
      case Acl.readReportRencanaPembayaranMenu:
        return 'report-rencana-pembayaran-menu';
      case Acl.readReportPembayaran:
        return 'report-pembayaran';
      case Acl.createKelompokPelanggan:
        return 'create-kelompokpelanggan';
      case Acl.updateKelompokPelanggan:
        return 'update-kelompokpelanggan';
      case Acl.readKelompokPelanggan:
        return 'read-kelompokpelanggan';
      case Acl.deleteKelompokPelanggan:
        return 'delete-kelompokpelanggan';
      case Acl.readKelompokpelangganMenu:
        return 'read-kelompokpelanggan-menu';
      case Acl.unknown:
        return 'unknown';
    }
  }

  static Acl? parse(String value) {
    switch (value) {
      case 'create-role':
        return Acl.createRole;
      case 'read-role':
        return Acl.readRole;
      case 'update-role':
        return Acl.updateRole;
      case 'delete-role':
        return Acl.deleteRole;
      case 'read-role-menu':
        return Acl.readRoleMenu;
      case 'create-job':
        return Acl.createJob;
      case 'read-job':
        return Acl.readJob;
      case 'update-job':
        return Acl.updateJob;
      case 'delete-job':
        return Acl.deleteJob;
      case 'read-job-menu':
        return Acl.readJobMenu;
      case 'create-user':
        return Acl.createUser;
      case 'read-user':
        return Acl.readUser;
      case 'update-user':
        return Acl.updateUser;
      case 'delete-user':
        return Acl.deleteUser;
      case 'read-user-menu':
        return Acl.readUserMenu;
      case 'create-permission':
        return Acl.createPermission;
      case 'read-permission':
        return Acl.readPermission;
      case 'update-permission':
        return Acl.updatePermission;
      case 'delete-permission':
        return Acl.deletePermission;
      case 'read-permission-menu':
        return Acl.readPermissionMenu;
      case 'create-region':
        return Acl.createRegion;
      case 'read-region':
        return Acl.readRegion;
      case 'update-region':
        return Acl.updateRegion;
      case 'delete-region':
        return Acl.deleteRegion;
      case 'read-region-menu':
        return Acl.readRegionMenu;
      case 'create-area':
        return Acl.createArea;
      case 'read-area':
        return Acl.readArea;
      case 'update-area':
        return Acl.updateArea;
      case 'delete-area':
        return Acl.deleteArea;
      case 'read-area-menu':
        return Acl.readAreaMenu;
      case 'create-company':
        return Acl.createCompany;
      case 'read-company':
        return Acl.readCompany;
      case 'update-company':
        return Acl.updateCompany;
      case 'delete-company':
        return Acl.deleteCompany;
      case 'read-company-menu':
        return Acl.readCompanyMenu;
      case 'create-currency':
        return Acl.createCurrency;
      case 'read-currency':
        return Acl.readCurrency;
      case 'update-currency':
        return Acl.updateCurrency;
      case 'delete-currency':
        return Acl.deleteCurrency;
      case 'read-currency-menu':
        return Acl.readCurrencyMenu;
      case 'create-bank-account-type':
        return Acl.createBankAccountType;
      case 'read-bank-account-type':
        return Acl.readBankAccountType;
      case 'update-bank-account-type':
        return Acl.updateBankAccountType;
      case 'delete-bank-account-type':
        return Acl.deleteBankAccountType;
      case 'read-bank-account-type-menu':
        return Acl.readBankAccountTypeMenu;
      case 'create-customer-type':
        return Acl.createCustomerType;
      case 'read-customer-type':
        return Acl.readCustomerType;
      case 'update-customer-type':
        return Acl.updateCustomerType;
      case 'delete-customer-type':
        return Acl.deleteCustomerType;
      case 'read-customer-type-menu':
        return Acl.readCustomerTypeMenu;
      case 'create-customer-account-type':
        return Acl.createCustomerAccountType;
      case 'read-customer-account-type':
        return Acl.readCustomerAccountType;
      case 'update-customer-account-type':
        return Acl.updateCustomerAccountType;
      case 'delete-customer-account-type':
        return Acl.deleteCustomerAccountType;
      case 'read-customer-account-type-menu':
        return Acl.readCustomerAccountTypeMenu;
      case 'create-fund-allocation-category':
        return Acl.createFundAllocationCategory;
      case 'read-fund-allocation-category':
        return Acl.readFundAllocationCategory;
      case 'update-fund-allocation-category':
        return Acl.updateFundAllocationCategory;
      case 'delete-fund-allocation-category':
        return Acl.deleteFundAllocationCategory;
      case 'read-fund-allocation-category-menu':
        return Acl.readFundAllocationCategoryMenu;
      case 'create-payment-category':
        return Acl.createPaymentCategory;
      case 'read-payment-category':
        return Acl.readPaymentCategory;
      case 'update-payment-category':
        return Acl.updatePaymentCategory;
      case 'delete-payment-category':
        return Acl.deletePaymentCategory;
      case 'read-payment-category-menu':
        return Acl.readPaymentCategoryMenu;
      case 'create-paymentchannel':
        return Acl.createPaymentChannel;
      case 'read-paymentchannel':
        return Acl.readPaymentChannel;
      case 'update-paymentchannel':
        return Acl.updatePaymentChannel;
      case 'delete-paymentchannel':
        return Acl.deletePaymentChannel;
      case 'read-paymentchannel-menu':
        return Acl.readPaymentChannelMenu;
      case 'create-bill-type':
        return Acl.createBillType;
      case 'read-bill-type':
        return Acl.readBillType;
      case 'update-bill-type':
        return Acl.updateBillType;
      case 'delete-bill-type':
        return Acl.deleteBillType;
      case 'read-bill-type-menu':
        return Acl.readBillTypeMenu;
      case 'create-payment-type':
        return Acl.createPaymentType;
      case 'read-payment-type':
        return Acl.readPaymentType;
      case 'update-payment-type':
        return Acl.updatePaymentType;
      case 'delete-payment-type':
        return Acl.deletePaymentType;
      case 'read-payment-type-menu':
        return Acl.readPaymentTypeMenu;
      case 'create-aging-receivable-group':
        return Acl.createAgingReceivableGroup;
      case 'read-aging-receivable-group':
        return Acl.readAgingReceivableGroup;
      case 'update-aging-receivable-group':
        return Acl.updateAgingReceivableGroup;
      case 'delete-aging-receivable-group':
        return Acl.deleteAgingReceivableGroup;
      case 'read-aging-receivable-group-menu':
        return Acl.readAgingReceivableGroupMenu;
      case 'create-customer-group':
        return Acl.createCustomerGroup;
      case 'read-customer-group':
        return Acl.readCustomerGroup;
      case 'update-customer-group':
        return Acl.updateCustomerGroup;
      case 'delete-customer-group':
        return Acl.deleteCustomerGroup;
      case 'read-customer-group-menu':
        return Acl.readCustomerGroupMenu;
      case 'create-account':
        return Acl.createAccount;
      case 'read-account':
        return Acl.readAccount;
      case 'update-account':
        return Acl.updateAccount;
      case 'delete-account':
        return Acl.deleteAccount;
      case 'read-account-menu':
        return Acl.readAccountMenu;
      case 'create-bank':
        return Acl.createBank;
      case 'read-bank':
        return Acl.readBank;
      case 'update-bank':
        return Acl.updateBank;
      case 'delete-bank':
        return Acl.deleteBank;
      case 'read-bank-menu':
        return Acl.readBankMenu;
      case 'create-customer':
        return Acl.createCustomer;
      case 'read-customer':
        return Acl.readCustomer;
      case 'update-customer':
        return Acl.updateCustomer;
      case 'delete-customer':
        return Acl.deleteCustomer;
      case 'read-customer-menu':
        return Acl.readCustomerMenu;
      case 'create-accountreceivable':
        return Acl.createAccountReceivable;
      case 'read-accountreceivable':
        return Acl.readAccountReceivable;
      case 'update-accountreceivable':
        return Acl.updateAccountReceivable;
      case 'delete-accountreceivable':
        return Acl.deleteAccountReceivable;
      case 'read-accountreceivable-menu':
        return Acl.readAccountReceivableMenu;
      case 'create-placement-fund':
        return Acl.createPlacementFund;
      case 'read-placement-fund':
        return Acl.readPlacementFund;
      case 'update-placement-fund':
        return Acl.updatePlacementFund;
      case 'delete-placement-fund':
        return Acl.deletePlacementFund;
      case 'read-placement-fund-menu':
        return Acl.readPlacementFundMenu;
      case 'create-bank-balance':
        return Acl.createBankBalance;
      case 'read-bank-balance':
        return Acl.readBankBalance;
      case 'update-bank-balance':
        return Acl.updateBankBalance;
      case 'delete-bank-balance':
        return Acl.deleteBankBalance;
      case 'read-bank-balance-menu':
        return Acl.readBankBalanceMenu;
      case 'create-trpayment':
        return Acl.createPayment;
      case 'read-trpayment':
        return Acl.readPayment;
      case 'update-trpayment':
        return Acl.updatePayment;
      case 'delete-trpayment':
        return Acl.deletePayment;
      case 'read-trpayment-menu':
        return Acl.readPaymentMenu;
      case 'read-invoice':
        return Acl.readPenerimaan;
      case 'read-trinvoice-menu':
        return Acl.readPenerimaanMenu;
      case 'create-trcurrencylog':
        return Acl.createCurrencyLog;
      case 'read-trcurrencylog':
        return Acl.readCurrencyLog;
      case 'update-trcurrencylog':
        return Acl.updateCurrencyLog;
      case 'delete-trcurrencylog':
        return Acl.deleteCurrencyLog;
      case 'read-trcurrencylog-menu':
        return Acl.readCurrencyLogMenu;
      case 'report-idle-cash-menu':
        return Acl.readIdleCashMenu;
      case 'read-dashboard-menu':
        return Acl.readDashboardMenu;
      case 'report-aginggroup-menu':
        return Acl.readReportAgingGroupMenu;
      case 'report-aginggroup':
        return Acl.readReportAgingGroup;
      case 'report-summarypiutang-menu':
        return Acl.readReportSummaryPiutangMenu;
      case 'report-summarypiutang':
        return Acl.readReportSummaryPiutang;
      case 'report-bankbalance-menu':
        return Acl.readReportBankBalanceMenu;
      case 'report-bankbalance':
        return Acl.readReportBankBalance;
      case 'report-placementfund':
        return Acl.readReportPlacementFund;
      case 'report-placementfundmenu':
        return Acl.readReportPlacementFundMenu;
      case 'report-realisasi-penerimaan-menu':
        return Acl.readReportRealisasiPenerimaanMenu;
      case 'report-penerimaan':
        return Acl.readReportPenerimaan;
      case 'report-rencana-penerimaan-menu':
        return Acl.readReportRencanaPenerimaanMenu;
      case 'report-rencana-realisasi-pembayaran-menu':
        return Acl.readReportRealisasiPembayaranMenu;
      case 'report-rencana-pembayaran-menu':
        return Acl.readReportRencanaPembayaranMenu;
      case 'report-pembayaran':
        return Acl.readReportPembayaran;
      case 'create-kelompokpelanggan':
        return Acl.createKelompokPelanggan;
      case 'update-kelompokpelanggan':
        return Acl.updateKelompokPelanggan;
      case 'read-kelompokpelanggan':
        return Acl.readKelompokPelanggan;
      case 'delete-kelompokpelanggan':
        return Acl.deleteKelompokPelanggan;
      case 'read-kelompokpelanggan-menu':
        return Acl.readKelompokpelangganMenu;
      default:
        return Acl.unknown;
    }
  }
}
