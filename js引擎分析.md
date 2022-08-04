[TOC]
# 零散记录
* snapshot最后生成的内容包含字节码和字面值池。字节码保存在compile code里面，其实就是cbc对象。编译的cbc对象没有做什么优化的，比如1+2，这个表达式在cbc里面是保留的，每次run的时候会继续计算。运行的函数是vm_execute，诸如1+2这种引擎内部的的计算，会通过vm_loop完成，过程中如果出现注入的外部函数，则会停止vm_loop，返回这个对象，再调用外部函数。
  * 过程，绑定本地页面叫做js container page
  * 创建页面前创建js环境
  * 注入原生api，包括我们提供的各类api
  * 运行已经提前编译成字节码的framework
  * context管理切换当前的context，判断context是否有效
  * js页面里面保存了诸如url之类的信息，实现跳转
  * js页面多层缓存：网络-->文件系统--> 内存 -->字节码内存快照（专门设置缓存管理，lru处理不常用缓存）
  * 先初始化样式列表，按照类、id和自定义优先级逐级递增，把所有设计好的样式列表保证存在style manager里面
  * 把viewModel保存下来
  * 执行onInit生命周期（此时页面还没有渲染）
  * 获取渲染函数，执行渲染（_c _l _i）,构建虚拟dom对象（div text image scroller)
  * 对根节点调用render，递归渲染
    * 创建lvgl视图对象，注册事件处理回调函数，支持click，focus defocus
    * 解析options，包括属性配置和事件注册，如果是表达式属性，注册属性变更回调
    * 处理样式，按照自定义 id 和class优先级
    * 处理子对象，如果有for循环或者if描述符，处理描述符创建真实对象
  * 调用onReady生命周期
  * 调用layout展开flexbox布局
  * 根据页面栈调用onShow和onHide
  * 页面销毁调用onDestory


