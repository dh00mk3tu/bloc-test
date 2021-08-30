
import 'dart:convert';

ClubModel clubModelFromJson(String str) => ClubModel.fromJson(json.decode(str));

String clubModelToJson(ClubModel data) => json.encode(data.toJson());



class ClubModel {
  late List<ClubModel> userClubs;

  ClubModel({
    required this.userClubs
  });

  ClubModel.fromJson(dynamic json) {
    if (json['user_clubs'] != null) {
      userClubs = [];
      json['user_clubs'].forEach((v) {
        userClubs.add(ClubModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (userClubs != null) {
      map['user_clubs'] = userClubs.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class User_clubs {
  int? clubId;
  String? userAccountId;
  String? status;
  String? role;
  Club_details? clubDetails;
  List<User_channels>? userChannels;

  User_clubs({
      this.clubId, 
      this.userAccountId, 
      this.status, 
      this.role, 
      this.clubDetails, 
      this.userChannels});

  User_clubs.fromJson(dynamic json) {
    clubId = json['club_id'];
    userAccountId = json['user_account_id'];
    status = json['status'];
    role = json['role'];
    clubDetails = json['club_details'] != null ? Club_details.fromJson(json['clubDetails']) : null;
    if (json['user_channels'] != null) {
      userChannels = [];
      json['user_channels'].forEach((v) {
        userChannels?.add(User_channels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['club_id'] = clubId;
    map['user_account_id'] = userAccountId;
    map['status'] = status;
    map['role'] = role;
    if (clubDetails != null) {
      map['club_details'] = clubDetails?.toJson();
    }
    if (userChannels != null) {
      map['user_channels'] = userChannels?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class User_channels {
  String? cid;
  String? secondaryCid;
  String? userAccountId;
  String? status;
  String? role;
  String? channelTier;
  bool? isMuted;
  String? userChannelInviteCode;
  ChannelDetails? channelDetails;

  User_channels({
      this.cid, 
      this.secondaryCid, 
      this.userAccountId, 
      this.status, 
      this.role, 
      this.channelTier, 
      this.isMuted, 
      this.userChannelInviteCode, 
      this.channelDetails});

  User_channels.fromJson(dynamic json) {
    cid = json['cid'];
    secondaryCid = json['secondary_cid'];
    userAccountId = json['userAccountId'];
    status = json['status'];
    role = json['role'];
    channelTier = json['channel_tier'];
    isMuted = json['is_muted'];
    userChannelInviteCode = json['user_channel_invite_code'];
    channelDetails = json['channelDetails'] != null ? ChannelDetails.fromJson(json['channelDetails']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cid'] = cid;
    map['secondary_cid'] = secondaryCid;
    map['userAccountId'] = userAccountId;
    map['status'] = status;
    map['role'] = role;
    map['channel_tier'] = channelTier;
    map['is_muted'] = isMuted;
    map['user_channel_invite_code'] = userChannelInviteCode;
    if (channelDetails != null) {
      map['channelDetails'] = channelDetails?.toJson();
    }
    return map;
  }

}

class ChannelDetails {
  int? id;
  String? channelId;
  String? type;
  String? cid;
  String? createdById;
  String? name;
  String? img;
  String? description;
  String? disclaimer;
  dynamic? subtitle;
  String? inviteCode;
  String? createdAt;
  String? modifiedAt;
  String? secondaryChannelType;
  String? secondaryChannelId;
  String? clubType;
  String? channelTier;
  String? reportCardLink;

  ChannelDetails({
      this.id, 
      this.channelId, 
      this.type, 
      this.cid, 
      this.createdById, 
      this.name, 
      this.img, 
      this.description, 
      this.disclaimer, 
      this.subtitle, 
      this.inviteCode, 
      this.createdAt, 
      this.modifiedAt, 
      this.secondaryChannelType, 
      this.secondaryChannelId, 
      this.clubType, 
      this.channelTier, 
      this.reportCardLink});

  ChannelDetails.fromJson(dynamic json) {
    id = json['id'];
    channelId = json['channelId'];
    type = json['type'];
    cid = json['cid'];
    createdById = json['created_by_id'];
    name = json['name'];
    img = json['img'];
    description = json['description'];
    disclaimer = json['disclaimer'];
    subtitle = json['subtitle'];
    inviteCode = json['inviteCode'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    secondaryChannelType = json['secondary_channel_type'];
    secondaryChannelId = json['secondary_channel_id'];
    clubType = json['clubType'];
    channelTier = json['channelTier'];
    reportCardLink = json['reportCardLink'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['channelId'] = channelId;
    map['type'] = type;
    map['cid'] = cid;
    map['created_by_id'] = createdById;
    map['name'] = name;
    map['img'] = img;
    map['description'] = description;
    map['disclaimer'] = disclaimer;
    map['subtitle'] = subtitle;
    map['inviteCode'] = inviteCode;
    map['createdAt'] = createdAt;
    map['modifiedAt'] = modifiedAt;
    map['secondary_channel_type'] = secondaryChannelType;
    map['secondary_channel_id'] = secondaryChannelId;
    map['clubType'] = clubType;
    map['channelTier'] = channelTier;
    map['reportCardLink'] = reportCardLink;
    return map;
  }

}

class Club_details {
  int? id;
  String? name;
  String? type;
  String? createdById;
  String? img;
  String? description;
  String? disclaimer;
  String? subtitle;
  String? createdAt;
  String? modifiedAt;
  String? dmStatus;
  List<dynamic>? channels;

  Club_details({
      this.id, 
      this.name, 
      this.type, 
      this.createdById, 
      this.img, 
      this.description, 
      this.disclaimer, 
      this.subtitle, 
      this.createdAt, 
      this.modifiedAt, 
      this.dmStatus, 
      this.channels});

  Club_details.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdById = json['createdById'];
    img = json['img'];
    description = json['description'];
    disclaimer = json['disclaimer'];
    subtitle = json['subtitle'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    dmStatus = json['dmStatus'];
    // if (json['channels'] != null) {  
    //   channels = [];
    //   json['channels'].forEach((v) {
    //     channels?.add(dynamic.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['createdById'] = createdById;
    map['img'] = img;
    map['description'] = description;
    map['disclaimer'] = disclaimer;
    map['subtitle'] = subtitle;
    map['createdAt'] = createdAt;
    map['modifiedAt'] = modifiedAt;
    map['dmStatus'] = dmStatus;
    if (channels != null) {
      map['channels'] = channels?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}