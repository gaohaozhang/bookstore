/**
 * Created by an www.sucaijiayuan.com
 */
window.onload = function () {
    if (!document.getElementsByClassName) {
        document.getElementsByClassName = function (cls) {
            var ret = [];
            var els = document.getElementsByTagName('*');
            for (var i = 0, len = els.length; i < len; i++) {

                if (els[i].className.indexOf(cls + ' ') >=0 || els[i].className.indexOf(' ' + cls + ' ') >=0 || els[i].className.indexOf(' ' + cls) >=0) {
                    ret.push(els[i]);
                }
            }
            return ret;
        }
    }

    var table = document.getElementById('cartTable'); // 璐墿杞﹁〃鏍�
    var selectInputs = document.getElementsByClassName('check'); // 鎵�湁鍕鹃�妗�
    var checkAllInputs = document.getElementsByClassName('check-all') // 鍏ㄩ�妗�
    var tr = table.children[1].rows; //琛�
    var selectedTotal = document.getElementById('selectedTotal'); //宸查�鍟嗗搧鏁扮洰瀹瑰櫒
    var priceTotal = document.getElementById('priceTotal'); //鎬昏
    var deleteAll = document.getElementById('deleteAll'); // 鍒犻櫎鍏ㄩ儴鎸夐挳
    var selectedViewList = document.getElementById('selectedViewList'); //娴眰宸查�鍟嗗搧鍒楄〃瀹瑰櫒
    var selected = document.getElementById('selected'); //宸查�鍟嗗搧
    var foot = document.getElementById('foot');

    // 鏇存柊鎬绘暟鍜屾�浠锋牸锛屽凡閫夋诞灞�
    function getTotal() {
		var seleted = 0;
		var price = 0;
		var HTMLstr = '';
		for (var i = 0, len = tr.length; i < len; i++) {
			if (tr[i].getElementsByTagName('input')[0].checked) {
				tr[i].className = 'on';
				seleted += parseInt(tr[i].getElementsByTagName('input')[1].value);
				price += parseFloat(tr[i].cells[4].innerHTML);
				HTMLstr += '<div><img src="' + tr[i].getElementsByTagName('img')[0].src + '"><span class="del" index="' + i + '">鍙栨秷閫夋嫨</span></div>'
			}
			else {
				tr[i].className = '';
			}
		}	
		selectedTotal.innerHTML = seleted;
		priceTotal.innerHTML = price.toFixed(2);
		selectedViewList.innerHTML = HTMLstr;
	
		if (seleted == 0) {
			foot.className = 'foot';
		}
	}
    // 璁＄畻鍗曡浠锋牸
    function getSubtotal(tr) {
        var cells = tr.cells;
        var price = cells[2]; //鍗曚环
        var subtotal = cells[4]; //灏忚td
        var countInput = tr.getElementsByTagName('input')[1]; //鏁扮洰input
        var span = tr.getElementsByTagName('span')[1]; //-鍙�
        //鍐欏叆HTML
        subtotal.innerHTML = (parseInt(countInput.value) * parseFloat(price.innerHTML)).toFixed(2);
        //濡傛灉鏁扮洰鍙湁涓�釜锛屾妸-鍙峰幓鎺�
        if (countInput.value == 1) {
            span.innerHTML = '';
        }else{
            span.innerHTML = '-';
        }
    }

    // 鐐瑰嚮閫夋嫨妗�
    for(var i = 0; i < selectInputs.length; i++ ){
        selectInputs[i].onclick = function () {
            if (this.className.indexOf('check-all') >= 0) { //濡傛灉鏄叏閫夛紝鍒欏惂鎵�湁鐨勯�鎷╂閫変腑
                for (var j = 0; j < selectInputs.length; j++) {
                    selectInputs[j].checked = this.checked;
                }
            }
            if (!this.checked) { //鍙鏈変竴涓湭鍕鹃�锛屽垯鍙栨秷鍏ㄩ�妗嗙殑閫変腑鐘舵�
                for (var i = 0; i < checkAllInputs.length; i++) {
                    checkAllInputs[i].checked = false;
                }
            }
            getTotal();//閫夊畬鏇存柊鎬昏
        }
    }

    // 鏄剧ず宸查�鍟嗗搧寮瑰眰
    selected.onclick = function () {
        if (selectedTotal.innerHTML != 0) {
            foot.className = (foot.className == 'foot' ? 'foot show' : 'foot');
        }
    }

    //宸查�鍟嗗搧寮瑰眰涓殑鍙栨秷閫夋嫨鎸夐挳
    selectedViewList.onclick = function (e) {
        var e = e || window.event;
        var el = e.srcElement;
        if (el.className=='del') {
            var input =  tr[el.getAttribute('index')].getElementsByTagName('input')[0]
            input.checked = false;
            input.onclick();
        }
    }

    //涓烘瘡琛屽厓绱犳坊鍔犱簨浠�
    for (var i = 0; i < tr.length; i++) {
        //灏嗙偣鍑讳簨浠剁粦瀹氬埌tr鍏冪礌
        tr[i].onclick = function (e) {
            var e = e || window.event;
            var el = e.target || e.srcElement; //閫氳繃浜嬩欢瀵硅薄鐨則arget灞炴�鑾峰彇瑙﹀彂鍏冪礌
            var cls = el.className; //瑙﹀彂鍏冪礌鐨刢lass
            var countInout = this.getElementsByTagName('input')[1]; // 鏁扮洰input
            var value = parseInt(countInout.value); //鏁扮洰
            //閫氳繃鍒ゆ柇瑙﹀彂鍏冪礌鐨刢lass纭畾鐢ㄦ埛鐐瑰嚮浜嗗摢涓厓绱�
            switch (cls) {
                case 'add': //鐐瑰嚮浜嗗姞鍙�
                    countInout.value = value + 1;
                    getSubtotal(this);
                    break;
                case 'reduce': //鐐瑰嚮浜嗗噺鍙�
                    if (value > 1) {
                        countInout.value = value - 1;
                        getSubtotal(this);
                    }
                    break;
                case 'delete': //鐐瑰嚮浜嗗垹闄�
                    var conf = confirm('确定要删除吗？');
                    if (conf) {
                        this.parentNode.removeChild(this);
                    }
                    break;
            }
            getTotal();
        }
        // 缁欐暟鐩緭鍏ユ缁戝畾keyup浜嬩欢
        tr[i].getElementsByTagName('input')[1].onkeyup = function () {
            var val = parseInt(this.value);
            if (isNaN(val) || val <= 0) {
                val = 1;
            }
            if (this.value != val) {
                this.value = val;
            }
            getSubtotal(this.parentNode.parentNode); //鏇存柊灏忚
            getTotal(); //鏇存柊鎬绘暟
        }
    }
    // 鐐瑰嚮鍏ㄩ儴鍒犻櫎
    deleteAll.onclick = function () {
        if (selectedTotal.innerHTML != 0) {
            var con = confirm('纭畾鍒犻櫎鎵��鍟嗗搧鍚楋紵'); //寮瑰嚭纭妗�
            if (con) {
                for (var i = 0; i < tr.length; i++) {
                    // 濡傛灉琚�涓紝灏卞垹闄ょ浉搴旂殑琛�
                    if (tr[i].getElementsByTagName('input')[0].checked) {
                        tr[i].parentNode.removeChild(tr[i]); // 鍒犻櫎鐩稿簲鑺傜偣
                        i--; //鍥為�涓嬫爣浣嶇疆
                    }
                }
            }
        } else {
            alert('璇烽�鎷╁晢鍝侊紒');
        }
        getTotal(); //鏇存柊鎬绘暟
    }
	console.log("\u767e\u5ea6\u641c\u7d22\u3010\u7d20\u6750\u5bb6\u56ed\u3011\u4e0b\u8f7d\u66f4\u591aJS\u7279\u6548\u4ee3\u7801");
    // 榛樿鍏ㄩ�
    checkAllInputs[0].checked = true;
    checkAllInputs[0].onclick();
}
