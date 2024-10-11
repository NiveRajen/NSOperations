import UIKit

var greeting = "Hello, playground"



//First method
// Create a queue
let queue = OperationQueue()

// Create operations
let operation = BlockOperation {
    for i in 0..<10 {
        print(i)
    }
}

queue.addOperation{
    for j in 11..<20 {
        print(j)
    }
}
queue.addOperation(operation)



//Another method
let operation2 = BlockOperation()
operation2.addExecutionBlock {
    for i in 0..<10 {
        print(i)
    }
}
operation2.addExecutionBlock {
    for j in 11..<20 {
        print(j)
    }
}

operation2.start()

print(Thread.isMainThread) // this will return true, means it runs synchronously


//set maximumConcurrentOperation count
let operation3 = BlockOperation()
let queue1 = OperationQueue()
queue1.maxConcurrentOperationCount = 2

operation3.addExecutionBlock {
    for i in 0..<10 {
        print(i)
    }
}
operation3.addExecutionBlock {
    for j in 11..<20 {
        print(j)
    }
}

queue1.addOperation(operation3)
print("end", queue1.maxConcurrentOperationCount)


//Adding dependencies and wait until finished property
//In some situation you need to run concurrently and when all the tasks finished we need to call some method to indicate that all tasks has finished. this can be achieve by using waitUntilFinished
let queue2 = OperationQueue()
queue2.maxConcurrentOperationCount = 2

let operation4 = BlockOperation {
    for i in 0..<10 {
        print(i)
    }
}
let operation5 = BlockOperation {
    for j in 11..<20 {
        print(j)
    }
}

//Adding dependency means that operation 4 has to finish before operation 5
operation5.addDependency(operation4)
queue2.addOperations([operation4, operation5], waitUntilFinished: true)
print("end")



class SyncOperation: Operation {
  override func main() {
      for j in 11..<20 {
          print(j)
      }
  }
}
let operation6 = SyncOperation()
operation6.start()
print("Done")
// Outputs "Executing" then "Done"


//no guarantee that its task has completed before we reach the next line of code
class AsyncOperation: Operation {
  override func main() {
    DispatchQueue.global().async {
        for i in 0..<10 {
            print(i)
        }
    }
  }
}
let operation7 = AsyncOperation()
operation7.start()
print("Done")
