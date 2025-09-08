// Second.ets
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Second {
  @State message: string = 'Hi there'; // 控制文本内容

  build() {
    // 垂直方向的行容器
    Row() {
      // 行内的垂直布局列容器
      Column() {
        //显示状态变量message的内容
        Text(this.message)
          .fontSize(50) // 设置字体大小为50px
          .fontWeight(FontWeight.Bold); // 设置字体为粗体

        //点击后返回上一页（首页）
        Button() {
          Text('Back') // 按钮内文本
            .fontSize(30) // 文本大小30px
            .fontWeight(FontWeight.Bold); // 文本加粗
        }
        .type(ButtonType.Capsule) // 设置按钮形状为胶囊型
        .margin({ top: 20 }) // 按钮上方外边距20px
        .backgroundColor('#0D9FFB') // 按钮背景颜色为蓝色
        .width('40%') // 按钮宽度占父容器的40%
        .height('5%') // 按钮高度占父容器的5%
        // 返回到第一页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Back' button.`); // 打印点击成功日志

          // 获取UI上下文及路由
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();

          try {
            // 执行返回上一页操作
            router.back();
            console.info('Succeeded in returning to the first page.'); // 返回成功日志
          } catch (err) {
            // 返回失败时的错误处理
            let code = (err as BusinessError).code; // 获取错误码
            let message = (err as BusinessError).message; // 获取错误信息
            console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`); // 打印错误详情
          }
        })
      }
      .width('100%'); // 列容器占满行宽度
    }
    .height('100%'); // 行容器占满屏幕高度
  }
}