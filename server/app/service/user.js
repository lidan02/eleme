const Service = require('egg').Service;

class UserService extends Service {
  async login(payload) {
    const { ctx } = this;
    const { phone } = payload;
    const res = await this.ctx.model.User.find({ phone: { $regex: phone } });
    if (!res) {
      await this.ctx.model.User.create({ phone: { $regex: phone } });
    }
    ctx.helper.success({ ctx });
  }
}
module.exports = UserService;
