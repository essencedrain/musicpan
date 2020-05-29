var replyService = (function(){

    function add(reply, b_name, callback, error){
        //console.log("add reply............");

        $.ajax({
            type: "post",
            url: "/replies/"+b_name+"/new",
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function (result, status, xhr) {
                if(callback){
                    callback(result);
                }
            },
            error: function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        });
    }//add

    function getList(param, callback, error){
        var bno = param.bno;
        var page = param.page || 1;
        var b_name = param.b_name;
        //console.log("reply.js : "+bno+"//"+page+"//"+b_name);
        $.getJSON("/replies/pages/"+b_name+"/"+bno+"/"+page+".json",
            function (data) {
                if(callback){
                    //callback(data);
                    callback(data.replyCnt, data.list);
                }
            }).fail(function(xhr,status,err) {
               if(error){
                   error();
               } 
            });

    }//getList


    function remove(rno,b_name,callback,error) {
        $.ajax({
            type: "delete",
            url: "/replies/"+b_name+"/"+rno,
            success: function (deleteResult, status, xhr) {
                if(callback){
                    callback(deleteResult);
                }
            },
            error:function(xhr, status, er) {
                if(error){
                    error(er);
                }
            }
        });
    }//remove


    function update(reply, b_name, callback, error) {
        //console.log("rno:" + reply.rno);

        $.ajax({
            type: "put",
            url: "/replies/"+b_name+"/"+reply.rno,
            data: JSON.stringify(reply),
            contentType:"application/json; charset=utf-8",
            success: function (result, status, xhr) {
               if(callback){
                   callback(result);
               } 
            },
            error:function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        });
    }//update


    function get(rno, b_name, callback, error) {
        $.get("/replies/"+b_name+"/"+rno+".json"
            ,function (result){
                if(callback){
                    callback(result);
                }    
            }).fail(function(xhr, status, err){
                if(error){
                    error();
                }
            });
    }//get

    function displayTime(timeValue) {
        var today = new Date();
        var gap = today.getTime() - timeValue;

        var dateObj = new Date(timeValue);
        

        
        
        if(gap < (1000*60*60*24)){
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

            if(gap < (1000*60)){
                return Math.floor(gap/1000) +" 초 전";
            }else if(gap < (1000*60*60)){
                return Math.floor(gap/60000) +" 분 전";
            }else{
                return Math.floor(gap/3600000) +" 시간 전";
            }
            
        }else{
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth() + 1;
            var dd = dateObj.getDate();

            if(gap < (1000*60*60*24*30)){
                return Math.floor(gap/86400000) + " 일 전";
            }

            return yy+'.'+ ((mm > 9 ? '':'0') + mm) + '.' + ((dd > 9 ? '':'0') + dd);
        }
    }//displayTime

    function addRe(reply, b_name, callback, error){
        //console.log("add Re_reply............");
        console.log("reply.js addRe : "+reply+"//"+b_name);
        $.ajax({
            type: "post",
            url: "/replies/"+b_name+"/re",
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function (result, status, xhr) {
                if(callback){
                    callback(result);
                }
            },
            error: function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        });
    }//addRe


    return {
        add:add
        ,getList:getList
        ,remove:remove
        ,update:update
        ,get:get
        ,displayTime:displayTime
        ,addRe:addRe
    };
})();