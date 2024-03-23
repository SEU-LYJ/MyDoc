* mqtt的mq不是message queue，这是最早IBM内部产品相关的代号。
* tls是ssl的优化协议，目前用的最多的就是ssl3.0和tls1.2
* 重要时间表
  
| 时间| 事项|
| -- | --|
| 1999 | IBM内部创造 |
| 2010 | IBM开源mqtt3.1|
| 2014.10.29| mqtt正式通过OASIS标准,版本为3.1.1|
| 2019.3 | OASIS通过mqtt 5标准, 主要增强了可靠性以及在至关重要任务重的错误处理机制|

* mqtt包含一个broker和若干个client
* mqtt不是message queue,他们的差异如下
  * message queue存储消息直到他们被消费，mqtt允许一个topic没有任何订阅者
  * 传统message queue一条消息只会被消费一次，多个消费者共同处理消息来做负载均衡
  * queue比topic更严格，它是必须要被显式创建的，只有创建之后才能被发布或者消费
* 