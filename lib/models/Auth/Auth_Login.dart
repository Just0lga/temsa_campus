// ignore_for_file: unnecessary_question_mark

class AuthModel {
  User? user;
  Token? token;

  AuthModel({this.user, this.token});

  AuthModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? surname;
  String? email;
  String? internalPhoneNumber;
  String? birthday;
  String? titleName;
  String? titleId;
  int? languageId;
  bool? isAuthorizedForAllVehicle;
  bool? isAuthorizedForAllRegion;
  List<UserRoleApplications>? userRoleApplications;
  List<Null>? userRegions;
  List<Null>? userVehicleModels;
  List<Null>? delegations;
  String? delegatedUserId;
  Null? delegatedUserName;
  Null? delegatedUserSurname;
  Null? delegatedUserPersonelId;
  Null? delegatedUserIsManager;
  String? countryId;
  Null? countryCode;
  String? managerId;
  String? countryLocationId;
  bool? isManager;
  bool? isApproverUser;
  int? personelId;
  String? campusCountryId;
  Null? campusCountryLanguageCode;
  Null? campusCountryCode;
  bool? clarificationTextApproved;
  bool? userNoticeTextApproved;
  Null? sessionId;
  String? departmentId;
  String? mobileNumber;
  Null? jobStartImageExtension;
  Null? jobStartImagePath;
  Null? jobStartImageName;

  User(
      {this.id,
      this.name,
      this.surname,
      this.email,
      this.internalPhoneNumber,
      this.birthday,
      this.titleName,
      this.titleId,
      this.languageId,
      this.isAuthorizedForAllVehicle,
      this.isAuthorizedForAllRegion,
      this.userRoleApplications,
      this.userRegions,
      this.userVehicleModels,
      this.delegations,
      this.delegatedUserId,
      this.delegatedUserName,
      this.delegatedUserSurname,
      this.delegatedUserPersonelId,
      this.delegatedUserIsManager,
      this.countryId,
      this.countryCode,
      this.managerId,
      this.countryLocationId,
      this.isManager,
      this.isApproverUser,
      this.personelId,
      this.campusCountryId,
      this.campusCountryLanguageCode,
      this.campusCountryCode,
      this.clarificationTextApproved,
      this.userNoticeTextApproved,
      this.sessionId,
      this.departmentId,
      this.mobileNumber,
      this.jobStartImageExtension,
      this.jobStartImagePath,
      this.jobStartImageName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    internalPhoneNumber = json['internalPhoneNumber'];
    birthday = json['birthday'];
    titleName = json['titleName'];
    titleId = json['titleId'];
    languageId = json['languageId'];
    isAuthorizedForAllVehicle = json['isAuthorizedForAllVehicle'];
    isAuthorizedForAllRegion = json['isAuthorizedForAllRegion'];
    if (json['userRoleApplications'] != null) {
      userRoleApplications = <UserRoleApplications>[];
      json['userRoleApplications'].forEach((v) {
        userRoleApplications!.add(new UserRoleApplications.fromJson(v));
      });
    }

    delegatedUserId = json['delegatedUserId'];
    delegatedUserName = json['delegatedUserName'];
    delegatedUserSurname = json['delegatedUserSurname'];
    delegatedUserPersonelId = json['delegatedUserPersonelId'];
    delegatedUserIsManager = json['delegatedUserIsManager'];
    countryId = json['countryId'];
    countryCode = json['countryCode'];
    managerId = json['managerId'];
    countryLocationId = json['countryLocationId'];
    isManager = json['isManager'];
    isApproverUser = json['isApproverUser'];
    personelId = json['personelId'];
    campusCountryId = json['campusCountryId'];
    campusCountryLanguageCode = json['campusCountryLanguageCode'];
    campusCountryCode = json['campusCountryCode'];
    clarificationTextApproved = json['clarificationTextApproved'];
    userNoticeTextApproved = json['userNoticeTextApproved'];
    sessionId = json['sessionId'];
    departmentId = json['departmentId'];
    mobileNumber = json['mobileNumber'];
    jobStartImageExtension = json['jobStartImageExtension'];
    jobStartImagePath = json['jobStartImagePath'];
    jobStartImageName = json['jobStartImageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['internalPhoneNumber'] = this.internalPhoneNumber;
    data['birthday'] = this.birthday;
    data['titleName'] = this.titleName;
    data['titleId'] = this.titleId;
    data['languageId'] = this.languageId;
    data['isAuthorizedForAllVehicle'] = this.isAuthorizedForAllVehicle;
    data['isAuthorizedForAllRegion'] = this.isAuthorizedForAllRegion;
    if (this.userRoleApplications != null) {
      data['userRoleApplications'] =
          this.userRoleApplications!.map((v) => v.toJson()).toList();
    }

    data['delegatedUserId'] = this.delegatedUserId;
    data['delegatedUserName'] = this.delegatedUserName;
    data['delegatedUserSurname'] = this.delegatedUserSurname;
    data['delegatedUserPersonelId'] = this.delegatedUserPersonelId;
    data['delegatedUserIsManager'] = this.delegatedUserIsManager;
    data['countryId'] = this.countryId;
    data['countryCode'] = this.countryCode;
    data['managerId'] = this.managerId;
    data['countryLocationId'] = this.countryLocationId;
    data['isManager'] = this.isManager;
    data['isApproverUser'] = this.isApproverUser;
    data['personelId'] = this.personelId;
    data['campusCountryId'] = this.campusCountryId;
    data['campusCountryLanguageCode'] = this.campusCountryLanguageCode;
    data['campusCountryCode'] = this.campusCountryCode;
    data['clarificationTextApproved'] = this.clarificationTextApproved;
    data['userNoticeTextApproved'] = this.userNoticeTextApproved;
    data['sessionId'] = this.sessionId;
    data['departmentId'] = this.departmentId;
    data['mobileNumber'] = this.mobileNumber;
    data['jobStartImageExtension'] = this.jobStartImageExtension;
    data['jobStartImagePath'] = this.jobStartImagePath;
    data['jobStartImageName'] = this.jobStartImageName;
    return data;
  }
}

class UserRoleApplications {
  int? applicationId;
  Role? role;

  UserRoleApplications({this.applicationId, this.role});

  UserRoleApplications.fromJson(Map<String, dynamic> json) {
    applicationId = json['applicationId'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicationId'] = this.applicationId;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}

class Role {
  String? id;
  String? name;
  SystemRole? systemRole;
  List<RolePermissions>? rolePermissions;

  Role({this.id, this.name, this.systemRole, this.rolePermissions});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    systemRole = json['systemRole'] != null
        ? new SystemRole.fromJson(json['systemRole'])
        : null;
    if (json['rolePermissions'] != null) {
      rolePermissions = <RolePermissions>[];
      json['rolePermissions'].forEach((v) {
        rolePermissions!.add(new RolePermissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.systemRole != null) {
      data['systemRole'] = this.systemRole!.toJson();
    }
    if (this.rolePermissions != null) {
      data['rolePermissions'] =
          this.rolePermissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SystemRole {
  int? id;
  String? name;
  int? applicationId;

  SystemRole({this.id, this.name, this.applicationId});

  SystemRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    applicationId = json['applicationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['applicationId'] = this.applicationId;
    return data;
  }
}

class RolePermissions {
  String? roleId;
  String? permissionId;
  Permission? permission;

  RolePermissions({this.roleId, this.permissionId, this.permission});

  RolePermissions.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    permissionId = json['permissionId'];
    permission = json['permission'] != null
        ? new Permission.fromJson(json['permission'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['permissionId'] = this.permissionId;
    if (this.permission != null) {
      data['permission'] = this.permission!.toJson();
    }
    return data;
  }
}

class Permission {
  String? id;
  String? code;
  String? name;
  int? sort;
  int? permissionTypeId;

  Permission({this.id, this.code, this.name, this.sort, this.permissionTypeId});

  Permission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    sort = json['sort'];
    permissionTypeId = json['permissionTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['sort'] = this.sort;
    data['permissionTypeId'] = this.permissionTypeId;
    return data;
  }
}

class Token {
  String? accessToken;
  int? expiresIn;
  String? tokenType;

  Token({this.accessToken, this.expiresIn, this.tokenType});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    return data;
  }
}

/*class AuthModelUser {
  String? id;
  String? name;
  String? surname;

  AuthModelUser({
    this.id,
    this.name,
    this.surname,
  });
  AuthModelUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    return data;
  }
}

class AuthModel {
  AuthModelUser? user;

  AuthModel({
    this.user,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null) ? AuthModelUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}*/
