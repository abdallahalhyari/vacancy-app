/// job_id : "6"
/// title : "HR Manager"
/// company : "People First Inc."
/// location : "Boston, MA"
/// description : "Oversee HR operations and manage employee relations. Responsibilities include recruiting, training, and developing staff, as well as handling employee grievances and performance reviews."
/// long_description : "As an HR Manager at People First Inc., you will oversee all HR operations and manage employee relations. Your responsibilities will include recruiting, training, and developing staff, handling employee grievances, and conducting performance reviews. The ideal candidate should have strong interpersonal skills, experience with HR software, and a thorough understanding of labor laws and regulations."
/// salary : "$75,000 - $95,000"
/// date_posted : "2024-09-11"
/// image_url : "https://www.unhcrjo.org/img/jobs/hr_manager.jfif"

class Job {
  Job({
      String? jobId,
      String? title,
      String? company,
      String? location,
      String? description,
      String? longDescription,
      String? salary,
      String? datePosted,
      String? imageUrl,}){
    _jobId = jobId;
    _title = title;
    _company = company;
    _location = location;
    _description = description;
    _longDescription = longDescription;
    _salary = salary;
    _datePosted = datePosted;
    _imageUrl = imageUrl;
}

  Job.fromJson(dynamic json) {
    _jobId = json['job_id'];
    _title = json['title'];
    _company = json['company'];
    _location = json['location'];
    _description = json['description'];
    _longDescription = json['long_description'];
    _salary = json['salary'];
    _datePosted = json['date_posted'];
    _imageUrl = json['image_url'];
  }
  String? _jobId;
  String? _title;
  String? _company;
  String? _location;
  String? _description;
  String? _longDescription;
  String? _salary;
  String? _datePosted;
  String? _imageUrl;
Job copyWith({  String? jobId,
  String? title,
  String? company,
  String? location,
  String? description,
  String? longDescription,
  String? salary,
  String? datePosted,
  String? imageUrl,
}) => Job(  jobId: jobId ?? _jobId,
  title: title ?? _title,
  company: company ?? _company,
  location: location ?? _location,
  description: description ?? _description,
  longDescription: longDescription ?? _longDescription,
  salary: salary ?? _salary,
  datePosted: datePosted ?? _datePosted,
  imageUrl: imageUrl ?? _imageUrl,
);
  String? get jobId => _jobId;
  String? get title => _title;
  String? get company => _company;
  String? get location => _location;
  String? get description => _description;
  String? get longDescription => _longDescription;
  String? get salary => _salary;
  String? get datePosted => _datePosted;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['job_id'] = _jobId;
    map['title'] = _title;
    map['company'] = _company;
    map['location'] = _location;
    map['description'] = _description;
    map['long_description'] = _longDescription;
    map['salary'] = _salary;
    map['date_posted'] = _datePosted;
    map['image_url'] = _imageUrl;
    return map;
  }

}