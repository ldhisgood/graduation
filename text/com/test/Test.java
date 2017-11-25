package com.test;

import java.util.concurrent.atomic.AtomicInteger;

public class Test {
	public static volatile int a = 0;
	public AtomicInteger c = new AtomicInteger(5);
	public static ThreadLocal<Integer> b = new ThreadLocal<Integer>();
	public static void main(String[] args) throws InterruptedException {
		for (int i = 0; i < 10000; i++) {
			new Thread(new Runnable() {

				@Override
				public void run() {
					Test.a+=1;
				}
			}).start();
		}
		for (int i = 0; i < 10000; i++) {
			new Thread(new Runnable() {

				@Override
				public void run() {
					Test.a-=1;
				}
			}).start();
		}
		Thread.sleep(5000);
		System.out.println(Test.a);
	}
}
