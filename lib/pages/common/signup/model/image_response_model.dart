class ImageResponseModel {
  int? total;
  int? pageNumber;
  int? pageSize;
  dynamic? filter;
  List<ImageModel>? data;
  // List<Null>? messages;
  bool? isSuccess;
  dynamic? exception;

  ImageResponseModel(
      {this.total,
        this.pageNumber,
        this.pageSize,
        this.filter,
        this.data,
        // this.messages,
        this.isSuccess,
        this.exception});

  ImageResponseModel.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    filter = json['Filter'];
    if (json['Data'] != null) {
      data = <ImageModel>[];
      json['Data'].forEach((v) {
        data!.add(new ImageModel.fromJson(v));
      });
    }
    // if (json['Messages'] != null) {
    //   messages = <Null>[];
    //   json['Messages'].forEach((v) {
    //     messages!.add(new Null.fromJson(v));
    //   });
    // }
    isSuccess = json['IsSuccess'];
    exception = json['Exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    data['Filter'] = this.filter;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // if (this.messages != null) {
    //   data['Messages'] = this.messages!.map((v) => v.toJson()).toList();
    // }
    data['IsSuccess'] = this.isSuccess;
    data['Exception'] = this.exception;
    return data;
  }
}

class ImageModel {
  int? id;
  String? uniqueId;
  String? fileName;
  String? fileDownloadName;
  String? fileType;
  int? fileSize;
  int? thumbNailId;
  String? path;

  ImageModel(
      {this.id,
        this.uniqueId,
        this.fileName,
        this.fileDownloadName,
        this.fileType,
        this.fileSize,
        this.thumbNailId,
        this.path});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    uniqueId = json['UniqueId'];
    fileName = json['FileName'];
    fileDownloadName = json['FileDownloadName'];
    fileType = json['FileType'];
    fileSize = json['FileSize'];
    thumbNailId = json['ThumbNailId'];
    path = json['Path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UniqueId'] = this.uniqueId;
    data['FileName'] = this.fileName;
    data['FileDownloadName'] = this.fileDownloadName;
    data['FileType'] = this.fileType;
    data['FileSize'] = this.fileSize;
    data['ThumbNailId'] = this.thumbNailId;
    data['Path'] = this.path;
    return data;
  }
}
