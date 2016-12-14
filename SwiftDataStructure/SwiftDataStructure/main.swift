import Foundation

enum DataError: Error {
  case IncorrectParameter
  case MinMoreThanMax
  case NoNumber
}

/*
 * Task 1. Description:
 * Write a function which prints all integer number from А to В where number has N of digit seven.
 * If no number current function must print 'No number'.
 * Range limits input as function's arguments.
*/

func findNumbers(from min: Int, to max: Int, whereCountOfSeven n: Int) throws -> [Int] {
  
  // Handling errors
  guard n >= 0 else {
    throw DataError.IncorrectParameter
  }
  guard min <= max else {
    throw DataError.MinMoreThanMax
  }
  
  guard n != 0 else {
    throw DataError.NoNumber
  }
  
  var necessaryNumbers = [Int]()
  
  for number in min...max {
    var countOfFoundedNumberSeven: Int = 0
    for digit in String(number).characters {
      if digit == "7" {
        countOfFoundedNumberSeven += 1
      }
    }
    if countOfFoundedNumberSeven == n {
      necessaryNumbers.append(number)
    }
  }
  
  return necessaryNumbers
}

// Testing findNumbers(from:to:)
do {
  print(try findNumbers(from: 1001, to: 1000, whereCountOfSeven: 2))
} catch DataError.MinMoreThanMax {
  print("findNumbers(from:to:):\nEror: Min > Max.\n")
}

do {
  print(try findNumbers(from: 0, to: 1000, whereCountOfSeven: 0))
} catch DataError.NoNumber {
  print("findNumbers(from:to:):\nAlert: No neccessary numbers.\n")
}

do {
  print(try findNumbers(from: 0, to: 1000, whereCountOfSeven: -1))
} catch DataError.IncorrectParameter {
  print("findNumbers(from:to:):\nError: Second parameter is incorrect.\n")
}

/*
 * Task 2
 * Write a function which will get three-digit number.
 * Calculate and print a number, which is reverse version of number argument.
 * Do not use string methods.
 */

func reverseNumber(number: Int) throws -> Int {
  
  // Handling errors
  guard number > 100 && number < 1_000 else {
    throw DataError.IncorrectParameter
  }
  
  // Parsing
  let firstDigit:    Int = number / 100
  let secondDigit:   Int = number / 10 % 10
  let thirdDigit:    Int = number % 10
  
  let reverseNumber: Int = thirdDigit * 100 + secondDigit * 10 + firstDigit
  
  return reverseNumber
}

// Testing reverseNumber(number:)
do {
  print(try reverseNumber(number: 99))
} catch DataError.IncorrectParameter {
  print("reverseNumber(number:):\nError: Incorrect parameter value.\n")
}

/*
 * Task 3
 * Write a function which will get four-digit decimal number,
 * handle and print the number which can be lucky or not(The sum of first and second digits equal to the sum of the last ones digits).
 * Do not use string methods.
 */

func isLuckyNumber(_ number: Int) throws -> Bool {
  
  // Handling Errors
  guard number > 999 && number < 10_000 else {
    throw DataError.IncorrectParameter
  }
  
  // Parsing
  let firstDigit:  Int = number / 1000
  let secondDigit: Int = number / 100 % 10
  let thirdDigit:  Int = number / 10 % 10
  let fourthDigit: Int = number % 10
  
  let firstHalf:   Int = firstDigit + secondDigit
  let secondHalf:  Int = thirdDigit + fourthDigit
  
  return firstHalf == secondHalf ? true : false
  
}

// Testing isLuckyNumber(:)
do {
  print(try isLuckyNumber(999))
} catch DataError.IncorrectParameter {
  print("isLuckyNumber(:):\nError: Incorrect parameter value.\n")
}

do {
  print(try isLuckyNumber(10_000))
} catch DataError.IncorrectParameter {
  print("isLuckyNumber(:):\nError: Incorrect parameter value.\n")
}

/*
 * Task 4
 * Implement the Factorial method.
 */

func factorial(_ number: Int) -> Int? {
  if number < 0 {
    return 0
  }
  if number == 1 {
    return 1
  }
  
  var result = 1
  
  for i in 1...number {
    result *= i
  }
  
  return result
}

/*
 * Task 5
 * Calculate the result of Y=F(X) which is defined by graph:
 * y = 0.5   while X<=-0.5
 * y = X+1   while -0.5<X<=0
 * y = X*X-1 while 0<X<=1
 * y = X-1   while X>1
 * Advanced level: write the function using Switch statement.
 */

func simpleFunctionY(_ x: Float) -> Any? {
  var y: Float?
  var useCase: Int = 0
  
  if x <= -0.5 {
    useCase = 0
  }
  if x > -0.5 && x <= 0 {
    useCase = 1
  }
  if x > 0 && x <= 1 {
    useCase = 2
  }
  if x > 1 {
    useCase = 3
  }
  
  switch useCase {
  case 0:
    return 0
  case 1:
    y = x + 1
  case 2:
    y = sqrt(x) - 1
  case 3:
    y = x - 1
  default:
    return nil
  }
  
  return y!
}

/*
 * Task 6
 * Calculate the result of the function G=F(X) which is defined by graph:
 * y = sin(π/2)       while X<=0.5
 * y = sin((X-1)*π/2) while X>0.5
 */

func simpleFunctionG(_ x: Double) -> Double {
  var y: Double?
  
  if x <= 0.5 {
    y = sin(M_PI / 2)
  } else {
    y = sin((x - 1) * M_PI / 2)
  }
  
  return y!
}

/*
 * Task 8
 * Write a function which will find and print all three-digit numbers,
 * whose values are equaled to their value with triple power(x == x ^^ 3)
 */

func pow(number: Int, power: Int) -> Int {
  var result: Int = 1
  
  switch power {
  case 0:
    return 1
  case 1:
    return number
  default:
    for _ in 1...power {
      result = result * number
    }
    return result
  }
}

func findMagicNumbers() -> [Int] {
  var result: [Int] = []
  
  for i in 100...999 {
    let firstDigit:  Int = i / 100
    let secondDigit: Int = i / 10 % 10
    let thirdDigit:  Int = i % 10
    
    let threeTripleDigitsTogether: Int = pow(number: firstDigit, power: 3) + pow(number: secondDigit, power: 3) + pow(number: thirdDigit, power: 3)
    
    if i == threeTripleDigitsTogether {
      result.append(i)
    }
  }
  return result
}

//findMagicNumbers()

/*
 * Task 9
 * Write a function which will get natural numbers as 'n' and 'k'.
 * The function must define 'k' digit on number æn'.
 */

func findDigit(forNumber n: Int, onPosition k: Int) throws -> Int {
  guard k > 0 else {
    throw DataError.IncorrectParameter
  }
  
  var digits: [String] = []
  let index:  Int = k - 1
  
  for digit in String(n).characters {
    digits.append(String(digit))
  }
  
  return Int(digits[index])!
}

// Testing findDigit(forNumber:onPosition:)
do {
  print(try findDigit(forNumber: 450941, onPosition: 0))
} catch DataError.IncorrectParameter {
  print("findFigit(forNumber:onPosition:):\nError: Incorrect argument 'onPosition'\n")
}

/*
 * Задание 10
 * Написать функцию, вычисляющее число Фибоначчи.
 */

func fibonacci(_ number: Int) -> Int {
  if number < 0 {
    return 0
  }
  
  switch number {
  case 0:
    return 0
  case 1:
    return 1
  default:
    return fibonacci(number - 1) + fibonacci(number - 2)
  }
}

//fibonacci(7)

/*
 * Task 11
 * Write a function which will get a natural number 'N'.
 * One-dimensional array with length 'N' must be pushed by random integer numbers.
 * The function must print all prime numbers from random array.
 * It's possible to use the global function arc4random() for generating random number.
 * Take attention that arc4random() returns UInt32 by default.
 */

func createRandomArray(withLength length: Int) throws -> ([Int], [Int]) {
  guard length != 0 else {
    throw DataError.NoNumber
  }
  guard length > 0 else {
    throw DataError.IncorrectParameter
  }
  
  var generatedArray: [Int] = []
  var primeNumbers:   [Int] = []
  
  for _ in 1...length {
    generatedArray.append(Int(arc4random() % 100))
  }
  
  thisWay: for number in generatedArray {
    let preNumber = number - 1
    for divider in 2...preNumber {
      if number % divider == 0 {
        continue thisWay
      }
    }
    primeNumbers.append(number)
  }
  
  return (generatedArray, primeNumbers)
}

// Testing createRandomArray(withLength:)
do {
  print(try createRandomArray(withLength: -1))
} catch DataError.IncorrectParameter {
  print("createRandomArray(withLength:):\nError: The length cannot be negative.\n")
}
do {
  print(try createRandomArray(withLength: 0))
} catch DataError.NoNumber {
  print("createRandomArray(withLength:):\nAlert: The length is 0. No number were founded.\n")
}

/*
 * Task 12
 * Write a function with parameter N, where N is the length of random array by integer values.
 * The function must find two minimal elements in created random array.
 */

func createRandomArrayWithLength(_ length: Int, andPrint2MinimalElements show: Bool) throws -> ([Int], [Int]) {
  guard length != 0 else {
    throw DataError.NoNumber
  }
  guard length > 0 else {
    throw DataError.IncorrectParameter
  }
  
  var generatedArray:  [Int] = []
  var minimalElements: [Int] = []
  var minimalElement:  Int   = 0
  
  for _ in 1...length {
    generatedArray.append(Int(arc4random() % 100))
  }
  
  var copiedGeneratedArray = generatedArray
  
  for _ in 1...2 {
    minimalElement = copiedGeneratedArray.first!
    
    for element in copiedGeneratedArray {
      if minimalElement < element {
        continue
      } else {
        minimalElement = element
      }
    }
    
    minimalElements.append(minimalElement)
    // removing first minimal element from copied array:
    if let element = copiedGeneratedArray.index(of: minimalElement) {
      copiedGeneratedArray.remove(at: element)
    }
  }
  
  if show == true {
    return (generatedArray, minimalElements)
  } else {
    return (generatedArray, [0,0])
  }
}

// Testing createRandomArrayWithLength(:andPrint2MinimalElements:)
do {
  print(try createRandomArrayWithLength(0, andPrint2MinimalElements: true))
} catch DataError.NoNumber {
  print("createRandomArrayWithLength(:andPrint2MinimalElements:):\nAlert: The length is 0. No numbers were found.\n")
}
do {
  print(try createRandomArrayWithLength(-1, andPrint2MinimalElements: true))
} catch DataError.IncorrectParameter {
  print("createRandomArrayWithLength(:andPrint2MinimalElements:):\nError: The length of the array cannot be negative.\n")
}

/*
 * Task 13
 * Create and print two-dimensional matrix with size N*N (where N < 20).
 * Find the sum of the two diagonals using the value of the matrix element.
 */

func createMatrixWithLength(_ length: Int) throws -> ([[Int]], Int, Int) {
  guard length != 0 else {
    throw DataError.NoNumber
  }
  guard length <= 20 && length >= 1 else {
    throw DataError.IncorrectParameter
  }
  
  var generatedArray = Array<Array<Int>>()
  var firstSum:  Int = 0
  var secondSum: Int = 0
  
  for _ in 1...length {
    var subArray: [Int] = []
    
    for _ in 1...length {
      subArray.append(Int(arc4random() % 100))
    }
    
    generatedArray.append(subArray)
  }
  // sum for left and right diagonals
  for i in 0..<length {
    // sum for left diagonal
    firstSum = firstSum + generatedArray[i][i]
    // sum for right diagonal
    secondSum = secondSum + generatedArray[i][length - 1 - i]
  }
  
  return (generatedArray, firstSum, secondSum)
}

// Testing createMatrixWithLength(:)
do {
  print(try createMatrixWithLength(0))
} catch DataError.NoNumber {
  print("createMatrixWithLength(:):\nAlert: The length is 0. No numbers were found.\n")
}
do {
  print(try createMatrixWithLength(133))
} catch DataError.IncorrectParameter {
  print("createMatrixWithLength(:)\nError: Incorrect parameter.\n")
}

/*
 * Task 14
 * Generate integer array A(75),
 * where elements are randoms in range [-5, 20].
 * Find two number which have the most difference.
 */

func findMinAndMaxInRandomList() -> (Int, Int) {
  var list: [Int] = []
  var min:  Int   = 20
  var max:  Int   = -5
  
  for _ in 1...75 {
    list.append(Int(arc4random_uniform(26)) - 5)
  }
  
  for number in list {
    if min > number {
      min = number
    }
    if max < number {
      max = number
    }
  }
  
  return (min, max)
}

//findMinAndMaxInRandomList()

/*
 * Task 15
 * Find the greatest GCD among two numbers using Euclidean algorithm.
*/

// greatest common divisor
func gcd(_ a: Int, _ b: Int) -> Int? {
  var greater: Int  = 0
  var smaller: Int  = 0
  
  if a == b {
    return a
  }
  if a > b {
    greater = a
    smaller = b
  } else {
    greater = b
    smaller = a
  }
  
  repeat {
    let updatedGreater = greater - smaller
    greater = updatedGreater
    
    // exit from this repeat-while loop
    if greater == smaller {
      return greater
    }
    
    if greater > smaller {
      continue
    } else {
      greater = smaller
      smaller = updatedGreater
    }
    
  } while !(greater == smaller)
  
  // if error will appear..
  return nil
}

/*
 * Task 9
 * Write a function for reducing a fraction.
 * The fraction sends to the function dividing into two parts as parameters: first is numberator and second is denomerator.
 */

func reduceFraction(_ numerator: Int, _ denomerator: Int) -> (Int, Int)? {
  let gcvValue = gcd(numerator, denomerator)
  let newNumerator = numerator / gcvValue!
  let newDenomerator = denomerator / gcvValue!
  
  return (newNumerator, newDenomerator)
}
