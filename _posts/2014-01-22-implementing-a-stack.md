---
title: Implementing a Stack
author: Lineker Tomazeli
layout: post
permalink: implementing-a-stack
comments: true
categories:
  - CS101
tags:
  - datastructures
  - linkedlist
  - stack
---
Following the series about CS101 datastructures lets understand and implement a stack.  
A Stack is a list on which items are added and remove in FIFO order (First In First Out). &nbsp;Lets see a picture to better understand a Stack.

<img class="aligncenter" src="https://www.cs.auckland.ac.nz/software/AlgAnim/fig/stack.gif" alt="" width="226" height="241" />

The most basic stack interface declares the following method:

  * Pop : Remove item from top of the stack and return.
  * Push : Add item to the top of the stack.

Here is my implementation of a stack which extends [my linked list implementation][1]

<pre class="brush: java; title: ; notranslate" title="">public class Stack&lt;T&gt; extends LinkedList&lt;T&gt;{

	/**
	 * returns the top object in the stack
	 * @return T
	 */
	public T peek() {
		return this.head.getData();
	}

	/**
	 * removes the top object from the stack
	 * @return T : the object removed
	 */
	public T pop() {
		return this.remove(this.getFirst());
	}

	/**
	 * add object to the top of the stack
	 * @param tData
	 */
	public void push(T tData) {
		this.addToFront(tData);
	}
}
</pre>

Full Code: <a title="https://github.com/lineker/BackToBasics" href="https://github.com/lineker/BackToBasics" target="_blank">https://github.com/lineker/BackToBasics</a>

 [1]: http://tomazeli.net/implementing-a-linkedlist/ "Implementing a LinkedList"
