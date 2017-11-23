/*:
 # 알고리즘 연습 - Sorting
 ----
 1. Quick Sort
 1. Merge Sort
 1. 성능 비교

 ## Quick Sort
 1. 아이템 개수가 1개이면 그냥 반환, 2개이면 그냥 단순한 방식으로 정렬해서 반환합니다.
 1. 3개 이상인 경우, 피벗 아이템을 정합니다.
 1. 피벗보다 큰가 작은가의 기준에 따라 두 어레이에 나누어 담습니다.
 1. 큰 어레이, 작은 어레이를 각각 재귀적으로 정렬합니다.
 1. 정렬된 작은 어레이 + 피벗 + 정렬된 큰 어레이를 반환합니다.
 */
import UIKit

func quickSort<T:Comparable>(array:[T]) -> [T] {
    switch array.count {
    case 0, 1:
        return array
    case 2:
        if array[0] > array[1] {
            return [array[1],array[0]]
        } else {
            return array
        }
    default:
        var sortingArray = array
        let pivot = sortingArray.remove(at: 0)
        
        var smallArray: [T] = []
        var bigArray: [T] = []
        
        for item in sortingArray {
            if item < pivot {
                smallArray.append(item)
            } else {
                bigArray.append(item)
            }
        }
        
        smallArray = quickSort(array: smallArray)
        bigArray = quickSort(array: bigArray)
        
        return smallArray + [pivot] + bigArray
    }
}



var originalArray: [Int] = [2,3,8,3,5,4,7,4,2,7,1,9,10,22,12,3,57,8,4]

print(quickSort(array: originalArray))


/*:
 ## Merge Sort
 1. 아이템 개수가 1개이면 그냥 반환, 2개이면 그냥 단순한 방식으로 정렬해서 반환합니다.
 1. 3개 이상이면 어레이를 반으로 자릅니다.
 1. 두 어레이를 각각 재귀적으로 정렬합니다.
 1. 각각의 결과값에서 0번 인덱스를 비교, 작은 것을 결과 어레이에 추가합니다. 이를 둘 중에 하나의 어레이가 완전히 빌 때까지 계속합니다.
 1. 남은 어레이를 결과 어레이 뒤에 붙이고, 결과 어레이를 반환합니다.
 */
func mergeSort<T:Comparable>(array:[T]) -> [T] {
    switch array.count {
    case 0, 1:
        return array
    case 2:
        if array[0] > array[1] {
            return [array[1],array[0]]
        } else {
            return array
        }
    default:
        var sortingArray = array
        let endOfArray1 = Int(sortingArray.count / 2)
        let startOfArray2 = endOfArray1 + 1
        
        var array1: [T] = Array(sortingArray[0...endOfArray1])
        var array2: [T] = Array(sortingArray[startOfArray2..<sortingArray.count])
        
        array1 = mergeSort(array: array1)
        array2 = mergeSort(array: array2)
        
        var resultArray:[T] = []
        
        while array1.count * array2.count > 0 {
            if array1[0] < array2[0] {
                resultArray.append(array1.removeFirst())
            } else {
                resultArray.append(array2.removeFirst())
            }
        }
        
        if array1.count > 0 {
            resultArray += array1
        } else {
            resultArray += array2
        }
        
        return resultArray
    }
}























/*:
 ## 성능비교
 - 각각의 정렬 방법의 시작 직전의 시간을 기록, 끝난 후의 시간과의 `TimeInterval`을 구합니다.
 */
var quickTime = 0.0
var mergeTime = 0.0
var sortedTime = 0.0
var delta = 0.0
var delta2 = 0.0
//
//설정값
let numberOfItems = 30
let numberOfArray = 100
let numberOfNumbs = 100
//
for _ in 1...numberOfArray {
    
    var sampleArray: [Int] = []
    
    
    for _ in 1...numberOfItems {
        sampleArray.append(Int(arc4random_uniform(UInt32(numberOfNumbs))))
    }
    
    var startTime = Date()
    print((quickSort(array: sampleArray).count == sampleArray.count))
    let quickTimeInterval = Date().timeIntervalSince(startTime)
    print("quick:", quickTimeInterval)

    quickTime += quickTimeInterval

    startTime = Date()
    print((mergeSort(array: sampleArray).count == sampleArray.count))
    let mergeTimeInterval = Date().timeIntervalSince(startTime)
    print("merge:", mergeTimeInterval)
    
    mergeTime += mergeTimeInterval

    startTime = Date()
    print((sampleArray.sorted().count == sampleArray.count))
    let sortTimeInterval = Date().timeIntervalSince(startTime)
    print("sort:", sortTimeInterval)
    
    sortedTime += sortTimeInterval
    delta += mergeTimeInterval - quickTimeInterval
    delta2 += quickTimeInterval - sortTimeInterval
}
//
//print("1부터 \(numberOfNumbs)까지의 임의의 숫자 \(numberOfItems)개짜리 어레이를 정렬하는 시간 : \n   머지는 평균 \(String.init(format: "%.5f", mergeTime / Double(numberOfArray)))초 걸리며, 퀵은 평균 \(String.init(format: "%.5f", quickTime/Double(numberOfArray)))초 걸립니다.")
////
print("1부터 \(numberOfNumbs)까지의 임의의 숫자 \(numberOfItems)개짜리 어레이를 정렬하는 시간 : \n   머지는 평균 \(String.init(format: "%.5f", mergeTime / Double(numberOfArray)))초 걸리며, 퀵은 평균 \(String.init(format: "%.5f", quickTime/Double(numberOfArray)))초, 기본적인 sorted는 평균 \(String.init(format: "%.5f", sortedTime/Double(numberOfArray)))초, 퀵이 머지보다 \(String.init(format: "%.2f", delta/Double(numberOfArray)))초 빠르고, 소티드 함수가 퀵보다 \(String.init(format: "%.5f", delta2/Double(numberOfArray)))초 빠르고, 머지보다는 \(String.init(format: "%.5f", (delta+delta2)/Double(numberOfArray)))초 빠릅니다.")
