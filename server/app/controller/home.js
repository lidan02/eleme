const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    ctx.body = await ctx.service.user.login();
  }
}

module.exports = HomeController;
