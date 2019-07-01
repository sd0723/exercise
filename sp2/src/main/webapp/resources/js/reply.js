var replyService = (function(){

    const host = "http://localhost:8080/replies/"

    function countUp() {
        return ++idx;
    }
    function addReply(obj,callback) {
        $.ajax({
            type: "post",
            url: host + "new",
            data: JSON.stringify(obj),
            contentType: "application/json;charset=UTF-8",
            success: function () {
                if (callback) {
                    callback();
                }
            }
        })
    }
        function getList(bno,callback) {
            $.getJSON(host+bno+"/1.json",
                        null,
                        function(arr) {
                            if (callback) {
                                callback(arr)
                            }
            })
        }
        
        function getReply(rno,callback) {
            $.getJSON(host+"/"+rno+".json",
                        null,
                        function(arr) {
                            if (callback) {
                                callback(arr)
                            }
            })
        }
    return {
    	getReply:getReply,
        getList:getList,
        countUp:countUp,
        addReply:addReply
    }

})();