# DFNetWorking

##借助框架：##
AFNetworking（请求的实体框架）
MJExtension（模型转字典）
网络请求框架，可以很方便的集成到项目的网络请求和单元测试中，在AFN的基础上继续封装了容错校验，api管理等功能，要配置以下几个地方：

DFHttpManager：网络管理类，可以设置全局的请求方式、文本解析格式、例外场景、核心数据抽离、错误提示；
DFHttpValid：根据制定的接口需求写校验规则；
DFRequest：在这个类里面实现了最终发起请求前的url配置，url格式可以是http开头的独立链接，也可以是接口的部分路径，会自动拼接上baseurl部分到路径的最前面；
DFRequestConfigure：基础配置，设置初始化数据，例如请求的域名，超时时间；
DFRequestAPI：接口访问的管理类，抽离出来方便程序内调用或单元测试调用；
DFRequestModel：请求模块的基类，定义所有接口都需要配置的参数，其他模块可以继承这个类。如果没有公共参数也要继承，用于判断格式合法性；
DFRequestURLInfoConfig：url的公共管理类。
