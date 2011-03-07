// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function() {
    $("#edit_link").click(function(e){
        $.ajax({
           url: "account/edit.js",
           success: function(result) {
               $('#info').replaceWith(result);
           }
        });
        e.preventDefault();
    });

    $("tr:odd").addClass("odd");

    $(".actions_box").hide();

    $(".actionable").mouseover(function() {
        $(this).addClass("highlight");
        $(this).find(".actions_box").show();
    }).mouseout(function() {
        $(this).removeClass("highlight");
        $(this).find(".actions_box").hide();
    });
});