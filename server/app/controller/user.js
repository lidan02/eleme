const Controller = require('egg').Controller;

class LoginController extends Controller {
  async login() {
    const { ctx } = this;
    ctx.body = await ctx.service.user.login();
  }
}

module.exports = LoginController;
