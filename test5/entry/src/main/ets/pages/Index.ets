// Index.ets
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'; // 控制文本内容

  build() {
    // 垂直方向的行容器
    Row() {
      // 行内的垂直布局列容器
      Column() {
        // 显示状态变量message的内容
        Text(this.message)
          .fontSize(50) // 设置字体大小为50px
          .fontWeight(FontWeight.Bold); // 设置字体为粗体

        // 触发页面跳转
        Button() {
          Text('Next') // 按钮内文本
            .fontSize(30) // 文本大小30px
            .fontWeight(FontWeight.Bold); // 文本加粗
        }
        .type(ButtonType.Capsule) // 设置按钮形状为胶囊型
        .margin({ top: 20 }) // 按钮上方外边距20px
        .backgroundColor('#0D9FFB') // 按钮背景颜色为蓝色
        .width('40%') // 按钮宽度占父容器的40%
        .height('5%') // 按钮高度占父容器的5%
        // 跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`); // 打印点击成功日志

          // 获取UI上下文及路由
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();

          // 执行页面跳转
          router.pushUrl({ url: 'pages/Second' })
            .then(() => {
              console.info('Succeeded in jumping to the second page.'); // 跳转成功日志
            })
            .catch((err: BusinessError) => {
              // 跳转失败时的错误处理
              console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`);
            });
        });
      }
      .width('100%'); // 列占满行宽度
    }
    .height('100%'); // 行占满屏幕高度
  }
}