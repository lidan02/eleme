const Service = require('egg').Service;

class UserService extends Service {
  async login(payload) {
    const { ctx } = this;
    const { phone } = payload;
    const res = await this.ctx.model.User.find({ phone });
    console.log('---------------------------', res);
    if (!res.length) {
      await this.ctx.model.User.create({ phone });
    }
    ctx.helper.success({ ctx, msg: '登录成功' });
  }
}
module.exports = UserService;
