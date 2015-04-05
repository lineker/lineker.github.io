---
title: List Flattening and Unflattening
author: Lineker Tomazeli
layout: post
permalink: list-flattening-and-unflattening
categories:
  - CS101
---
FLATTENING LIST PROBLEM: Start with a standard doubly linked list. Now imagine that in addition  
to the next and previous pointers, each element has a child pointer, which  
may or may not point to a separate doubly linked list. These child lists may have  
one or more children of their own, and so on, to produce a multilevel data structure,  
as shown in the figure below:

<img class="aligncenter" src="http://i.stack.imgur.com/ehIIU.png" alt="" width="737" height="592" />

Flatten the list so that all the nodes appear in a single-level, doubly linked list. You  
are given the head and tail of the first level of the list. Each node is a C struct  
with the following definition:

<pre class="brush: cpp; title: ; notranslate" title="">typedef struct Node {
   struct Node *next;
   struct Node *prev;
   struct Node *child;
   int value;
} Node;</pre>

SOLUTION:

<pre class="brush: cpp; title: ; notranslate" title="">bool listFlattening(Node *head, Node **tail) {
  if(head == NULL) return true;
  Node *temp = head;
  while(temp != NULL) {
    if(temp-&gt;child != NULL) {
      (*tail)-&gt;next = temp.child;
      temp-&gt;child-&gt;prev = tail;
      *tail = temp-&gt;child;
      while((*tail)-&gt;next != NULL) *tail = (*tail)-&gt;next;
    }
    temp = temp-&gt;next;
  }
}
</pre>

*I haven&#8217;t run this solution to make sure it works. But the idea should be good.

UNFLATTENING PROBLEM: Unflatten the list created by the previous problem and restore the  
data structure to its original condition.

SOLUTION:

<pre class="brush: cpp; title: ; notranslate" title="">void listUnflatten(Node *head, Node **tail) {
  Node *temp = head;
  while(temp != NULL) {
    if(temp-&gt;child &amp;&amp; temp-&gt;child-&gt;prev != NULL) {
       Node *child = temp-&gt;child;
       child-&gt;prev-&gt;next = NULL;
       child-&gt;prev = NULL;
       listUnflatten(child, tail);
    }
    temp = temp.next;
    //TODO: update tail here.
}
</pre>
