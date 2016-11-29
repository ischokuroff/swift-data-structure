import Foundation

/*
 * Задание 1
 * Написать функцию, которая выводит на экран все натуральные числа из диапазона от А до В в записи которых цифра 7 встречается N раз.
 * При отсутствии чисел с указанными свойствами выдать на экран сообщение "Требуемых чисел нет".
 * Границы диапазона А и В и значение N задаются как параметры функции.
 * Объекты типа String можно рассматривать и как массивы символов.
 */

func findNumbers(from min: Int, to max: Int, whereCountOfSeven n: Int) -> Any {
  
  // Handling errors
  if min > max {
    return "Ошибка: min > max."
  }
  if n < 0 {
    return "Ошибка: n < 0."
  }
  if n == 0 {
    return "Требуемых чисел нет."
  }
  
  var necessaryNumbers: [Int] = []
  
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
  
  if necessaryNumbers.isEmpty {
    return "Требуемых чисел нет."
  }
  
  return necessaryNumbers
}

/*
 * Задание 2
 * Написать функцию, принимающую натуральное трехзначное число.
 * Вычислить и вывести на экран число, полученное путем "переворота" (123 => 321).
 * Не использовать методы для работы со строками.
 */

func reverseNumber(number: Int) -> Any {
  
  // Handling errors
  if number < 100 || number > 999 {
    return "Error: number < 100 or number > 999."
  }
  
  // Parsing
  let firstDigit:    Int = number / 100
  let secondDigit:   Int = number / 10 % 10
  let thirdDigit:    Int = number % 10
  
  let reverseNumber: Int = thirdDigit * 100 + secondDigit * 10 + firstDigit
  
  return reverseNumber
}

/*
 * Задание 3
 * Написать функцию, которая принимает четырехзначное десятичное число,
 * формирует и выводит на экран признак "счастливого числа" (сумма первых двух цифр равне сумме последних двух).
 * Не использовать методы для работы со строками.
 */

func isLuckyNumber(_ number: Int) -> Any {
  
  // Handling Errors
  if number < 1000 || number > 9999 {
    return "Error: number < 1000 or number > 9999"
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

/*
 * Задание 4
 * Реализовать метод вычисления факториала.
 */

func factorial(_ n: Int) -> Int {
  return n == 0 ? 0 : factorial(n) * factorial(n - 1)
}

/*
 * Задание 8
 * Написать функцию, которая находит и распечатывает все натуральные трёхзначные числа,
 * равные сумме кубов своих цифр.
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

/*
 * Задание 9
 * Написать функцию, принимающую натуральные числа n и k.
 * Задача функции: определить k-ю справа цифру числа n.
 */

func findDigit(onPosition k: Int, ofNumber n: Int) -> Int {
  var digits: [String] = []
  let index:  Int      = k - 1
  
  for digit in String(n).characters {
    digits.append(String(digit))
  }
  
  return Int(digits[index])!
}

/*
 * Задание 10
 * Написать функцию, вычисляющее число Фибоначчи.
 */

func fibonacci(_ k: Int) -> (Int) {
  if k <= 1 {
    return k
  } else {
    return fibonacci(k - 1) + fibonacci(k - 2)
  }
}

/*
 * Задание 11
 * Написать функцию, принимающую натуральное число N.
 * Одномерный массив размером N заполнить случайными числами.
 * Вывести на экран количество простых чисел в массиве
 * (Для удобства проверки дополнительно вывести сгенерированный массив).
 * Для генерации простого числа можно использовать глобальную функцию arc4random().
 * Следует обратить внимание, что функция возвращает значение типа UInt32 (потребуется преобразование),
 * а также работает на всем диапазоне (можно применить arc4random() % 100 для получения чисел в промежутке [0, 100) )
 */

func createRandomArray(withLength length: Int) -> ([Int], [Int])? {
  if length < 1 {
    return nil
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

/*
 * Задание 12
 * Написать функцию, заполняющую случайными числами целочисленный массив длиной N.
 * Найти в нем два наименьших элемента (и вывести на экран)
 */

func createRandomArrayWithLength(_ length: Int, andPrint2MinimalElements show: Bool) -> ([Int], [Int])? {
  if length < 1 {
    return nil
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

createRandomArrayWithLength(10, andPrint2MinimalElements: true)

/*
 * Задание 13
 * Сгенерировать (и вывести) двумерную матрицу размером N*N (N<20).
 * Найти сумму ее элементов, находящихся на диагонали, и сумму элементов на диагонали, "ортогональной" главной.
*/

func createMatrixWithLength(_ length: Int) -> ([[Int]], Int, Int)? {
  if length >= 20 {
    return nil
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

/*
 * Задание 14
 * Сформировать целочисленный массив A(75),
 * элементами которого являются случайные числа из диапазона [-5, 20].
 * Найти среди его элементов два, разность которых имеет наибольшее значение.
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

/*
 * Задание 15
 * Найти наибольший общий делитель (НОД) двух введенных натуральных чисел, используя алгоритм Евклида.
 * Алгоритм Евклида: вычитаем из большего числа меньшее до тех пор, пока они не сравняются;
 * полученное в результате число и есть НОД.
*/

// greatest common divisor
func gcv(_ a: Int, _ b: Int) -> Int? {
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































