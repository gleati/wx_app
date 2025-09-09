// index.js
// 定义页面逻辑，处理页面初始化、数据绑定及用户交互
Page({
  // 页面初始数据，包含关卡图标列表（level01.png至level04.png）
  data: {
    levels: [
      'level01.png', // 关卡1图标路径
      'level02.png', // 关卡2图标路径
      'level03.png', // 关卡3图标路径
      'level04.png'  // 关卡4图标路径
    ]
  },

  // 选择关卡事件处理函数，触发导航至游戏页面并传递关卡参数
  chooseLevel: function(e) {
    // 从事件对象中获取当前点击的关卡标识（data-level属性值）
    let level = e.currentTarget.dataset.level;
    // 跳转至游戏页面，通过URL参数传递选中的关卡信息
    wx.navigateTo({
      url: '../game/game?level=' + level // 拼接关卡参数到目标页面路径
    });
  }
});
