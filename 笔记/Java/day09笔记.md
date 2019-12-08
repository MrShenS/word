###12.01_常见对象(Scanner的概述和方法介绍)(掌握)
* A:Scanner的概述
* B:Scanner的构造方法原理
	* Scanner(InputStream source)
	* System类下有一个静态的字段：
		* public static final InputStream in; 标准的输入流，对应着键盘录入。

* C:一般方法
	* hasNextXxx()  判断是否还有下一个输入项,其中Xxx可以是Int,Double等。如果需要判断是否包含下一个字符串，则可以省略Xxx
	* nextXxx()  获取下一个输入项。Xxx的含义和上个方法中的Xxx相同,默认情况下，Scanner使用空格，回车等作为分隔符


###12.02_常见对象(Scanner获取数据出现的小问题及解决方案)(掌握)
* A:两个常用的方法：
	* public int nextInt():获取一个int类型的值
	* public String nextLine():获取一个String类型的值
* B:案例演示
	* a:先演示获取多个int值，多个String值的情况
	* b:再演示先获取int值，然后获取String值出现问题
	* c:问题解决方案
		* 第一种：先获取一个数值后，在创建一个新的键盘录入对象获取字符串。
		* 第二种：把所有的数据都先按照字符串获取，然后要什么，你就对应的转换为什么。(后面讲)
	
###12.03_常见对象(String类的概述)(掌握)
* A:String类的概述	
	* 通过JDK提供的API，查看String类的说明
	
	* 可以看到这样的两句话。
		* a:字符串字面值"abc"也可以看成是一个字符串对象。 //"abc".equals(); OK
		* b:字符串是常量，一旦被赋值，就不能被改变。

###12.04_常见对象(String类的构造方法)(掌握)
* A:常见构造方法
	* public String():空构造
	* public String(byte[] bytes):把字节数组转成字符串
	* public String(byte[] bytes,int index,int length):把字节数组的一部分转成字符串
	* public String(char[] value):把字符数组转成字符串
	* public String(char[] value,int index,int count):把字符数组的一部分转成字符串
	* public String(String original):把字符串常量值转成字符串
* B:案例演示	
	* 演示String类的常见构造方法

###12.05_常见对象(String类的常见面试题)(掌握)
* 1.判断定义为String类型的s1和s2是否相等
	* String s1 = "abc";
	* String s2 = "abc";
	* System.out.println(s1 == s2); 			
	* System.out.println(s1.equals(s2)); 		
* 2.下面这句话在内存中创建了几个对象?
	* String s1 = new String("abc");			
* 3.判断定义为String类型的s1和s2是否相等
	* String s1 = new String("abc");			
	* String s2 = "abc";
	* System.out.println(s1 == s2); ?			
	* System.out.println(s1.equals(s2)); ?	
* 4.判断定义为String类型的s1和s2是否相等
	* String s1 = "a" + "b" + "c";
	* String s2 = "abc";
	* System.out.println(s1 == s2); ?			
	* System.out.println(s1.equals(s2)); ?	
* 5.判断定义为String类型的s1和s2是否相等
	* String s1 = "ab";
	* String s2 = "abc";
	* String s3 = s1 + "c";	//new StringBuffer --> toString
	* System.out.println(s3 == s2);
	* System.out.println(s3.equals(s2)); ?	

###12.06_常见对象(String类的判断功能)(掌握)
* A:String类的判断功能
	* boolean equals(Object obj):比较字符串的内容是否相同,区分大小写
	* boolean equalsIgnoreCase(String str):比较字符串的内容是否相同,忽略大小写
	* boolean contains(String str):判断大字符串中是否包含小字符串
	* boolean startsWith(String str):判断字符串是否以某个指定的字符串开头
	* boolean endsWith(String str):判断字符串是否以某个指定的字符串结尾
	* boolean isEmpty():判断字符串是否为空。

###12.07_常见对象(模拟用户登录)(掌握)
* A:作业 LoginTest.java
	* 需求：模拟登录,给三次机会,并提示还有几次。
	* 用户名和密码都是admin
	
###12.08_常见对象(String类的获取功能)(掌握)
* A:String类的获取功能
	* int length():获取字符串的长度。
	* char charAt(int index):获取指定索引位置的字符
	* int indexOf(int ch):返回指定字符在此字符串中第一次出现处的索引。
	* int indexOf(String str):返回指定字符串在此字符串中第一次出现处的索引。
	* int indexOf(int ch,int fromIndex):返回指定字符在此字符串中从指定位置后第一次出现处的索引。
	* int indexOf(String str,int fromIndex):返回指定字符串在此字符串中从指定位置后第一次出现处的索引。
	* lastIndexOf
	* String substring(int start):从指定位置开始截取字符串,默认到末尾。
	* String substring(int start,int end):从指定位置开始到指定位置结束截取字符串。[start,end)

###12.09_常见对象(字符串的遍历)(掌握)
* A:案例演示
	* 需求：遍历字符串
	
###12.10_常见对象(统计不同类型字符个数)(掌握)
* A:作业 CountTest.java
	* 需求：统计一个字符串中大写字母字符，小写字母字符，数字字符出现的次数,其他字符出现的次数。
	* ABCDEabcd123456!@#$%^   ch >= 'a' && ch <= 'z' 

###12.11_常见对象(String类的转换功能)(掌握)
* A:String的转换功能：
	* byte[] getBytes():把字符串转换为字节数组。
	* char[] toCharArray():把字符串转换为字符数组。
	* static String valueOf(char[] chs):把字符数组转成字符串。
	* static String valueOf(int i):把int类型的数据转成字符串。
		* 注意：String类的valueOf方法可以把任意类型的数据转成字符串。

	* String toLowerCase():把字符串转成小写。(了解)
	* String toUpperCase():把字符串转成大写。
	* String concat(String str):把字符串拼接。
	
###12.12_常见对象(按要求转换字符)(链式编程掌握)
* A:作业 TransTest.java
	* 需求：把一个字符串的首字母转成大写，其余为小写。(只考虑英文大小写字母字符)

###12.13_常见对象(把数组转成字符串)
* A:作业 TransTest2.java
	* 需求：把数组中的数据按照指定个格式拼接成一个字符串
		* 举例：
			* int[] arr = {1,2,4,3};	
		* 输出结果：
			* "[1, 2, 4, 3]"
		

###12.14_常见对象(String类的其他功能)
* A:String的替换功能及案例演示
	* String replace(char old,char new)   
	* String replace(String old,String new)
* B:String的去除字符串两空格及案例演示
	* String trim()    "  zhang san  " --> "zhang san"
* C:String的按字典顺序比较两个字符串及案例演示
	* int compareTo(String str)(暂时不用掌握)    
	* int compareToIgnoreCase(String str)(了解)
	

###12.15_常见对象(字符串反转)
* A:作业 ReversalTest.java
	* 需求：把字符串反转
		* 举例：键盘录入"abc"		
		* 输出结果："cba"
		* public static String reversal(String str) {
		* 	//str = "hello"; --> char[]   s = "";
		* 	//对字符数组进行反转
		* 	//char[] --> String s;
		* 	retrun s;
		* }

###12.16_常见对象(在大串中查找小串出现的次数思路图解)
* A:画图演示
	* 需求：统计大串中小串出现的次数
	* public static int count(String max,String min)
	*  
	* 这里的大串和小串可以自己根据情况给出
	* String max = "helloworldnihaobuhaohello";
	* 				max = "buhaohello";   substring();
	* 				max = "hello";
	* String min = "hao";
	* max.indexOf(min) ==> 子串第一次出现的index值
	* 
	* int index = max.indexOf(min);
	* //while((index = max.indexOf(min)) != -1) {
	* while(index != -1) {
	* 	count++;
	* 	//截取子串           12   +  3  15
	* 	max = max.substring(index+min.length());
	* 
	*   index = max.indexOf(min);
	* }
	* syso(count);

###12.17_常见对象(在大串中查找小串出现的次数代码实现)
* A:作业 CountSubTest.java
	* 统计大串中小串出现的次数
	* indexOf()帮助实现
	
###13.01_常见对象(StringBuffer类的概述)
* A:StringBuffer类概述 [StringBulider]
	* 通过JDK提供的API，查看StringBuffer类的说明
	* 线程安全的可变字符序列 
* B:StringBuffer和String的区别
	* String是一个不可变的字符序列
	* StringBuffer是一个可变的字符序列
	*  
	* 多线程访问的时候  银行 主卡 副卡 同一个时刻去各自存钱1000  0+1000=1000  1000+1000=2000

###13.02_常见对象(StringBuffer类的构造方法)
* A:StringBuffer的构造方法：
	* public StringBuffer():无参构造方法
	* public StringBuffer(int capacity):指定容量的字符串缓冲区对象
	* public StringBuffer(String str):指定字符串内容的字符串缓冲区对象
* B:StringBuffer的方法：
	* public int capacity()：返回当前容量。	理论值(不掌握)
	* public int length():返回长度（字符数）。 实际值
* C:案例演示
	* 构造方法和长度方法的使用

###13.03_常见对象(StringBuffer的添加功能)
* A:StringBuffer的添加功能
	* public StringBuffer append(String str):
		* 可以把任意类型数据添加到字符串缓冲区里面,并返回字符串缓冲区本身
	* public StringBuffer insert(int offset,String str):
		* 在指定位置把任意类型的数据插入到字符串缓冲区里面,并返回字符串缓冲区本身

###13.04_常见对象(StringBuffer的删除功能)
* A:StringBuffer的删除功能
	* public StringBuffer deleteCharAt(int index):
		* 删除指定位置的字符，并返回本身
	* public StringBuffer delete(int start,int end):
		* 删除从指定位置开始指定位置结束的内容，并返回本身

###13.05_常见对象(StringBuffer的替换和反转功能)
* A:StringBuffer的替换功能
	* public StringBuffer replace(int start,int end,String str):
		* 从start开始到end用str替换
* B:StringBuffer的反转功能
	* public StringBuffer reverse():
		* 字符串反转

###13.06_常见对象(StringBuffer的截取功能及注意事项)
* A:StringBuffer的截取功能
	* public String substring(int start):
		* 从指定位置截取到末尾
	* public String substring(int start,int end):
		* 截取从指定位置开始到结束位置，包括开始位置，不包括结束位置
* B:注意事项
	* 注意:返回值类型不再是StringBuffer本身

###13.07_常见对象(StringBuffer和String的相互转换)
* A:String -- StringBuffer
	* a:通过构造方法
	* b:通过append()方法
* B:StringBuffer -- String
	* a:通过构造方法
	* b:通过toString()方法
	* c:通过subString(0,length);

###13.08_常见对象(把数组转成字符串)
* A:作业 TransArrToString.java
	* 需求：把数组中的数据按照指定个格式拼接成一个字符串
	* 
			举例：
				int[] arr = {1,2,3};	
			输出结果：
				"[1, 2, 3]"
				
			用StringBuffer的功能实现

###13.09_常见对象(字符串反转)
* A:案例演示
* 
		需求：把字符串反转
			举例：键盘录入"abc"		
			输出结果："cba"
			
		用StringBuffer的功能实现	

###13.10_常见对象(StringBuffer和StringBuilder的区别)
* A:StringBuilder的概述
	* 通过查看API了解一下StringBuilder类
* B:面试题
	* StringBuffer和StringBuilder的区别
		* StringBuffer是jdk1.0版本的,是线程安全的,效率低
		* StringBuilder是jdk1.5版本的,是线程不安全的,效率高

	* String和StringBuffer,StringBuilder的区别
		* String是一个不可变的字符序列
		* StringBuffer,StringBuilder是可变的字符序列

###13.11_常见对象(String和StringBuffer分别作为参数传递)
* A:形式参数问题
	* String作为参数传递  传值
	* StringBuffer作为参数传递 传地址
* B:案例演示
	* String和StringBuffer分别作为参数传递问题
