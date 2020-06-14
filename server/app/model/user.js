module.exports = app => {
  const mongoose = app.mongoose;
  const UserSchema = new mongoose.Schema({
    phone: { type: String, unique: true, required: true },
    validateCode: { type: String, required: false },
    createdTime: { type: Date, default: Date.now },
  });
  return mongoose.model('User', UserSchema);
};

