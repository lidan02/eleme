const Controller = require('egg').Controller;

class LoginController extends Controller {
  async index() {
    const { ctx } = this;
    ctx.body = await ctx.service.user.getAll();
  }
}

module.exports = LoginController;
