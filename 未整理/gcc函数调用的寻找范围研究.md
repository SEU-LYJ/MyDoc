* 函数调用在arm上会被编译为bl相对寻址，arm-v7开始这个寻址的最大范围是25位，也就是32兆
* 如果函数调用超出了32M的跳转范围，链接器会生成一个vneer函数，先跳转到vneer函数，然后再bx绝对寻址
* 地址空间溢出是会回到0开始的，也就是对于32位地址来说，想从0地址相对寻址到0xfffffff0，可以通过减0x10实现
  
[TOC]
# 1. 背景介绍
通过gcc编译在arm架构上的代码时，对于普通的函数调用，编译