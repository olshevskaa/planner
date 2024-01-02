import 'package:hive/hive.dart';
import 'package:planner/src/data/models/user_model.dart';

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      id: reader.readString(),
      email: reader.readString(),
      tasksCompleted: reader.readInt(),
      provider: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.email);
    writer.writeInt(obj.tasksCompleted);
    writer.writeString(obj.provider);
  }
}