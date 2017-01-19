//: Playground - noun: a place where people can play

import UIKit

//1. var (for variable) & let (for constant)

var str = "Hello, playground"


//2. object type

type(of:str)

var x = 100
var y = Double(x)
type(of:y)

//3. string contatenation

var first:String = "Hello "
var second:String = "from the other side"
var combined = first + second

//4. string interpolation

var z:Int = 2

var combined2 = combined + "\(z)"

"I ate breakfast \(z) times"

//5. optional: it has two possible values: Nil, or a numeric value (to prevent crashes)

var a:String = "9r3289"
var aToInt = Int(a)  //this is an optional, which gives nil, not error

//aToInt! //this "!" is to unwrap the optional, that gives an error

type(of:aToInt)
type(of:aToInt!)

//6. lazy variables