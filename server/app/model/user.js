module.exports = app => {
  const mongoose = app.mongoose;
  const UserSchema = new mongoose.Schema({
    account: { type: String, unique: true, required: true },
    password: { type: String, required: true },
    createdTime: { type: Date, default: Date.now },
  });
  return mongoose.model('User', UserSchema);
};

