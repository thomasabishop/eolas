---
categories:
  - Programming Languages
tags:
  - backend
  - node-js
  - async
---

# The Event Loop

Node.js provides a single-threaded asynchronous architecture which is achieved via means of the Event Loop.

## Multi-threaded synchronous architectures

In the context of backend, a thread as an instance of a request-response transaction.

For example a request is made from the client for a resource contained in a database. The back-end language is an intermediary between the client machine and the server. It receives the request and returns the resource as a response.

Many backend frameworks are synchronous but multithreaded. This means that a thread can only process one request-response cycle at a time. The thread cannot initiate a new cycle until it has finished with its current cycle.

If there was only one thread, this would be inefficient and unworkable. Therefore the framework will be multi-threaded: multiple request-response cycles can be executed at once by different threads.

![sync-thread.svg](/img/sync-thread.svg)

To accomodate the ability to increase the scale of synchronous applications you need to be able to spawn more threads commensurate to increased demand. This increases the resource consumption of the framework (more cores, more memory etc). Moreover it is possible to reach a point where all threads are active and no more can be spawned. In this case there will simply be delays in the return of data.

## Node as a single-threaded asynchronous architecture

In contrast, Node only has a single thread but it works asynchronously, not synchronously. Thus it has a **single-threaded asynchronous architecture**. This means whilst there is only a single thread it can juggle responses by dispatching them asynchronously. When a request is made it sends it off and continues with its execution and handling new requests. Once these resolve, the data is returned to the main thread.

![async.svg](/img/async.svg)

## The Event Loop

Node implements its single-threaded asynchronous architecture through the Event Loop.

This is the mechanism by which Node keeps track of incoming requests and their fulfillment status: whether the data has been returned successfully or if there has been error.

Node is continually monitoring the Event Loop in the background.

A running Node application is a single running process. Like everything that happens within the OS, a process is managed by the [kernel](/Operating_Systems/The_Kernel.md) that dispatches operations to the CPU in a clock cycle. A thread is a sequence of code that resides within the process and utilises its memory pool (the amount of memory assigned by the kernel to the Node process). The Event Loop runs on CPU ticks: a tick is a single run of the Event Loop.

### Phases of the Event Loop

The Event Loop comprises six phases. The Event Loop starts at the moment Node begins to execute your `index.js` file or any other application entry point. These six phases create one cycle, or loop, equal to one **tick**. A Node.js process exits when there is no more pending work in the Event Loop, or when `process.exit()` is called manually. A program only runs for as long as there are tasks queued in the Event Loop, or present on the [call stack](/Software_Engineering/Call_stack.md).

![](/img/node-event-loop.svg)

The phases are as follows:

1. **Timers**
   - These are functions that execute callbacks after a set period of time. As in standard JavaScript there are two global timer functions: `setTimeout` and `setInterval`. Interestingly these are not core parts of the JavaScript language, they are something that are made available to JS by the particular browser. As Node does not run in the browser, Node has to provide this functionality. It does so through the core `timers` module.
   - At the beginning of this phase the Event Loop updates its own time. Then it checks a queue, or pool, of timers. This queue consists of all timers that are currently set. The Event Loop takes the timer with the shortest wait time and compares it with the Event Loop's current time. If the wait time has elapsed, then the timer's callback is queued to be called once the [call stack](/Software_Engineering/Call_stack.md) is empty.
2. **I/O Callbacks**
   - Once timers have been checked and scheduled, Node jumps to I/O operations.
   - Node implements a non-blocking input/output interface. This is to say, writing and reading to disk (files in the Node application directory) is implemented asynchronously. The asynchronous I/O request is recorded into the queue and then the call stack continues.
3. **Idle / waiting / preparation**
   - This phase is internal to Node and is not accessible to the programmer.
   - It is primarily used for gathering informtion, and planning what needs to be executed during the next tick of the Event Loop
4. **I/O polling**
   - This is the phase at which the main block of code is read and executed by Node.
   - During this phase the Event Loop is managing the I/O workload, calling the functions in the queue until the queue is empty, and calculating how long it should wait until moving to the next phase. All callbacks in this phase are called synchronously (although they return asynchronously) in the order that they were added to the queue, from oldest to newest.
   - This is the phase that can potentially block our application if any of these callbacks are slow or do not return asynchronously.
5. **`setImmediate` callbacks**
   - This phase runs as soon as the poll phase becomes idle. If `setImmediate()` is scheduled within the I/O cycle it will always be executed before other timers regardless of how many timers are present.
   - This is your opportunity to grant precedence to certain threads within the Node process
6. **Close events**
   - This phase occurs when the Event Loop is wrapping up one cycle and is ready to move to the next one.
   - It is an opportunity for clean-up and to guard against memory leaks.
   - This phase can be targetted via the `process.exit()` function or the close event of a web-socket.

## Event _loop_ and event _queue_

The terms _event loop_ and _event queue_ are often used interchangeably in the literature but in fact they are distinct.

The Event Loop is the Node runtime's method of execution, the queue is the stack of tasks that are lined up and executed by the loop. We can think of the queue as being the input and the loop as what acts on the input. The queue obviously emerges from the program we write but it is scheduled, organised and sequenced by the loop.

https://blog.appsignal.com/2022/07/20/an-introduction-to-multithreading-in-nodejs.html
https://school.geekwall.in/p/Bk2xFs1DV
