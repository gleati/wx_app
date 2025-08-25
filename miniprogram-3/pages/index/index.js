// index.js
const defaultAvatarUrl = 'https://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRna42FI242Lcia07jQodd2FJGIYQfG0LAJGFxM4FbnQP6yfMxBgJ0F3YRqJCJ1aPAK2dQagdusBZg/0' //设置初始的头像，一开始没有头像

Page({
  data: { //设置初始的数据
    userInfo: {
      avatarUrl: defaultAvatarUrl, //设置初始头像
      nickName: '', //初始化昵称
    },
    hasUserInfo: false,
  },
  onChooseAvatar(e) { //用于上传用户头像
    const { avatarUrl } = e.detail  //获取用户的头像
    const { nickName } = this.data.userInfo
    this.setData({  //更新页面数据
      "userInfo.avatarUrl": avatarUrl,
    })
  },

  onInputChange(e) {  //用于上传用户昵称
    const nickName = e.detail.value //获取用户的昵称
    const { avatarUrl } = this.data.userInfo
    this.setData({    //更新页面
      "userInfo.nickName": nickName,
    })
  },
})


