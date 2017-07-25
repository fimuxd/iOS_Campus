/*:
 # 알고리즘 연습 - Sorting
 
 1. Quick Sort
 2. Merge Sort
 3. 성능 비교
 
 ## Quick Sort
 
 1. 아이템 개수가 1개이면 그냥 반환, 2개이면 그냥 단순한 방식으로 정렬해서 반환합니다.
 2. 3개 이상인 경우, 피벗 아이템을 정합니다.
 3. 피벗보다 큰가 작은가의 기준에 따라 두 어레이에 나누어 담습니다.
 4. 큰 어레이, 작은 어레이를 각각 재귀적으로 정렬합니다.
 5. 정렬된 작은 어레이 + 피벗 + 정렬된 큰 어레이를 반환합니다.
 */

import UIKit

var str = "Hello, playground"

func quickSort<T:Comparable>(array:[T]) -> [T] {
    switch array.count {
    case 0, 1:
        return array
    case 2:
        return array.sorted()
    default:
        var pivotIndex:T = array.remove(at: 0)
        let biggerIndexes:[T] = array.filter({ (index) -> Bool in
            index > array[0]
        })
        
        let smallerIndexed:[T] = array.filter({ (index) -> Bool in
            index < array[0]
        })
        
        
        
    }
}

var originalArray:[Int] = [2,3,8,3,5,4,7,4,2,7,1,9,10,22,12,3,57,8,4]

print(quickSort(array: originalArray))

/*:
 ## Merge Sort
 
 1. 아이템 개수가 
 
 
 */
