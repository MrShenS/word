线程间通信
	线程同步的基础上进行的，
	全部都需要用 同一个锁对象 调用，
	wait() notify()随机通知其中一个线程，让其由wait转入运行  notifyAll()通知所有wait的线程

	互斥锁 创建出来 条件变量
	ReentrantLock  	替换   synchronized
	Condition		await() signal() signalAll();

	wait() await()进入阻塞状态，会自动解锁；接收到唤醒信号，要去竞争锁。

设计模式
	重在理解，可以解决什么问题，有什么好处。
	代理模式，Spring框架

GUI
	了解

###26.01_网络编程(网络编程概述)(了解)
* A:计算机网络
	* 是指将地理位置不同的具有独立功能的多台计算机及其外部设备，通过通信线路连接起来，在网络操作系统，网络管理软件及网络通信协议的管理和协调下，实现资源共享和信息传递的计算机系统。
* B:网络编程
	* 就是用来实现网络互连的不同计算机上运行的程序间可以进行数据交换。


###26.02_网络编程(网络编程三要素之IP概述)(掌握)
* 每个设备在网络中的唯一标识
* 每台网络终端在网络中都有一个独立的地址，我们在网络中传输数据就是使用这个地址。 
* ipconfig：查看本机IP 192.168.12.42
* ping：测试连接192.168.40.62
* 本地回路地址：127.0.0.1 255.255.255.255是广播地址
* IPv4：4个字节组成，4个0-255。大概42亿，30亿都在北美，亚洲4亿。2011年初已经用尽。 
* IPv6：8组，每组4个16进制数。
* 1a2b:0000:aaaa:0000:0000:0000:aabb:1f2f
* 1a2b::aaaa:0000:0000:0000:aabb:1f2f
* 1a2b:0000:aaaa::aabb:1f2f
* 1a2b:0000:aaaa::0000:aabb:1f2f
* 1a2b:0000:aaaa:0000::aabb:1f2f

###26.03_网络编程(网络编程三要素之端口号概述)(掌握)
* 每个程序在设备上的唯一标识
* 每个网络程序都需要绑定一个端口号，传输数据的时候除了确定发到哪台机器上，还要明确发到哪个程序。
* 端口号范围从0-65535
* 编写网络应用就需要绑定一个端口号，尽量使用1024以上的，1024以下的基本上都被系统程序占用了。
* 常用端口
	* mysql: 3306
	* oracle: 1521
	* web: 80开头
	* tomcat: 8080
	* QQ: 4000
	* feiQ: 2425

###26.04_网络编程(网络编程三要素协议)(掌握)
* UDP/IP   TCP/IP   协议族(一大堆协议组成了一个组  STMP  HTTP)
* 为计算机网络中进行数据交换而建立的规则、标准或约定的集合。
* UDP
	* 面向无连接，数据不安全，速度快。不区分客户端与服务端。 发送的是数据包。
* TCP
　　* 面向连接（三次握手），数据安全，速度略低。分为客户端和服务端。
	* 三次握手: 客户端先向服务端发起请求, 服务端响应请求, 传输数据
	* 你瞅啥   瞅你咋滴   来来来，咱俩唠唠
	* 约吗	  约		走，。。。
* 三次握手
	* 第一次握手：建立连接时，客户端发送syn包到服务器，并进入SYN_SEND状态，等待服务器确认；
	* 第二次握手：服务器收到syn包，确认客户的SYN，同时发送一个SYN包，即SYN+ACK包到客户端，此时服务器进入SYN_RECV状态；
	* 第三次握手：客户端收到服务器的SYN＋ACK包，向服务器发送确认包ACK，此包发送完毕，客户端和服务器进入ESTABLISHED[建立]状态，完成三次握手。 
	* 完成三次握手后，客户端与服务器开始传送数据.

###26.05_网络编程(Socket通信原理图解)(了解)
* A:Socket套接字概述：
	* 网络上具有唯一标识的IP地址和端口号组合在一起才能构成唯一能识别的标识符套接字。
	* 通信的两端都有Socket。
	* 网络通信其实就是Socket间的通信。
	* 数据在两个Socket间通过IO流传输。
	* Socket在应用程序中创建，通过一种绑定机制与驱动程序建立关系，告诉自己所对应的IP和port。

###26.06_网络编程(TCP协议)(掌握)
* 1.服务端
	* 创建ServerSocket(需要指定端口号)
	* 调用ServerSocket的accept()方法接收一个客户端请求，得到一个Socket
	* 调用Socket的getInputStream()和getOutputStream()方法获取和客户端相连的IO流
	* 输入流可以读取客户端输出流写出的数据
	* 输出流可以写出数据到客户端的输入流
	* 操作完成，关闭资源
* 2.客户端
	* 创建Socket连接服务端(指定ip地址,端口号)通过ip地址找对应的服务器
	* 调用Socket的getInputStream()和getOutputStream()方法获取和服务端相连的IO流
	* 输入流可以读取服务端输出流写出的数据
	* 输出流可以写出数据到服务端的输入流
	* 操作完成，关闭资源
	
###26.07_网络编程(TCP协议代码优化)
* 流进行了优化  	InputStream    BufferedReader
* 				OutputStream   PrintStream
* 客户端

			Socket socket = new Socket("127.0.0.1", 9999);		//创建Socket指定ip地址和端口号
			InputStream is = socket.getInputStream();			//获取输入流
			OutputStream os = socket.getOutputStream();			//获取输出流
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			PrintStream ps = new PrintStream(os);
			
			System.out.println(br.readLine());
			ps.println("我想报名就业班");
			System.out.println(br.readLine());
			ps.println("爷不学了");
			socket.close();
* 服务端

		ServerSocket server = new ServerSocket(9999);	//创建服务器
		Socket socket = server.accept();				//接受客户端的请求
		InputStream is = socket.getInputStream();		//获取输入流
		OutputStream os = socket.getOutputStream();		//获取输出流
		
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		PrintStream ps = new PrintStream(os);
		
		ps.println("欢迎咨询杰普软件");
		System.out.println(br.readLine());
		ps.println("报满了,请报下一期吧");
		System.out.println(br.readLine());
		server.close();
		socket.close();

###26.08_网络编程(服务端是多线程的)(掌握)
	ServerSocket server = new ServerSocket(9999);	//创建服务器
		while(true) {
			final Socket socket = server.accept();				//接受客户端的请求
			new Thread() {
				public void run() {
					try {
						BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
						PrintStream ps = new PrintStream(socket.getOutputStream());
						ps.println("欢迎咨询杰普软件");
						System.out.println(br.readLine());
						ps.println("报满了,请报下一期吧");
						System.out.println(br.readLine());
						socket.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}.start();
		}
	}

###26.09_网络编程(练习)
* 面试题 StringBuffer StringBuilder 
* String s1 = "hello"; s1 = s1 + "world"; 
* StringBuffer sb = "hello"; sb.append("world");
* 客户端向服务器写字符串(键盘录入),服务器(多线程)将字符串反转后写回,客户端再次读取到是反转后的字符串

###26.10_网络编程(练习)
* 客户端向服务器上传文件                                                       
* 客户端端                                                                                                  
* 1.提示输入要上传的文件路径File，验证路径是否存在以及是否是文件夹                     
* 2.发送文件名到服务器                                                                                                         
* 6.接收结果，如果存在给予提示，否则程序直接退出                                            
* 7.如果不存在，定义FileInputStream读取文件，通过网络上传                                              
*                                                                                                       
* 服务器                                                                             
* 3.建立多线程服务器                                                  
* 4.读取文件名                             
* 5.判断文件名是否存在，将结果返回给客户端                                          
* 8.接收文件
* 

###26.11_网络编程(UDP传输)(了解)
* UDP节点，不需要建立网络连接， 建立一个节点，准备数据包，直接发出去|直接收取，处理数据
* 1.发送Send
	* 创建DatagramSocket, 随机端口号
	* 创建DatagramPacket, 指定数据, 长度, 地址, 端口
	* 使用DatagramSocket发送DatagramPacket
	* 关闭DatagramSocket
* 2.接收Receive
	* 创建DatagramSocket, 指定端口号
	* 创建DatagramPacket, 指定数组, 长度
	* 使用DatagramSocket接收DatagramPacket
	* 关闭DatagramSocket
	* 从DatagramPacket中获取数据
* 3.接收方获取ip和端口号
	* String ip = packet.getAddress().getHostAddress();
	* int port = packet.getPort();
* 
		发送端
		String str = "what are you 干啥?";
		//整个套接字
		DatagramSocket socket = new DatagramSocket();
		//弄个数据包
		DatagramPacket packet = new DatagramPacket(
				str.getBytes(),str.getBytes().length,
				InetAddress.getByName("127.0.0.1"),6666);
		//发送数据包
		socket.send(packet);
		//关闭套接字
		socket.close();

		接收端
		//准备套接字   指定端口 
		DatagramSocket socket = new DatagramSocket(6666);
		//准备数据包  
		DatagramPacket packet = new DatagramPacket(new byte[1024], 1024);
		//接收数据
		socket.receive(packet);
		
		//获取数据
		byte[] arr = packet.getData();
		//获取有效的字节个数
		int len = packet.getLength();
		
		System.out.println(new String(arr,0,len));
		
		//关闭资源
		socket.close();

###26.12_网络编程(UDP传输优化)
* 接收端Receive
* 
		DatagramSocket socket = new DatagramSocket(6666);						//创建socket相当于创建码头
		DatagramPacket packet = new DatagramPacket(new byte[1024], 1024);		//创建packet相当于创建集装箱
		
		while(true) {
			socket.receive(packet);												//接收货物
			byte[] arr = packet.getData();
			int len = packet.getLength();
			String ip = packet.getAddress().getHostAddress();
			System.out.println(ip + ":" + new String(arr,0,len));
		}
* 发送端Send

		DatagramSocket socket = new DatagramSocket();		//创建socket相当于创建码头
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			String str = sc.nextLine();
			if("quit".equals(str))
				break;
			DatagramPacket packet = 							//创建packet相当于创建集装箱
					new DatagramPacket(str.getBytes(), str.getBytes().length, InetAddress.getByName("127.0.0.1"), 6666);
			socket.send(packet);			//发货
		}
		socket.close();
###26.13_网络编程(UDP传输多线程)
* A发送和接收在一个窗口完成
* 从键盘获取数据通过UDP发送出去，如果遇到quit则退出。
* 

		public class Demo3_MoreThread {

			/**
			 * @param args
			 */
			public static void main(String[] args) {
				new Receive().start();
				
				new Send().start();
			}
		
		}

		class Receive extends Thread {
			public void run() {
				try {
					DatagramSocket socket = new DatagramSocket(6666);					//创建socket相当于创建码头
					DatagramPacket packet = new DatagramPacket(new byte[1024], 1024);	//创建packet相当于创建集装箱
					
					while(true) {
						socket.receive(packet);												//接收货物
						byte[] arr = packet.getData();
						int len = packet.getLength();
						String ip = packet.getAddress().getHostAddress();
						System.out.println(ip + ":" + new String(arr,0,len));
					}
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
		}

		class Send extends Thread {
			public void run() {
				try {
					DatagramSocket socket = new DatagramSocket();		//创建socket相当于创建码头
					Scanner sc = new Scanner(System.in);
					
					while(true) {
						String str = sc.nextLine();
						if("quit".equals(str))
							break;
						DatagramPacket packet = 							//创建packet相当于创建集装箱
								new DatagramPacket(str.getBytes(), str.getBytes().length, InetAddress.getByName("127.0.0.1"), 6666);
						socket.send(packet);			//发货
					}
					socket.close();
				}  catch (IOException e) {
					
					e.printStackTrace();
				}
			}
		}	

###26.14_TCP、UDP区别
* 
* 
###26.15_day26总结
* 把今天的知识点总结一遍。