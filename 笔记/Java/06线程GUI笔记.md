###24.01_多线程(多线程的引入)(了解)
* 1.什么是线程
	* 线程是程序执行的一条路径, 一个进程中可以包含多条线程
	* QQ聊天  进程  你在给同学发信息的同时，能否接收其他同学的消息？提高效率
	* 进程，是一个应用程序的执行流程，进程是资源分配的最小单位
	* 多线程并发执行可以提高程序的效率, 可以同时完成多项工作
* 2.多线程的应用场景
	* 红蜘蛛同时共享屏幕给多个电脑
	* 迅雷开启多条线程一起下载
	* QQ同时和多个人一起视频
	* 服务器同时处理多个客户端请求
	
###24.02_多线程(多线程并行和并发的区别)(了解)
* 并行就是两个任务同时运行，就是甲任务进行的同时，乙任务也在进行。(需要多核CPU)
* 并发是指两个任务都请求运行，而处理器只能按受一个任务，就把这两个任务安排轮流进行，由于时间间隔较短，使人感觉两个任务都在运行。
* 比如我跟两个网友聊天，左手操作一个电脑跟甲聊，同时右手用另一台电脑跟乙聊天，这就叫并行。
* 如果用一台电脑我先给甲发个消息，然后立刻再给乙发消息，然后再跟甲聊，再跟乙聊。这就叫并发。

###24.03_多线程(Java程序运行原理和JVM的启动是多线程的吗)(了解)
* A:Java程序运行原理
	* Java命令会启动java虚拟机，启动JVM，等于启动了一个应用程序，也就是启动了一个进程。该进程会自动启动一个 “主线程” ，然后主线程去调用某个类的 main 方法。
	
* B:JVM的启动是多线程的吗
	* JVM启动至少启动了垃圾回收线程和主线程，所以是多线程的。

###24.04_多线程(多线程程序实现的方式1)(掌握)
* 1.继承Thread
	* 定义类继承Thread
	* 重写run方法
	* 把新线程要做的事写在run方法中
	* 创建线程对象
	* 开启新线程, 内部会自动执行run方法
	* 
		
			public class Demo2_Thread {
		
				/**
				 * @param args
				 */
				public static void main(String[] args) {
					MyThread mt = new MyThread();							//4,创建自定义类的对象
					mt.start();												//5,开启线程
					
					for(int i = 0; i < 3000; i++) {
						System.out.println("bb");
					}
				}
			
			}
			class MyThread extends Thread {									//1,定义类继承Thread
				public void run() {											//2,重写run方法
					for(int i = 0; i < 3000; i++) {							//3,将要执行的代码,写在run方法中
						System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
					}
				}
			}

###24.05_多线程(多线程程序实现的方式2)(掌握)
* 2.实现Runnable
	* 定义类实现Runnable接口
	* 实现run方法
	* 把新线程要做的事写在run方法中
	* 创建自定义的Runnable的子类对象
	* 创建Thread对象, 传入Runnable
	* 调用start()开启新线程, 内部会自动调用Runnable的run()方法

			public class Demo3_Runnable {
				/**
				 * @param args
				 */
				public static void main(String[] args) {
					MyRunnable mr = new MyRunnable();						//4,创建自定义类对象
					//Runnable target = new MyRunnable();
					Thread t = new Thread(mr);								//5,将其当作参数传递给Thread的构造函数
					t.start();												//6,开启线程
					
					for(int i = 0; i < 3000; i++) {
						System.out.println("bb");
					}
				}
			}
			
			class MyRunnable implements Runnable {							//1,自定义类实现Runnable接口
				@Override
				public void run() {											//2,重写run方法
					for(int i = 0; i < 3000; i++) {							//3,将要执行的代码,写在run方法中
						System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
					}
				}
				
			}

###24.06_多线程(实现Runnable的原理)(了解)
* 查看源码
	* 1,看Thread类的构造函数,传递了Runnable接口的引用 
	* 2,通过init()方法找到传递的target给成员变量的target赋值
	* 3,查看run方法,发现run方法中有判断,如果target不为null就会调用Runnable接口子类对象的run方法

###24.07_多线程(两种方式的区别)(掌握)
* 查看源码的区别:
	* a.继承Thread: 由于子类重写了Thread类的run(), 当调用start()时, 直接找子类的run()方法
	* b.实现Runnable: 构造函数中传入了Runnable的引用, 成员变量记住了它, start()调用run()方法时内部判断成员变量Runnable的引用是否为空, 不为空编译时看的是Runnable的run(),运行时执行的是子类的run()方法
	
* 继承Thread
	* 好处是:可以直接使用Thread类中的方法,代码简单
	* 弊端是:如果已经有了父类,就不能用这种方法
* 实现Runnable接口
	* 好处是:即使自己定义的线程类有了父类也没关系,因为有了父类也可以实现接口,而且接口是可以多实现的
	* 弊端是:不能直接使用Thread中的方法需要先获取到线程对象后,才能得到Thread的方法,代码复杂
	
###24.08_多线程(匿名内部类实现线程的两种方式)(掌握)
* 继承Thread类
	 	
		new Thread() {													//1,new 类(){}继承这个类
			public void run() {											//2,重写run方法
				for(int i = 0; i < 3000; i++) {							//3,将要执行的代码,写在run方法中
					System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				}
			}
		}.start();
* 实现Runnable接口
			
		new Thread(new Runnable(){										//1,new 接口(){}实现这个接口
			public void run() {											//2,重写run方法
				for(int i = 0; i < 3000; i++) {							//3,将要执行的代码,写在run方法中
					System.out.println("bb");
				}
			}
		}).start(); 

###24.09_多线程(获取名字和设置名字)(掌握)
* 1.获取名字
	* 通过getName()方法获取线程对象的名字
	* 线程对象 有默认的名称，命名方式: Thread-n 或 main
* 2.设置名字
	* 通过构造函数可以传入String类型的名字
	* 
			new Thread("xxx") {
				public void run() {
					for(int i = 0; i < 1000; i++) {
						System.out.println(this.getName() + "....aaaaaaaaaaaaaaaaaaaaaaa");
					}
				}
			}.start();
			
			new Thread("yyy") {
				public void run() {
					for(int i = 0; i < 1000; i++) {
						System.out.println(this.getName() + "....bb");
					}
				}
			}.start(); 
	* 通过setName(String)方法可以设置线程对象的名字
	* 
			Thread t1 = new Thread() {
				public void run() {
					for(int i = 0; i < 1000; i++) {
						System.out.println(this.getName() + "....aaaaaaaaaaaaaaaaaaaaaaa");
					}
				}
			};
			
			Thread t2 = new Thread() {
				public void run() {
					for(int i = 0; i < 1000; i++) {
						System.out.println(this.getName() + "....bb");
					}
				}
			};
			t	1.setName("芙蓉姐姐");
			t2.setName("凤姐");
			
			t1.start();
			t2.start();

###24.10_多线程(获取当前线程的对象)(掌握)
* Thread.currentThread(), 主线程也可以获取
	* 
			new Thread(new Runnable() {
				public void run() {
					for(int i = 0; i < 1000; i++) {
						System.out.println(Thread.currentThread().getName() + "...aaaaaaaaaaaaaaaaaaaaa");
					}
				}
			}).start();
			
			new Thread(new Runnable() {
				public void run() {
					for(int i = 0; i < 1000; i++) {
						System.out.println(Thread.currentThread().getName() + "...bb");
					}
				}
			}).start();
			Thread.currentThread().setName("我是主线程");					//获取主函数线程的引用,并改名字
			System.out.println(Thread.currentThread().getName());		//获取主函数线程的引用,并获取名字

###24.11_多线程(休眠线程)(掌握)
* Thread.sleep(毫秒,纳秒), 控制当前线程休眠若干毫秒1秒= 1000毫秒 1秒 = 1000 * 1000 * 1000纳秒 1000000000

			new Thread() {
				public void run() {
					for(int i = 0; i < 10; i++) {
						System.out.println(getName() + "...aaaaaaaaaaaaaaaaaaaaaa");
						try {
							Thread.sleep(10);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			}.start();
			
			new Thread() {
				public void run() {
					for(int i = 0; i < 10; i++) {
						System.out.println(getName() + "...bb");
						try {
							Thread.sleep(10);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			}.start();

###24.12_多线程(守护线程)(掌握)
* setDaemon(boolean), 设置一个线程为守护线程, 该线程不会单独执行, 当其他非守护线程都执行结束后, 自动退出
	* 
			Thread t1 = new Thread() {
				public void run() {
					for(int i = 0; i < 50; i++) {
						System.out.println(getName() + "...aaaaaaaaaaaaaaaaaaaaaa");
						try {
							Thread.sleep(10);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			};
			
			Thread t2 = new Thread() {
				public void run() {
					for(int i = 0; i < 5; i++) {
						System.out.println(getName() + "...bb");
						try {
							Thread.sleep(10);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			};
			
			t1.setDaemon(true);						//将t1设置为守护线程
			
			t1.start();
			t2.start();

###24.13_多线程(加入线程)(掌握)
* join(), 当前线程暂停, 等待指定的线程执行结束后, 当前线程再继续
* join(int), 可以等待指定的毫秒之后继续
	* 
			final Thread t1 = new Thread() {
				public void run() {
					for(int i = 0; i < 50; i++) {
						System.out.println(getName() + "...aaaaaaaaaaaaaaaaaaaaaa");
						try {
							Thread.sleep(10);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			};
			
			Thread t2 = new Thread() {
				public void run() {
					for(int i = 0; i < 50; i++) {
						if(i == 2) {
							try {
								t1.join();	//插队,加入
								//t1.join(30);	//加入,有固定的时间,过了固定时间,继续交替执行
								Thread.sleep(10);
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
						}
						System.out.println(getName() + "...bb");
					}
				}
			};
			
			t1.start();
			t2.start();
###24.14_多线程(礼让线程)(了解)
* yield让出cpu
* 建议性的

###24.15_多线程(设置线程的优先级)(了解)
* setPriority(int)设置线程的优先级，参数越大优先级越高。
* 建议性的

###24.16_多线程(同步代码块)(掌握)
* 1.什么情况下需要同步  
	* 当多线程并发, 有多段代码同时执行时, 我们希望某一段代码执行的过程中CPU不要切换到其他线程工作. 这时就需要同步.
	* 如果两段代码是同步的, 那么同一时间只能执行一段, 在一段代码没执行结束之前, 不会执行另外一段代码.
* 2.同步代码块
	* 使用synchronized关键字加上一个锁对象来定义一段代码, 这就叫同步代码块
	* 多个同步代码块如果使用相同的锁对象, 那么他们就是同步的

			class Printer {
				Demo d = new Demo();
				public static void print1() {
					//锁对象可以是任意对象,但是被锁的代码需要保证是同一把锁,不能用匿名对象
					synchronized(d){				
						System.out.print("我");
						System.out.print("要");
						System.out.print("赚");
						System.out.print("大");
						System.out.print("钱");
						System.out.print("\r\n");
					}
				}
	
				public static void print2() {	
					synchronized(d){	
						System.out.print("努");
						System.out.print("力");
						System.out.print("学");
						System.out.print("习");
						System.out.print("\r\n");
					}
				}
			}

###24.17_多线程(同步方法)(掌握)
* 使用synchronized关键字修饰一个方法, 该方法中所有的代码都是同步的

		class Printer {
			public static void print1() {
				//锁对象可以是任意对象,但是被锁的代码需要保证是同一把锁,不能用匿名对象
				synchronized(Printer.class){		
					System.out.print("I");
					System.out.print("T");
					System.out.print("程");
					System.out.print("序");
					System.out.print("员");
					System.out.print("\r\n");
				}
			}
			/*
			 * 非静态同步函数的锁是:this
			 * 静态的同步函数的锁是:字节码对象
			 */
			public static synchronized void print2() {	
				System.out.print("杰");
				System.out.print("普");
				System.out.print("软");-
				System.out.print("件");
				System.out.print("\r\n");
			}
		}

###24.18_多线程(线程安全问题)(掌握)
* 多线程并发操作同一数据时, 就有可能出现线程安全问题
* 使用同步技术可以解决这种问题, 把操作数据的代码进行同步, 不要多个线程一起操作
			
			public class Demo2_Synchronized {

				/**
				 * @param args
				 * 需求:铁路售票,一共100张,通过四个窗口卖完.
				 */
				public static void main(String[] args) {
					TicketsSeller t1 = new TicketsSeller();
					TicketsSeller t2 = new TicketsSeller();
					TicketsSeller t3 = new TicketsSeller();
					TicketsSeller t4 = new TicketsSeller();
					
					t1.setName("窗口1");
					t2.setName("窗口2");
					t3.setName("窗口3");
					t4.setName("窗口4");
					t1.start();
					t2.start();
					t3.start();
					t4.start();
				}
			
			}
			
			class TicketsSeller extends Thread {
				private static int tickets = 100;
				static Object obj = new Object();
				public TicketsSeller() {
					super();
				}
				public TicketsSeller(String name) {
					super(name);
				}
				public void run() {
					while(true) {
						synchronized(obj) {
							if(tickets <= 0) 
								break;
							try {
								Thread.sleep(10);//线程1睡,线程2睡,线程3睡,线程4睡
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
							System.out.println(getName() + "...这是第" + tickets-- + "号票");
						}
					}
				}
			}

###24.19_多线程(火车站卖票的例子用实现Runnable接口)(掌握)
* 作业


###24.20_多线程(死锁)(了解)
* 多线程同步的时候, 如果同步代码嵌套, 使用相同锁, 就有可能出现死锁
	* 尽量不要嵌套使用
		
			private static String s1 = "筷子左";
			private static String s2 = "筷子右";
			public static void main(String[] args) {
				new Thread() {
					public void run() {
						while(true) {
							synchronized(s1) {
								System.out.println(getName() + "...拿到" + s1 + "等待" + s2);
								synchronized(s2) {
									System.out.println(getName() + "...拿到" + s2 + "开吃");
								}
							}
						}
					}
				}.start();
				
				new Thread() {
					public void run() {
						while(true) {
							synchronized(s2) {
								System.out.println(getName() + "...拿到" + s2 + "等待" + s1);
								synchronized(s1) {
									System.out.println(getName() + "...拿到" + s1 + "开吃");
								}
							}
						}
					}
				}.start();
			}

###24.21_多线程(以前的线程安全的类回顾)(掌握)
* A:回顾以前说过的线程安全问题
	* 看源码：Vector,StringBuffer,Hashtable    Collections.synchroinzedXxx(xxx)
	* Vector是线程安全的,ArrayList是线程不安全的
	* StringBuffer是线程安全的,StringBuilder是线程不安全的
	* Hashtable是线程安全的,HashMap是线程不安全的

* ****************************

###25.01_多线程(两个线程间的通信)(掌握)
* 1.什么时候需要通信
	* 多个线程并发执行时, 在默认情况下CPU是随机切换线程的
	* 如果我们希望他们有规律的执行, 就可以使用通信, 例如每个线程执行一次打印
* 2.怎么通信
	* 如果希望线程等待, 就调用wait()
	* 如果希望唤醒等待的线程, 就调用notify();
	* 这两个方法必须在同步代码中执行, 并且使用同步锁对象来调用

###25.02_多线程(三个或三个以上间的线程通信)
* 多个线程通信的问题
	* notify()方法是随机唤醒一个线程
	* notifyAll()方法是唤醒所有线程
	* JDK5之前无法唤醒指定的一个线程
	* 如果多个线程之间通信, 需要使用notifyAll()通知所有线程, 用while来反复判断条件
* 在同步代码块中，使用哪个对象锁，就使用该对象调用wait方法
* 为什么wait方法和notify方法定义在Object类中？
	* 因为锁对象可以是任意对象
* sleep方法和wait方法有什么区别？
	* sleep方法必须传入参数值，即一个时间值，时间到了自动醒来
	* wait方法中参数可有可无，有参表示过了参数时间后进入等待，否则直接等待
	* sleep方法在同步函数或同步代码块中，不释放锁
	* wait方法在同步函数或同步代码块中，释放锁
	
###25.03_多线程(JDK1.5的新特性互斥锁)(掌握)
* 1.同步
	* 使用ReentrantLock类的lock()和unlock()方法进行同步
	* 类似synchronized	
* 2.通信
	* 使用ReentrantLock类的newCondition()方法可以获取Condition对象
	* 需要等待的时候使用Condition的await()方法, 唤醒的时候用signal()方法
	* 不同的线程使用不同的Condition, 这样就能区分唤醒的时候找哪个线程了

###25.04_多线程(线程组的概述和使用)(了解)
* A:线程组概述
	* Java中使用ThreadGroup来表示线程组，它可以对一批线程进行分类管理，Java允许程序直接对线程组进行控制。
	* 默认情况下，所有的线程都属于【主线程组】
		* public final ThreadGroup getThreadGroup()//通过线程对象获取他所属于的组
		* public final String getName()//通过线程组对象获取他组的名字
	* 我们也可以给线程设置分组
		* 1,ThreadGroup(String name) 创建线程组对象并给其赋值名字
		* 2,创建线程对象
		* 3,Thread(ThreadGroup group, Runnable?target, String?name) 
		* 4,设置整组的优先级或者守护线程
	* B:案例演示
		* 线程组的使用,默认是主线程组
* 
		MyRunnable mr = new MyRunnable();
		Thread t1 = new Thread(mr, "张三");
		Thread t2 = new Thread(mr, "李四");
		//获取线程组
		// 线程类里面的方法：public final ThreadGroup getThreadGroup()
		ThreadGroup tg1 = t1.getThreadGroup();
		ThreadGroup tg2 = t2.getThreadGroup();
		// 线程组里面的方法：public final String getName()
		String name1 = tg1.getName();
		String name2 = tg2.getName();
		System.out.println(name1);
		System.out.println(name2);
		// 通过结果我们知道了：线程默认情况下属于main线程组
		// 通过下面的测试，你应该能够看到，默任情况下，所有的线程都属于同一个组
		System.out.println(Thread.currentThread().getThreadGroup().getName());

	* 自己设定线程组
* 			
		// ThreadGroup(String name)
		ThreadGroup tg = new ThreadGroup("这是一个新的组");

		MyRunnable mr = new MyRunnable();
		// Thread(ThreadGroup group, Runnable target, String name)
		Thread t1 = new Thread(tg, mr, "张三");
		Thread t2 = new Thread(tg, mr, "李四");
		
		System.out.println(t1.getThreadGroup().getName());
		System.out.println(t2.getThreadGroup().getName());
		
		//通过组名称设置后台线程，表示该组的线程都是后台线程
		tg.setDaemon(true);
###25.05_多线程(线程的五种状态)(掌握)
* 看图说话
* 新建,就绪,运行,阻塞,死亡

###25.06_多线程(线程池的概述和使用)(了解)
* A:线程池概述
	* 程序启动一个新线程成本是比较高的，因为它涉及到要与操作系统进行交互。
	而使用线程池可以很好的提高性能，尤其是当程序中要创建大量生存期很短的线程时，
	更应该考虑使用线程池。线程池里的每一个线程代码结束后，并不会死亡，
	而是再次回到线程池中成为空闲状态，等待下一个对象来使用。
	在JDK5之前，我们必须手动实现自己的线程池，从JDK5开始，Java内置支持线程池
* B:内置线程池的使用概述
	* JDK5新增了一个Executors工厂类来产生线程池，有如下几个方法
		* public static ExecutorService newFixedThreadPool(int nThreads)
		* public static ExecutorService newSingleThreadExecutor()
		* 这些方法的返回值是ExecutorService对象，该对象表示一个线程池，可以执行Runnable对象或者Callable对象代表的线程。它提供了如下方法
		* Future<?> submit(Runnable task)
		* <T> Future<T> submit(Callable<T> task)
	* 使用步骤：
		* 创建线程池对象
		* 创建Runnable实例
		* 提交Runnable实例
		* 关闭线程池
	* C:案例演示
		* 提交的是Runnable
* 
		// public static ExecutorService newFixedThreadPool(int nThreads)
		ExecutorService pool = Executors.newFixedThreadPool(2);

		// 可以执行Runnable对象或者Callable对象代表的线程
		pool.submit(new MyRunnable());
		pool.submit(new MyRunnable());

		//结束线程池
		pool.shutdown();
		
###25.07_多线程(多线程程序实现的方式3)(了解)
* 提交的是Callable
* 
		// 创建线程池对象
		ExecutorService pool = Executors.newFixedThreadPool(2);

		// 可以执行Runnable对象或者Callable对象代表的线程
		Future<Integer> f1 = pool.submit(new MyCallable(100));
		Future<Integer> f2 = pool.submit(new MyCallable(200));

		// V get()
		Integer i1 = f1.get();
		Integer i2 = f2.get();

		System.out.println(i1);
		System.out.println(i2);

		// 结束
		pool.shutdown();

		public class MyCallable implements Callable<Integer> {

			private int number;
		
			public MyCallable(int number) {
				this.number = number;
			}
		
			@Override
			public Integer call() throws Exception {
				int sum = 0;
				for (int x = 1; x <= number; x++) {
					sum += x;
				}
				return sum;
			}
		
		}
* 多线程程序实现的方式3的好处和弊端
	* 好处：
		* 可以有返回值
		* 可以抛出异常
		
	* 弊端：
		* 代码比较复杂，所以一般不用


###25.08_设计模式(简单工厂模式概述和使用)(了解)
* A:简单工厂模式概述
	* 又叫静态工厂方法模式，它定义一个具体的工厂类负责创建一些类的实例
* B:优点
	* 客户端不需要在负责对象的创建，从而明确了各个类的职责
* C:缺点
	* 这个静态工厂类负责所有对象的创建，如果有新的对象增加，或者某些对象的创建方式不同，就需要不断的修改工厂类，不利于后期的维护
* D:案例演示
	* 动物抽象类：public abstract Animal { public abstract void eat(); }
	* 具体狗类：public class Dog extends Animal {}
	* 具体猫类：public class Cat extends Animal {}
	* 开始，在测试类中每个具体的内容自己创建对象，但是，创建对象的工作如果比较麻烦，就需要有人专门做这个事情，所以就知道了一个专门的类来创建对象。
* 
		public class AnimalFactory {
			private AnimalFactory(){}
		
			//public static Dog createDog() {return new Dog();}
			//public static Cat createCat() {return new Cat();}
		
			//改进
			public static Animal createAnimal(String animalName) {
				if(“dog”.equals(animalName)) {}
				else if(“cat”.equals(animale)) {
		
				}else {
					return null;
				}
			}
		} 

###25.09_设计模式(工厂方法模式的概述和使用)(了解)
* A:工厂方法模式概述
	* 工厂方法模式中抽象工厂类负责定义创建对象的接口，具体对象的创建工作由继承抽象工厂的具体类实现。
	* 普通工厂模式【一个方法生产多种对象】
	* 多个工厂模式【多个方法各自生产对象】
	* 静态工厂模式【方法设置static】
	* 
	* 抽象工厂模式【将工厂抽象得到 抽象工厂基类】
* B:抽象工厂模式优点
	* 客户端不需要在负责对象的创建，从而明确了各个类的职责，如果有新的对象增加，只需要增加一个具体的类和具体的工厂类即可，不影响已有的代码，后期维护容易，增强了系统的扩展性
* C:缺点
	* 需要额外的编写代码，增加了工作量
* D:案例演示
* 
		动物抽象类：public abstract Animal { public abstract void eat(); }
		工厂接口：public interface Factory {public abstract Animal createAnimal();}
		具体狗类：public class Dog extends Animal {}
		具体猫类：public class Cat extends Animal {}
		开始，在测试类中每个具体的内容自己创建对象，但是，创建对象的工作如果比较麻烦，就需要有人专门做这个事情，所以就知道了一个专门的类来创建对象。发现每次修改代码太麻烦，用工厂方法改进，针对每一个具体的实现提供一个具体工厂。
		狗工厂：public class DogFactory implements Factory {
			public Animal createAnimal() {…}
		        }
		猫工厂：public class CatFactory implements Factory {
			public Animal createAnimal() {…}
		        }  
###25.10_多线程(单例设计模式)(掌握)
* 单例设计模式：保证类在内存中只有一个对象。

* 如何保证类在内存中只有一个对象呢？
	* (1)控制类的创建，不让其他类来创建本类的对象。private
	* (2)在本类中定义一个本类的对象。Singleton s;
	* (3)提供公共的访问方式。  public static Singleton getInstance(){return s}
* 单例写法两种：
	* (1)饿汉式 开发用这种方式。
	* 
			//饿汉式
			class Singleton {
				//1,私有构造函数
				private Singleton(){}
				//2,创建本类对象
				private static Singleton s = new Singleton();
				//3,对外提供公共的访问方法
				public static Singleton getInstance() {
					return s;
				}
				
				public static void print() {
					System.out.println("11111111111");
				}
			}
	* (2)懒汉式 面试写这种方式。多线程的问题？
	* 
			//懒汉式,单例的延迟加载模式
			class Singleton {
				//1,私有构造函数
				private Singleton(){}
				//2,声明一个本类的引用
				private static Singleton s;
				//3,对外提供公共的访问方法
				public static Singleton getInstance() {
					if(s == null)
						//线程1,线程2
						s = new Singleton();
					return s;
				}
				
				public static void print() {
					System.out.println("11111111111");
				}
			}
	* (3)第三种格式
	* 
			class Singleton {
				private Singleton() {}
			
				public static final Singleton s = new Singleton();//final是最终的意思,被final修饰的变量不可以被更改
			}
###25.11_多线程(Runtime类)
* Runtime类是一个单例类
	* 
			Runtime r = Runtime.getRuntime();
			//r.exec("shutdown -s -t 300");		//300秒后关机
			r.exec("shutdown -a");				//取消关机

###25.12_多线程(Timer)(掌握)
* Timer类:计时器

			public class Demo5_Timer {
				/**
				 * @param args
				 * 计时器
				 * @throws InterruptedException 
				 */
				public static void main(String[] args) throws InterruptedException {
					Timer t = new Timer();
					t.schedule(new MyTimerTask(), new Date(114,9,15,10,54,20),3000);
					
					while(true) {
						System.out.println(new Date());
						Thread.sleep(1000);
					}
				}
			}
			class MyTimerTask extends TimerTask {
				@Override
				public void run() {
					System.out.println("起床背英语单词");
				}
				
			}


###25.13_GUI(如何创建一个窗口并显示)
* Graphical User Interface(图形用户接口)。
* 
		Frame  f = new Frame(“my window”);
		f.setLayout(new FlowLayout());//设置布局管理器
		f.setSize(500,400);//设置窗体大小
		f.setLocation(300,200);//设置窗体出现在屏幕的位置
		f.setIconImage(Toolkit.getDefaultToolkit().createImage("qq.png"));
		f.setVisible(true);

###25.14_GUI(布局管理器)
* FlowLayout（流式布局管理器）
	* 从左到右的顺序排列。
	* Panel默认的布局管理器。
* BorderLayout（边界布局管理器）
	* 东，南，西，北，中(填充所有)
	* Frame默认的布局管理器。
* GridLayout（网格布局管理器）
	* 规则的矩阵
* CardLayout（卡片布局管理器）
	* 选项卡
* GridBagLayout（网格包布局管理器）
	* 非规则的矩阵(计算器应用)
	
###25.15_GUI(窗体监听)
	Frame f = new Frame("我的窗体");
	//事件源是窗体,把监听器注册到事件源上
	//事件对象传递给监听器
	f.addWindowListener(new WindowAdapter() {
	          public void windowClosing(WindowEvent e) {
	                     //退出虚拟机,关闭窗口
			System.exit(0);
		}
	});

###25.16_GUI(鼠标监听)
* 组件.addMouseListener(new MouseAdapter(){ 重写方法; });

###25.17_GUI(键盘监听和键盘事件)
###25.18_GUI(动作监听)
* 默认就是空格键 鼠标左键
* 组件.addActionListener(new ActionListener(){ ... });
* 
###25.19_设计模式(适配器设计模式)(掌握)
* a.什么是适配器
	* 在使用监听器的时候, 需要定义一个类事件监听器接口.
	* 通常接口中有多个方法, 而程序中不一定所有的都用到, 但又必须重写, 这很繁琐.
	* 适配器简化了这些操作, 我们定义监听器时只要继承适配器, 然后重写需要的方法即可.
* b.适配器原理
	* 适配器就是一个类, 实现了监听器接口, 所有抽象方法都重写了, 但是方法全是空的.
	* 适配器类需要定义成抽象的,因为创建该类对象,调用空方法是没有意义的
	* 目的就是为了简化程序员的操作, 定义监听器时继承适配器, 只重写需要的方法就可以了.
###25.20_GUI(需要知道的) 
* 事件处理
	* 事件: 用户的一个操作
	* 事件源: 被操作的组件
	* 监听器: 一个自定义类的对象, 实现了监听器接口, 包含事件处理方法,把监听器添加在事件源上, 当事件发生的时候虚拟机就会自动调用监听器中的事件处理方法
###25.21_day25总结
	把今天的知识点总结一遍。