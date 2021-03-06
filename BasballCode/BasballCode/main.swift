//
//  main.swift
//  BasballCode
//
//  Created by juntaek.oh on 2021/09/23.
//

import Foundation

struct ReadData{
    let aiNum: [Int] = takeNums()
    
    static func takeNums() -> [Int]{
        var numbers = [Int]()
        
        while numbers.count < 3{
            let num = Int.random(in: 1...9)
            
            if numbers.count == 0{
                numbers.append(num)
            } else if numbers.contains(num){
                continue
            } else{
                numbers.append(num)
            }
        }
        
        return numbers
    }
}

func playing(){
    let aiNums = ReadData().aiNum
    
    print(aiNums)
    
    var myNums = [Int]()
    
    while aiNums != myNums{
        print("숫자를 입력해주세요 :")
        
        let read = Array(readLine()!).map{ Int(String($0))! }
        
        rule(aiNums, read)
        
        if aiNums == read{
            print("3개의 숫자를 모두 맞히셨습니다! 게임 종료")
        }
        
        myNums = read
    }
}

func rule(_ yours: [Int], _ my: [Int]){
    var strike: Int = 0
    var ball: Int = 0
    
    for i in 0...2{
        if yours[i] == my[i]{
            strike += 1
        } else if my.contains(yours[i]){
            ball += 1
        }
    }
    
    if strike == 0 && ball == 0{
        print("낫싱")
    } else if strike > 0 && ball == 0{
        print("\(strike) 스트라이크")
    } else if strike == 0 && ball > 0{
        print("\(ball) 볼")
    } else{
        print("\(strike) 스트라이크, \(ball) 볼")
    }
}

playing()


