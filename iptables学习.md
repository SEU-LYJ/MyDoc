# 1. 基本介绍

iptables是linux系统上强大的命令行防火墙工具，它用于设置、维护和检查网络数据包的过滤和转换规则表。它的主要功能有以下几个：

* 数据包过滤：可以决定哪些数据可以通过网络接口进入或离开系统
* 网络地址转换（nat）：可以用于端口转发、负载均衡等场景
* 端口重定向：类似端口转发，就是把到达特定端口的流量重定向到系统的另一个端口，在做服务迁移的时候很有用
* 状态监测：记录特定规则的数据报信息，可以调试或者监控网络服务
* 服务控制：比如对某些端口的访问限制来访IP
* QoS修改：可以篡改包的QoS

# 2. 重要用法

## 2.1 端口重定向

```shell


# 修改配置允许内核进行端口转发
sudo vim /etc/sysctl.conf

# 找到其中的net.ipv4.ip_forward，修改为net.ipv4.ip_forward=1

# 应用更改
sudo sysctl -p

# 创建规则将所有到达服务器61445端口上的数据转发到本机的445端口
# -t 指定是修改nat表，除了nat表还有filter表等等
# -A 指定将规则追加到PREROUTING中，也就是到达本机且目标就是本机IP的流量
# -j 表示重定向，用于修改数据包中的目标端口和IP
sudo iptables -t nat -A PREROUTING -p tcp --dport 61445 -j REDIRECT --to-ports 445

# 持久化保存配置
sudo iptables-save > /etc/iptables/rules.v4
```

## 2.2 端口转发

2.1的场景是转发后ip地址没有变更的case，如果端口转发到其他ip上，还需要设置SNAT，也就是对回复的流量进行IP修改，保证流量能够正确的返回
允许端口转发的配置就不再赘述了，直接从规则配置开始

```shell
# DNAT修改目标端口和IPREDIRECT，
# 前面参数都介绍过，不再赘述，唯一-j后面改成了DNAT而不是REDIRECT，实际上就是REDIRECT后面只允许修改端口，它实际是DNAT的一个特化，用于简化命令的。不过实现原理来说，因为它是本机内转发，实现可以做更多优化，避免了地址查找开销
sudo iptables -t nat -A PREROUTING -p tcp --dport 61445 -j DNAT --to-destination 192.168.1.15:445

# MASQUERADE简化SNAT配置，如果不使用MASQUERADE，则需要显示指定ip地址，这在动态ip的场景就比较麻烦了
sudo iptables -t nat -A POSTROUTING -p tcp -d 192.168.1.15 --dport 445 -j MASQUERADE

# 持久化保存
sudo iptables-save > /etc/iptables/rules.v4
```

```

```
