### 协变性和逆变性

```
__covariant - 协变性，子类型可以强转到父类型
__contravariant - 逆变性，父类型可以强转到子类型 (WTF?)
```

有序字典的实现思路:

```
继承NSDictionary,重写字典的方法，用到什么方法就重写什么方法，如果不重写调用的话，会引起程序崩溃。具体原因如下描述:
NSDictionary is a class cluster. This means that the value returned from its init methods is not strictly an NSDictionary, but a subclass that implements the actual functionality. In almost every case, it is better to give your class an NSDictionary as an instance variable or to simply define a category on NSDictionary.

重写最基本的方法：
1. count
2. objectForKey:
3. keyEnumerator
因为再把字典中的数据从内存中展示出来的时候，编译器其实是走了这几个方法:先拿到字典中数量，再去拿到字典中所有的key，在根据key去加载value。如果想要看的清楚，可以重写
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level方法。
更加系统一点的字典就是实现原生字典，实现的一切协议，重写他们的方法。
```

