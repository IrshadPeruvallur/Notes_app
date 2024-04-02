class NotesModel {
  String title;
  String notes;
  String? id;
  NotesModel({required this.title, required this.notes, this.id});

  factory NotesModel.fromJson(String id, Map json) {
    return NotesModel(title: 'title', notes: 'notes');
  }
  toJson() {
    return {'title': title, 'notes': notes, 'id': id};
  }
}
