/*事物的理解：原子性，一致性，持久性，隔离性
jvm的优化：a).设置参数 设置jvm的最大内存数
b).垃圾回收器的选择
对象的创建：a).遇到一个心类时，会进行类的加载，定位到class文件
            b).对所有静态成员量初始化，静态代码块也会执行，而且只在类加载的时候执行一次
            c).New对象时，jvm会在堆区中分配一个足够大的存储空间
            d).存储空间清空，为所有的变量赋值，所有的对象引用赋值为null
            e).根据书写的位置给字段一些初始化操作
            d).调用构造方法
     23.类加载的过程
        a).遇到一个新的类时，首先会到方法区找到class文件，如果没有找到就会去硬盘中找到class文件，找到后会返回，将class文件加载到方法区中，在类中加载的时候，静态成员变量会被分配到方法区的静态城区，非静态区变量分配到非静态区，然后开始给静态成员初始化，赋值默认值，赋值默认值，会根据静态成员变量书写的位置赋值显示值，然后执行静态代码。当所有的静态代码执行完，类加载才算完。
    24.Tomcat 服务器优化
    a).内存优化  b).线程数优化  c).优化缓存
    25.数据库优化
      a).选择合适的字段 ，尽量把字段设置成notnull，这样数据库就不用比较null值。
      b).使用关联查询(left join on)查询代替子查询
      c).使用union联合查询手动创建临时表
      d).开启事物，当数据库执行多条语句出现错误时，事物会回滚，可以维护数据库的完整性
      e).使用外键，事物可以维护数据的完整性但是它却不能保证数据库的，使用外键可以保证数据库的关联性
      f).使用索引，索引是提高数据库性能的常用方法，它可以另数据库服务比没有索引的更快
      g).优化的查询语句，绝大数情况下，使用索引可以提高查询效率。
      Arrayliat与linkedlist的区别？
      arraylist底层是数组，查询快，增删慢。linkedlist底层是基于链表，查询慢，增删酷快。          hibernate的核心思想
      a).hibernate的核心思想是ROM对象关系映射机制。它是将表与表之间的操作映射成对象与对象之间的操作，也就是从数据库中提取的信息会自动按照你设置的映射要求封装成特定的对象。所以hibernate就是通过将数据表实体类映射，是的对对象的修改对应数据行的修改。
      多线程：
      a).一个进程是一个独立的运行环境，可以看做是一个程序，而线程可以看作是进程的一个任务，比如qq是一个进程，而一个qq窗口是一个线程。
      b).在多线程程序中，多线程并发可以提高程序的效率，cpu不会因为某个线程等待资源而进入空闲狂态，它会把资源让给其他线程。
      c).用户线程就是我们开发程序是创建的线程，而守护线程为系统线程，如jvm虚拟机中GC
      d).线程的优先级别：每个线程都有优先级别，有限级别高的可以先获取cpu资源使该线程从就绪状态转为运行状态。也可以自定义线程的有线级别
      e）.死锁：至少两个线程争取两个以上cpu资源，避免死锁就避免使用嵌套所。
*
*
*
*
* */
