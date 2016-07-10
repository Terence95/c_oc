//
//  ViewController.m
//  GCDdemo
//
//  Created by Terence on 16/7/5.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



// 任务:做什么事情
// 任务是一个block,把任务放到block里面去

// 队列:把任务放到队列里,通过队列来管理任务执行,队列先进先出原则,把任务一个个取出放到对应线程执行

// 队列的类型:串行队列按照顺序一个个执行,并行同时执行很多个任务





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self gcdTest4];
}

#pragma GCD演练



/**
 *  并发队列:可以执行多个任务
 *  同步任务:不会开启新县城,只在当前线程执行
 *  结果:不开辟新线程,只是顺序执行
 */

-(void)gcdTest4{

//    并行队列
    dispatch_queue_t queue = dispatch_queue_create("11",DISPATCH_QUEUE_CONCURRENT);

//    同步执行
    for (int i = 0; i < 10; ++i) {
        dispatch_sync(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread],i);
        });
    }
}

/**
 * 并行队列:让多个任务同时进行,会开启多个线程让任务执行
 * 异步执行:肯定会开新县城,在新线程执行
 * 结果:会开很多线程,同时执行
 */

-(void)gcdTest3{
    // 1.创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("CZ", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; ++i) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread],i);
        });
    }

}






/**
 *  串行队列的异步执行
 *  肯定会开辟新线程,在新线程中执行
 *
 *  但是开多少个呢? 看队列,串行队列异步执行只会新开辟一个线程,而且所有任务都在新开辟的线程中执行
 *  DISPATCH_QUEUE_SERIAL 这个宏就是 NULL, 只要队列创建时传入的第二个参数是null的,就是串行队列
 *
 */
-(void)gcdTest2{
    //1\ 创建一个串行队列
    dispatch_queue_t  queue = dispatch_queue_create("itast", DISPATCH_QUEUE_SERIAL);
    
    // 异步执行
    for (int i = 0; i < 10; ++i) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread],i);
        });
    }
    
}


/**
 * 串行队列
 */

-(void)gcdTest1{
    /**
     * 1\ 创建一个串行队列
     * 参数1 是一个队列标签,参数2 是一个队列属性
     * 基于c的
     */

    dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_SERIAL);

    // 2. 把任务放到队列里去进行,同步执行
    // 一般只要使用"同步"执行,串行队列会添加的一个同步任务会立马执行
    dispatch_sync(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });

    // 串行队列同步执行,跟原本也差不多,同步任务不会开辟新线程

    // 异步就是多线程的代名词,有异步操作就会开辟新线程,是在当前线程执行

    NSLog(@"done");
}

@end
