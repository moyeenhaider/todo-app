import 'dart:convert';

class TaskModel {
  int id;
  String taskName;
  String description;
  bool isPinned;
  bool isImportant;
  TaskModel({
    this.id,
    this.taskName,
    this.description,
    this.isPinned,
    this.isImportant,
  });

  TaskModel copyWith({
    int id,
    String taskName,
    String description,
    bool isPinned,
    bool isImportant,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      isPinned: isPinned ?? this.isPinned,
      isImportant: isImportant ?? this.isImportant,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'description': description,
      'isPinned': isPinned,
      'isImportant': isImportant,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TaskModel(
      id: map['id'],
      taskName: map['taskName'],
      description: map['description'],
      isPinned: map['isPinned'],
      isImportant: map['isImportant'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(id: $id, taskName: $taskName, description: $description, isPinned: $isPinned, isImportant: $isImportant)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TaskModel &&
        o.id == id &&
        o.taskName == taskName &&
        o.description == description &&
        o.isPinned == isPinned &&
        o.isImportant == isImportant;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        taskName.hashCode ^
        description.hashCode ^
        isPinned.hashCode ^
        isImportant.hashCode;
  }

  TaskModel togglePin() {
    return copyWith(isPinned: !(isPinned ?? false));
  }

  TaskModel switchImpotance() {
    return copyWith(isImportant: !(isImportant ?? false));
  }
}
