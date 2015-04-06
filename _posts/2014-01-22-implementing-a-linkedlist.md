---
title: Implementing a LinkedList
author: Lineker Tomazeli
layout: post
permalink: implementing-a-linkedlist
comments: true
categories:
  - CS101
tags:
  - computer science
  - linkedlist
---
I finally decided to review all my CS101 skills and there is nothing better than starting with a linked list data structure.  
I don&#8217;t want to over complicate things. I linked list is simply a chain of nodes. Each node has a space for data and a reference to the next node in the chain. The last node usually points to NULL.  
There are 3 different types of linked list:

  1. Single Linked List: Each node points to the next node.
  2. Double Linked List: Each node points to the next node and the previous node.
  3. Circular Linked List: Each node points to the next node but the last node points to the first node.<figure style="width: 384px;" class="wp-caption alignnone">

<img class=" " alt="Single Linked list where the data are integers." src="http://upload.wikimedia.org/wikipedia/commons/b/bf/Linked_list_data_format.jpg" width="384" height="288" /><figcaption class="wp-caption-text">Single Linked list where the data are integers.</figcaption></figure>

This data structure has a few standard methods that we have learn. These methods are provided so we can manipulate the data. Below you can study my own implementation of a linkedlist using <a title="Generics" href="http://docs.oracle.com/javase/tutorial/java/generics/" target="_blank">Generics</a>.

First we declare the Node Class + setters and getters:

{% highlight java %}
public class Node {
  private T data = null;
  private Node next = null;

  public Node(T tData) {
    this.data = tData;
  }

  public Node(T tData, Node tNext){
    this.data = tData;
    this.next = tNext;
  }
}
{% endhighlight %}

And here is the Linked List Implementation simplified, you can get the full code in the links below.:

{% highlight java %}
public class LinkedList implements Iterable {

  protected Node head = null;
  protected Node tail = null;
  public int length = 0;

  public void add(T tData) {
    if(tData != null) {
      if(head == null && tail == null) {
        tail = head = new Node(tData);
      } else {
        Node temp = tail;
        tail = new Node(tData);
        temp.setNext(tail);
      }
      this.length++;
    }
  }
  public T remove(T tData) {
    Node current = head;
    Node before = null;
    while(current != null) {
      if(current.getData() == tData) {
        if(current == head) {
          head = current.getNext();
          break;
        } else if(current == tail) {
          tail = before;
          before.setNext(null);
          break;
        } else if(current.getData() == tData) {
          before.setNext(current.getNext());
          break;
        }
      }
      before = current;
      current = current.getNext();
    }
    if(current != null) {
      this.length--;
      return current.getData();
    }
    return null;
  }
  public T get(int i){
    if(i == 0 && head != null) {
      return head.getData();
    } else if(i == this.length-1 && tail != null){
      return tail.getData();
    } else if(i &lt;= this.length-1 && i &gt;= 0) {
      Node temp = head;
      int index = 0;
      while(temp != null) {
        if(i == index) {
          return temp.getData();
        }
        temp = temp.getNext();
        index++;
      }
    }
    return null;
  }
}
{endhighlight}

&nbsp;  
Full code: <a href="https://github.com/lineker/BackToBasics" title="https://github.com/lineker/BackToBasics" target="_blank">https://github.com/lineker/BackToBasics</a>
