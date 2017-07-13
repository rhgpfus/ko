/**
 * 
 */


function checkValue(fObj){
	var maxNum = fObj.elements.length;   //form테그 안에잇는 꼬봉들을 가져오기위한 변수 ->>elements
	
	var result = "";
	for(var i=0;i<maxNum;i++){
		var eObj= fObj.elements[i];
		if(i%2==1 && i!=maxNum-1){
			var checkNum = new Number(eObj.value);
			try{  //자주써서 에러를 바로보자.
				if(isNaN(checkNum)){
					alert("숫자가아냐!");
					eObj.value = "";
					eObj.focus();
					return false;
				}
			}catch(e){
				alert(e);  
				throw e;
			}
		}
		if(eObj.value!="전송"){
			result += eObj.value;
		}
		if(i==maxNum-1){
			eObj.value = result;
		}
	}
	return false;
}