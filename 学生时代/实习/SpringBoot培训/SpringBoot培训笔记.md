**SpringBoot培训笔记：**



## 注解：

**@EnableAutoConfiguration** ：通知springBoot通过jar依赖猜测你想如何配置Spring 由于spring-boot-starter-web	添加了Tomcat和Spring	MVC，所以auto-configuration将假定你正在开发一个web应用并相应地
对Spring进行设置。 

**@RestController**：表示特殊角色 在本示例中，我们的类是一个web@Controller，所以当处理进来的web请求时， Spring会询问它。

**@RequestMapping**	注解提供路由信息。它告诉Spring任何来自"/"路径的HTTP请求都应该被映射到  home方法。

**@Value("${配置文件中等号左面的字符}")**      获取配置文件中的数据



 

 http://git.definesys.com/zhen.shen/mdb.git



git@git.definesys.com:zhen.shen/mdb.git

ssh://git@git.definesys.com/zhen.shen/mdb.git

$ git clone ssh://git@k8s.definesys.com:30010/zhen.shen/mdb.git



git remote add origin http://git.definesys.com/zhen.shen/mdb.git





git config --global user.email“zhen.shen@definesys.com"



剑锋哥:
git config --global user.email 'zhen.shen@definesys.com'

git config --global user.name 'zhen.shen'



git config --global user.email“zhen.shen@definesys.com"



导入本地maven的依赖命名

```
<groupId>项目名.模块名</groupId>
<artifactId>com.公司名</artifactId>
<version>版本号</version>
```