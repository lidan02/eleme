const moment = require('moment');

// 处理成功响应
exports.success = ({ ctx, res = null, msg = '处理成功' }) => {
  console.log(msg);
  ctx.body = {
    code: 0,
    data: res,
    msg,
  };
  ctx.status = 200;
};
// 处理成功失败
exports.error = ({ ctx, res = null, msg = '处理失败' }) => {
  console.log(msg);
  ctx.body = {
    code: -1,
    data: res,
    msg,
  };
  ctx.status = 200;
};

// 格式化时间
exports.formatTime = time => moment(time).format('YYYY-MM-DD HH:mm:ss');
