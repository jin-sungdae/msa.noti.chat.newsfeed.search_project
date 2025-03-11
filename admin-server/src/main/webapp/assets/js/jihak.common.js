// Element 존재 여부 판단
const isExist = (el) => {
    return el !== null && el !== undefined;
}

// 숫자만 입력받기 -> numberOnly attribute 추가
document.querySelectorAll('input[numberOnly]').forEach((el) => {
    el.addEventListener('keyup', (inp) => {
        inp.target.value = inp.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
    })
});

// 한글 입력방지
document.querySelectorAll('input[notKor]').forEach((el) => {
    el.addEventListener('keyup', (inp) => {
        const regExp = /[^0-9a-zA-Z.]/g;
        inp.target.value = inp.target.value.replace(regExp, '');
    })
})

// 특수 문자 입력방지
document.querySelectorAll('input[notEtc]').forEach((el) => {
    el.addEventListener('keyup', (inp) => {
        console.log('123');
        const regex = /[^ㄱ-ㅎ가-힣a-zA-Z0-9\s]/g;
        inp.target.value = inp.target.value.replace(regex, '');
    })
    el.addEventListener('paste', (e) => {
        console.log('qwe');
    })
})

// 특수문자, 숫자 입력방지
document.querySelectorAll('input[onlyEngKor]').forEach((el) => {
    el.addEventListener('keyup', (inp) => {
        const regex = /[^ㄱ-ㅎ가-힣a-zA-Z]/g;
        inp.target.value = inp.target.value.replace(regex, '');
    })
})

// 영문 / 특수문자 입력방지
document.querySelectorAll('input[notEngEtc]').forEach((el) => {
    el.addEventListener('keyup', (inp) => {
        const regExp = /[^ㄱ-ㅎ가-힣0-9]/gi;
        inp.target.value = inp.target.value.replace(regExp, '');
    })
})