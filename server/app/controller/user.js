const Controller = require('egg').Controller;

class LoginController extends Controller {
  async login() {
    const { ctx } = this;
    const payload = ctx.request.body || {};
    await ctx.service.user.login(payload);
  }
}

module.exports = LoginController;
