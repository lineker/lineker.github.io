---
title: 'Jquery ajax calls &#8211; Quick Reference'
author: Lineker Tomazeli
layout: post
permalink: jquery-ajax

---
This post is specifically created for my reference.  
These are the main methods that I have been using to make ajax calls to the server using jquery.

Populating Dropdown list with json:

<pre class="prettyprint linenums">$.getJSON('/Dashboard/GetAthletesByTeamID/' + $("#TeamId &gt; option:selected").attr("value"),Â 
             function (data) {Â 
             //Clear the Model list
             $('#ddlAthlete').empty();
             $("#ddlAthlete").append("Select");
             //Foreach Model in the list, add a model option from the data returned
             $.each(data, function (index, optionData) {
               $("#ddlAthlete").append("" + optionData.Value + "");
             });
 });</pre>

Dump return html into specific div:

<pre class="prettyprint linenums">$.ajax({Â 
    url: "/Dashboard/GetAthletesTreeByAthleteId/" + $("#AthleteId &gt; option:selected").attr("value"),
    type: 'GET', dataType: 'html',
    success: function doSubmitSuccess(result) {
      $('div#athletesTree').html(result);
    }
});</pre>

Posting Information and getting json back

<pre class="prettyprint linenums">$.ajaxSetup({
   cache: false });
   var selectedItem = $(this).val();
   $.post("/Account/GetStates",Â 
        { id: selectedItem,
          extra: data },
          function (data) {
            if (data.length &gt; 0) {
               //do your stuff
            }
          },
       "json");
   });</pre>
