$(function(){
    $.material.init();
    $('#side-menu').metisMenu();
    
    
});
/*    var id;
$(".jobs-requires").click(function(){
	var _this = $(this);
	var title = _this.find(".job-title").html();
	var salary = _this.find(".job-salary").html();
	var address = _this.find(".job-address").html();
	var intro = _this.find(".job-intro").html();
	id = _this.data("id");
	
	var myModal = $('#myModal');
	myModal.find(".modal-title").html(title);
	myModal.find(".job-salary").html(salary);
	myModal.find(".job-address").html(address);
	myModal.find(".job-intro").html(intro);
	//查询用户是否已经提交过
	$.post("isApply",{id:id}, function(data){
		if(data.errors >0){
			$("#aplly-job").addClass("hidden");
			if(data.errors == 2)
				$("#aplly-job1").removeClass("hidden");
		} else{
			$("#aplly-job").removeClass("hidden");
			$("#aplly-job1").addClass("hidden");
		}
	}, "json");
	
	myModal.modal();
});*/