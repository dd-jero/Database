document.addEventListener("DOMContentLoaded", function () {

    // 업데이트 필요한 변수는 let, 고정적은 const
    // querySelector는 아이디 앞에 #, 클래스 앞에 .
    // getElementsById는 해당 아이디를 가진 태그 선택 
    let maxRangeSpan = document.getElementById("max-range"); // 최대 범위를 업데이트할 <span> 요소
    const playButton = document.querySelector("button");

    playButton.addEventListener("click", function (event) { // play 버튼을 누르면 
        event.preventDefault(); // 폼 제출 방지

        const userInput = parseInt(document.querySelector("#num").value); // 입력값 가져옴 
        const maxRange = parseInt(document.querySelector("#js-range").value); // 최대 범위 가져옴 
        // 결과를 출력합니다.
        let resultSpan = document.querySelector("#js-result");
        let machineInput = getRandomNumber(0, maxRange)
        let text_res =document.createElement("span"); // 새로운 요소 형성
        text_res.style.fontWeight = "bold"; // 글씨 굵게 

        if (userInput == machineInput) // 비교를 통해 텍스트 저장 
        {
            text_res.textContent = "You win!";
        }
        else
        {
            text_res.textContent = "You lose!";
        }

        // innerHTML을 이용하면 요소의 HTML 내용을 설정 할 수 있다.  ex) <br>
        resultSpan.innerHTML = `You choose: ${userInput}, the machine choose: ${machineInput}<br>`;
        resultSpan.appendChild(text_res); // 해당 요소의 맨 뒤에 삽입
    });

    // 드래그에 따라 랜덤 숫자 범위 조절하면 최대 범위 업데이트 
    document.querySelector("#js-range").addEventListener("change", function () {
        maxRangeSpan.textContent = this.value;
    });

    // 0~최대범위 사이 랜덤 값 반환 
    function getRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
});