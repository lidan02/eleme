const Service = require('egg').Service;

class UserService extends Service {
  async login(payload) {
    console.log(payload);
    const { ctx } = this;
    const { account, password } = payload;
    // await this.ctx.model.User.create({ account, password });
    const user = await this.ctx.model.User.findOne({ account });
    if (!user) {
      return ctx.helper.error({ ctx, msg: '账号不存在' });
    }
    const user2 = await this.ctx.model.User.findOne({ password });
    if (!user2) {
      return ctx.helper.error({ ctx, msg: '密码输入错误' });
    }
    ctx.helper.success({ ctx, msg: '登录成功' });
  }
}
module.exports = UserService;
