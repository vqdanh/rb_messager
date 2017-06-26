$(function() {
	var conversations = $('#conversations-list>li');
	conversations.each(function(index){
		var conversation = $(conversations[index]);
		var messages_list = conversation.find('.messages-list');
		var height = messages_list[0].scrollHeight;
		messages_list.scrollTop(height);
	});

});

function conversationFocus(el){
	var conversationId = $(el).attr("data");
	$.ajax({
    url: "/conversations/"+conversationId+"/read",
    type: "POST",
    success: function(resp){ 
    	console.log(resp);
    }
	});
};