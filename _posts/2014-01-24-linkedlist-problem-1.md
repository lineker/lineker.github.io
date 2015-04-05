---
title: LinkedList Problem 1
author: Lineker Tomazeli
layout: post
permalink: linkedlist-problem-1
categories:
  - CS101
---
**PROBLEM:** head and tail are global references to the first and last element, respectively,&nbsp;of a singly linked list of integers. Implement &nbsp;functions for the following&nbsp;prototypes:

<pre class="brush: java; title: ; notranslate" title="">public T insertAfter(T tData, T nData)</pre>

The two arguments to&nbsp;insertAfter give the element after which the new element is to be inserted and&nbsp;the data for the new element. It should be possible to insert at the beginning of the&nbsp;list by calling insertAfter with NULL as the element argument. These function&nbsp;should return NULL is the operation could not be completed successfully.  
Your functions must keep the head and tail pointers updated.

The following answer is based on the [previous implemented LinkedList][1]  
**ANSWER:**

<pre class="brush: java; title: ; notranslate" title="">public void addToFront(T tData) {
	if(head == null && tail == null) {
		tail = head = new Node(tData);
	} else {
		Node temp = head;
		head = new Node(tData,temp);
	}
	this.length++;
}

public T insertAfter(T tData, T nData) {
	if(tData == null) {
		this.addToFront(nData);
		return nData;
	}
	else {
		Node current = head;
		while(current != null) {
			if(current.getData() == tData) {
				Node newN = new Node(nData);
				newN.setNext(current.getNext());
				current.setNext(newN);
				return newN.getData();
				if(current == tail) tail = newN;
			}
			current = current.getNext();
		}
	}
	return null;
}
</pre>

Full source: <a title="https://github.com/lineker/BackToBasics" href="https://github.com/lineker/BackToBasics" target="_blank">https://github.com/lineker/BackToBasics</a>

 [1]: http://blog.tomazeli.net/2014/01/implementing-a-linkedlist/ "Implementing a LinkedList"
