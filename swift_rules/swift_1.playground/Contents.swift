
//MARK: 01-初体验  == OC:#pragma mark

// 1.Swift如何导入框架
// OC : #import <UIKit/UIKit.h>
import UIKit

//在swift中当一行中只有一条语句,那么语句结束时,可以不加;

// 2.如何定义标识符
// OC : int a = 20; a = 10
// Swift中定义标识符:必须明确指定该标识符是一个变量还是一个常量
// 使用var修饰的标识符是变量
// 使用let修饰的标识符是常量
var a:Int = 20
a = 10

let b:Double = 3.14
//b = 3.15 错误写法

//可以用中文或者符号定义常量或者变量
let 王众 = "狼"

// 3.Swift中如何打印内容
// NSLog(@"%d", a); NSLog(@"hello world");
print(a)
print(b)
print(王众)
print("hello world");


//MARK: 02-常量&变量的使用注意.
//MARK: 03-Swift中创建对象的补充

// 注意一: 在开发中优先使用常量, 防止其他同事不小心修改了存储的值

// 注意二: 常量的本质:指向的内存地址不可以修改, 但是可以通过指向的内存地址找到对象,之后修改对象内部的属性
// UIView *view = [UIView alloc] init];
// 在Swift中创建对象: UIView()

 var viewB : UIView = UIView()
 viewB = UIView()


// 1.创建UIView对象
let view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))//init 方法
// view = UIView() 错误写法: 常量的内存地址不可以被修改

// 2.修改对象内部的属性
view.alpha = 0.5
view.backgroundColor = UIColor.red



// 3.添加子控件
// Swift中使用枚举类型: 1.方式一:枚举类型.具体的类型 2. .具体的类型
// 3.1.创建UIButton对象
let button:UIButton = UIButton(type: UIButtonType.custom) //简略写法 .custom
// 3.2.设置btn的属性
button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
button.setTitle("按钮", for: .normal)
button.backgroundColor = UIColor.blue
// 3.3.将btn添加View中
view.addSubview(button)



//MARK: 04-类型推导
/*
 Swift中类型推导
 1.如果在定义标识符,有直接给该标识符赋值,那么标识符后面的类型可以省略
 2.Swift中有类型推导,会自动根据赋值的类型推导出前面标识符的类型
 3.可以通过option + 鼠标左键,查看标识符的类型 (opanation：非常重要的技巧)
 */

let m = 10
var n = 1.44

let btn = UIView()

// 错误写法:
// let btn : UIButton = UIView()
let btn1 : UIView = UIButton()


//MARK: 05-基本运算
/*
 OC代码
 int a = 20;
 CGFloat b = 2.55;
 CGFloat result = a + b;
 */

let a5 = 20
let b5 = 2.45

// 错误写法: let result = a5 + b5  : Int 和 Double 类型不能直接 +

// 相加结果是Int的情况
let tempB = Int(b5) // 将Double类型转成Int类型
let result = a5 + tempB

// 相加结果是Double的情况
let tempA = Double(a5)
let result1 = tempA + b5


//MARK: 06-逻辑分支(if的使用)
let a6 = 10

// 1.if OC的使用
/*
 if (a6) {
 NSLog(@"a6不等于0");
 } else {
 NSLog(@"a6等于0");
 }
 */

if a6 != 0 {
    print("a不等于0")
} else {
    print("a等于0")
}

if a6 > 0 {
    print("a大于0")
} else {
    print("a小于等于0")
}

// 2.else if的使用
let score = 100

if score < 0 || score > 100 {
    print("不合理分数")
} else if score < 60 {
    print("不及格")
} else if score < 80 {
    print("及格")
} else if score < 90 {
    print("良好")
} else {
    print("不错哦")
}


//MARK: 07-逻辑分支(三目运算符)
let m7 = 20
let n7 = 30

/* 使用if 需要使用变量
 var result = 0
 
 if m7 > n7 {
 result = m7
 } else {
 result = n7
 }
 */

let result7 = m7 > n7 ? m7 : n7



//MARK: 08-逻辑分支(guard的使用) 守卫
let age = 21
let 带了钱 = true;
let 带了身份证 = true;

/*
 func online(age : Int) {
 if age >= 18 {
 if 带了钱 {
 if 带了身份证 {
 print("开机上网")
 } else {
 print("回家拿身份证")
 }
 
 } else {
 print("回家拿钱")
 }
 } else {
 print("回家找妈妈")
 }
 }
 */

// guard : 守卫
func online(age : Int) {
    // 1.判断年龄
    guard age >= 18 else {
        print("回家找妈妈")
        return
    }
    
    // 2.判断是否带了钱
    guard 带了钱 else {
        print("回家拿钱")
        return
    }
    
    // 3.判断是否带了身份证
    guard 带了身份证 else {
        print("回家拿身份证")
        return
    }
    
    print("开机上网")
}

online(age:age)


//MARK: 09-逻辑分支(switch的用法)
// sex: 0 -> 男  1 -> 女 其它: 其它
let sex = 0

/*
 if sex == 0 {
 print("男")
 } else if sex == 1 {
 print("女")
 } else  {
 print("其它")
 }
 */

/*
 1.switch基本用法
 1> switch后面的()可以省略
 2> case结束后可以不加break,那么系统会加上break
 2.基本用法的补充
 1> 在swift中case后面是可以判断多个条件,并且多个条件以,分割
 2> 如果系统case产生case穿透,可以在case结束后跟上fallthrough(不建议使用)
 */

/* 基本用法的代码
 switch sex {
 case 0:
 print("男")
 case 1:
 print("女")
 default:
 print("其它")
 }
 */

switch sex {
case 0, 1:
    print("正常人")
    fallthrough
default:
    print("其它")
}



//MARK: 10-逻辑分支(switch的特殊用法)
// 1.判断浮点型
let m10 = 3.14

switch m10 {
case 3.14:
    print("和π相等")
default:
    print("和π不相等")
}

// 2.判断字符串
let a10 = 20
let b10 = 30
let oprationStr = "*"
var result10 = 0

switch oprationStr {
case "+":
    result10 = a10 + b10
case "-":
    result10 = a10 - b10
case "*":
    result10 = a10 * b10
case "/":
    result10 = a10 / b10
default:
    print("非操作符")
}

// 3.判断区间
// 区间: 数字区间
// 半开半闭区间: 0..<10 0~9
// 闭区间:      0...10 0~10
let score10 = 92

switch score10 {
case 0..<60:
    print("不及格")
case 60..<80:
    print("及格")
case 80..<90:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("不合理的分数")
}


//MARK: 11-循环(for循环)
/*
 OC写法
 for (int i = 0; i < 10; i++) {}
 for (NSString *name in names) {}
 */

//swift 3.0 中已删除
//// 1.最基本写法: for后面的()可以省略(少见)
//for var i = 0; i < 10; i++ {
//    print(i)
//}

// 2.区间遍历
for i in 0..<10 {
    print(i)
}

for i in 0...10 {
    print(i)
}

// 3.打印10次hello world
// 如果下标值不需要使用,则可以使用 _ 来代替
for _ in 0..<10 {
    print("hello world")
}


//MARK: 12-循环(while&dowhile循环)
// 1.while循环
/*
 和OC的区别
 1> while后面的()可以省略
 2> while后面的判断句没有非0(nil)即真
 */

var m12 = 10

while m12 != 0 {
    m12 -= 1 //error: '++' is unavailable: it has been removed in Swift 3
    print(m12)
}

// 2.do while循环
/*
 和OC的区别
 1> 和while一致
 2> 不在使用do,而是用repeat代替do关键字
 */
repeat {
    print(m12)
    m12 += 1
} while m12 < 10


//MARK: 13-字符串的使用
// 1.定义字符串
// 1.1.定义不可变字符串 let修饰
let str = "hello swift"
// str = "hello Objective-C" 错误写法

// 1.2.定义可变字符串 var修饰
var strM = "hello world"
strM = "hello china"

// 2.字符串的使用
// 2.1.获取字符串的长度 没有oc中的.length
let count = str.characters.count

// 2.2.遍历字符串中所有的字符
for c in str.characters {
    print(c)
}

// 3.字符串的拼接
// 3.1.字符串和字符串之间的拼接
let str1 = "首验"
let str2 = "查杀"
// let str3 = [NSString stringwithFormat:@"%@%@", str1, str2]
let str3 = str1 + str2

// 3.2.字符串和其它标识符之间的拼接
let name = "王众"
let age13 = 18
let height = 1.75

// let info = [NSString stringwithformat:@"my name is %@, age is %d, height is %f", name, age, height]
let info = "my name is \(name), age is \(age), height is \(height)"

// 3.3.字符串拼接过程中进行格式化
let min = 3
let second = 22
// let timeStr = [NSString stringwithformat:@"%02d:%02d", min, second];
let timeStr = String(format: "%02d:%02d", arguments: [min, second])
String(format: "%03d:%03d", min,second)


//MARK: 14-字符串的截取
// 0.定义字符串
let urlString = "www.520it.com"

// 1.方式一: 将String类型转成NSString类型,再进行截取
let header = (urlString as NSString).substring(to: 3)
let footer = (urlString as NSString).substring(from: 10)
let range = NSMakeRange(4, 5)
let middle = (urlString as NSString).substring(with: range)


// 2.方式二: 采用swift原有的方法
let headerIndex = urlString.index(urlString.startIndex, offsetBy: 3)
let header1 = urlString[urlString.startIndex...headerIndex]

let footerIndex = urlString.index(urlString.endIndex, offsetBy: -3)
let footer1 = urlString[footerIndex..<urlString.endIndex]

let middle1 = urlString[headerIndex...footerIndex]


//MARK: 15-数组的使用
// 1.数组的定义
// 1.1.定义不可变数组: 使用let修饰 [String] --> Array<String>
let array = ["by", "xd", "tc", "wz"]

// 1.2.定义可变数组: 使用var修饰
// var arrayM = Array<String>() 不常见
var arrayM = [String]() // 常见


// 2.可变数组的基本操作(增删改查)
// 2.1.添加元素
arrayM.append("by")
arrayM.append("xd")
arrayM.append("tc")

// 2.2.删除元素(会将删除元素返回)
arrayM.remove(at: 0)

// 2.3.修改元素
arrayM[0] = "wz"
arrayM

// 2.4.根据下标值获取元素
arrayM[0]
arrayM[1]
// arrayM[2] 下标值越界错误


// 3.数组的遍历
// 3.1.根据下标值进行遍历
for i in 0..<array.count {
    print(array[i])
}

// 3.2.forin遍历方式
// for (NSString *name in array)
for name in array {
    print(name)
}

// 3.3.forin遍历方式,同时可以拿到下标值
for (index, name) in array.enumerated() {
    print(index)
    print(name)
}

// 3.4.遍历数组中其它一部分元素(了解)
for i in 0..<2 {
    print(array[i])
}

for name in array[0..<2] {
    print(name)
}


// 4.数组的合并
// 在swift中相同类型的数组可以相加加合并
let array1 = [10, 20, 30]
let array2 = [100, 200, 300]
let resultArray = array1 + array2


// 错误写法
/*
 let array1 = ["by", "xd"]
 let array2 = [18, 20]
 // let resultArray = array1 + array2
 
 var resultArray = [NSObject]()
 
 for item in array1 {
 resultArray.append(item)
 }
 for item in array2 {
 resultArray.append(item)
 }
 
 resultArray
 */


//MARK: 16-字典的使用
// 1.字典的定义
// 1.1.不可变字典的定义: 使用let修饰
// 编译器会自动判断[]中是键值对(字典)还是元素(数组)
// [String : NSObject] --> Dictionary<String, NSObject>
let dict = ["name" : "why", "age" : 18, "height" : 1.88] as [String : Any]

// 1.2.可变字典的定义: 使用var修饰
// var dictM = Dictionary<String, NSObject>()
var dictM = [String : NSObject]()


// 2.可变字典的基本操作(增删改查)
// 2.1.添加元素
dictM.updateValue("by" as NSObject, forKey: "name")
dictM.updateValue("xd" as NSObject, forKey: "name")
dictM["age"] = 10 as NSObject?
dictM["height"] = 1.60 as NSObject?
dictM


// 2.2.删除元素
dictM.removeValue(forKey: "age")
dictM

// 2.3.修改元素
dictM.updateValue(1.58 as NSObject, forKey: "height")
dictM["height"] = 1.50 as NSObject?
dictM

// 2.4.取出元素
dictM["name"]


// 3.字典的遍历
// 3.1.遍历字典中所有的key
for key in dict.keys {
    print(key)
}

print("----------")

// 3.2.遍历字典中所有的value
for value in dict.values {
    print(value)
}

print("----------")

// 3.3.遍历字典中所有的key/value
for (key, value) in dict {
    print(key)
    print(value)
}


// 4.字典的合并
// 即使类型一致,也不能相加合并
let dict1 = ["name" : "why", "age" : 18] as [String : Any]
var dict2 = ["height" : 1.88, "phoneNum" : "+86 110"] as [String : Any]

// let resultDict = dict1 + dict2
/* 方式一:
 var resultDict = [String : NSObject]()
 for (key, value) in dict1 {
 resultDict[key] = value
 }
 for (key, value) in dict2 {
 resultDict[key] = value
 }
 
 resultDict
 */

for (key, value) in dict1 {
    dict2[key] = value
}



