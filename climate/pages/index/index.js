// index.js
const util = require("../../utils/util")  //配置路径
Page({

  /**
   * 页面的初始数据
   */
  data: {   //初始化数据
    region:['安徽省', '芜湖市', '镜湖区'],
    now:{
      wea:'雨',
      tmp:0,
      cond_code:'999',
      hum:0,
      pres:0,
      vis:0,
      wind_dir:0,
      wind_spd:0,
      wind_sc:0
    }
  },
  regionChange: function(e){
    this.setData({region: e.detail.value});   //更新页面
    this.getWeather();  
  },

  getWeather: function(){
    var that = this;
    wx.request({
      url: 'https://h962b65966.re.qweatherapi.com/v7/weather/now',  //配置网址
      data:{
        location: util.getLocationID(that.data.region[1]),  //地址，此为市的地址
        key:'4ea720130a2b4e088b85442cf5a834b6'    //配置key
      },
      success:function(res){
        that.setData({    //更新页面，把返回的结果送到前端，每个数据对应的名字与操作手册上的名字有出入
          tmp:res.data.now.temp,
          wea:res.data.now.text,
          cond_code:res.data.now.icon,
          hum:res.data.now.humidity,
          pres:res.data.now.pressure,
          vis:res.data.now.visibility,
          wind_dir:res.data.now.windDir,
          wind_spd:res.data.now.windSpeed,
          wind_sc:res.data.now.windScale
        })
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getWeather();
  },
})
