# NSOperations

NSOperation
Operations can render assistance in concurrency. Operation is an object-oriented method of job encapsulation, that is to be done asynchronously. Operations are supposed to be used in conjunction with an operation queue or independently.

Developers can build custom subclasses of NSOperation, however, this is not always necessary. Foundation provides the concrete implementations NSBlockOperation and NSInvocationOperation.

NSOperation provides some benefits that GCD does not, such as a more user-friendly interface for dependencies, the Observable property as well as the ability to pause, cancel and resume operations and to specify the number of tasks that can be executed concurrently.

When Apple introduced GCD, NSOperation was refactored to work on top of GCD. The NSOperation API is a high-level abstraction of GCD, meaning that if you are using NSOperation, you are using GCD below the surface.

Before an instance of NSOperation can be used, it needs to be allocated and then deallocated when it is not needed anymore. This process is optimized but slower than GCD.

NSOperation is an abstract class that offers a thread-safe structure for modeling state, priority, dependencies, and management. It is part of the Foundation framework and can be used to encapsulate work that should be performed as part of an iOS application’s logic.


NSOperationQueue
NSOperation is designed to be used in conjunction with NSOperationQueue, a class that manages a queue of NSOperation objects. When adding an NSOperation to an NSOperationQueue, the queue takes care of starting the operation once it is ready and keeping track of its progress.

NSOperationQueue manages the concurrent execution of tasks. It functions as a priority queue that roughly follows the FIFO (first in, first out) algorithm, but also considers the priority of a task if it is 


NSBlockOperation manages the concurrent execution of one or more blocks of code. It can execute several blocks at once without needing to create separate operations for each of them. When more than one block is executed, the operation is considered finished once the execution of all blocks has been completed.

NSInvocationOperation manages the execution of a single, non-concurrent encapsulated task. It is used to initiate an operation that invokes a selector on a specified object.
In many cases, utilizing one of these predefined implementations will suffice

waitUntilFinished
maxConcurrentOperationCount

KVO-Compliant Properties
The NSOperation class is key-value coding (KVC) and key-value observing (KVO) compliant for several of its properties. As needed, you can observe these properties to control other parts of your application. To observe the properties, use the following key paths

* isCancelled - read-only 
* isAsynchronous - read-only 
* isExecuting - read-only 
* isFinished - read-only
* isReady - read-only 
* dependencies - read-only 
* queuePriority - readable and writable 
* completionBlock - readable and writable


Pros of NSOperationQueue:
* Simplified concurrency management.
* Easy dependency management.
* Control over execution and concurrency level.
* Canceling and pausing operations.
* Built-in completion handling mechanisms.

Cons of NSOperationQueue:
* Learning curve associated with understanding its concepts.
* Additional complexity for managing dependencies and synchronization.
* Lack of fine-grained control compared to lower-level APIs.
* Objective-C legacy API, not fully embracing modern Swift concurrency features.
