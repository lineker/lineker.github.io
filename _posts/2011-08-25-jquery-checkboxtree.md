---
title: 'jQuery checkboxTree plugin &#8211; Single branch with multiple selected children'
author: Lineker Tomazeli
layout: post
permalink: jquery-checkboxtree
---
I few days ago I found myself having to build a tree of checkboxes, so the user could select items from it. Special case was that it could only have one root selected.

I found a very nice plugin &#8211; checkboxtree based on query

Unfortunetely it didnt have this specific option (single root selection)  
Here is my implementation to achieve the functionality of single root selection with multiple children selected.

To Initialize:

<pre class="prettyprint linenums"><code>
$('#tree8').checkboxTree({
   initializeUnchecked: 'collapsed',
   multipleChildren: 'true',
   onCheck: {
      ancestors: 'check',
      descendants: 'uncheck',
      others: 'uncheck'
   },
   onUncheck: {
      descendants: 'uncheck'
   }
});
</code>
</pre>

[CheckBoxtree Example][1]  
[jquery.checkboxtree-0.5.2.custom][2]  
[patch for version 0.5.2][3]

 [1]: http://tomazeli.net/wp-content/uploads/2011/08/CheckBoxtreeExample.zip
 [2]: http://tomazeli.net/wp-content/uploads/2011/08/jquery.checkboxtree-0.5.2.custom.js
 [3]: http://tomazeli.net/wp-content/uploads/2011/08/patch.zip
