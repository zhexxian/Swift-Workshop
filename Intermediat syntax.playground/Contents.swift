//: Playground - noun: a place where people can play

import UIKit

//1. control statements

for index in 1...5 {
    //code
    print(index)
}

for i in stride (from: 1, to: 9, by: 2){
    print(i)
}

var x = 100

if (x==100) {
  
}

while x>100 {

}

switch x {

case 1: print ("x is 1")
case 2: print ("x is 2")
default: print ("x is neither")
    
}

//2. tuple, arrays, dictionaries

var myTuple = (1, "hello")
myTuple.0
myTuple.1


var myArray:[Int] = [1,15,23]
myArray.append(123)
myArray[3]
myArray.insert(13, at: 0)

var myDictionary:Dictionary<String, String> = ["key1":"value1", "key2":"value2"]
myDictionary["key1"]


//3. functions

func prepareMeme(){
}

//4. class
class myClass{
}
