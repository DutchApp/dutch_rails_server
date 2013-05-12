/**
 * Created with JetBrains RubyMine.
 * User: anujchaudhary
 * Date: 5/11/13
 * Time: 4:35 PM
 * To change this template use File | Settings | File Templates.
 */
$(function() {
    $("#search").keyup(function(){
        $.get($("#contributor_search").attr("action"), $(this).serialize(), null, "script");
        return false;
    });
});