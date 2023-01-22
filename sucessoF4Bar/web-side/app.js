$(document).ready(function(){
	window.addEventListener("message",function(event){

        var data = event.data


        $("#din").html(data.din)
        $("#banco").html(data.banco)
        $("#vip").html(data.vip)
        $("#level").html(data.level)

    })
})