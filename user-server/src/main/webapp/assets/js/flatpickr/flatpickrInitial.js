const initializeFlatpickr = (defaultYn) => {
    let today = new Date();
    // 한달 전 기본값
    const oneMonthBefore = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    // 오늘로부터 1년 전의 날짜 계산
    let oneYearAgo = new Date();
    oneYearAgo.setFullYear(oneYearAgo.getFullYear() - 1);

    const startDateInput = document.getElementById('startDate') ? document.getElementById('startDate') : document.getElementById('sdate') ?  document.getElementById('sdate') : document.getElementById('startRegDate');
    const endDateInput = document.getElementById('endDate') ? document.getElementById('endDate') : document.getElementById('edate') ? document.getElementById('edate') : document.getElementById('endRegDate');
    // console.log(startDateInput);
    // console.log(endDateInput);
    if (!startDateInput || !endDateInput) {
        return false;
    }
    const initialStartDate = startDateInput.value;
    const initialEndDate = endDateInput.value;

    startFlatpickr = flatpickr(startDateInput, {
        dateFormat: 'Y-m-d',
        locale: 'ko',
        defaultDate: !defaultYn ? null : initialStartDate || oneMonthBefore,
        maxDate: today,
        onChange: function (selectedDates) {
            if (selectedDates.length > 0) {
                let maxDate = new Date(selectedDates[0]);
                let minDate = new Date(selectedDates[0]);
                maxDate.setFullYear(maxDate.getFullYear() + 1);
                if (today < maxDate) {
                    maxDate = today;
                }
                if (minDate > oneYearAgo) {
                    minDate = oneYearAgo;
                }
                endFlatpickr.set('minDate', selectedDates[0]);
                endFlatpickr.set('maxDate', maxDate);
                // endFlatpickr.setDate(maxDate);
                startFlatpickr.set('minDate', minDate);
                startFlatpickr.setDate(selectedDates[0]);
                startFlatpickr.set('maxDate', maxDate);
            }
        }
    });
    endFlatpickr = flatpickr(endDateInput, {
        dateFormat: 'Y-m-d',
        locale: 'ko',
        defaultDate: !defaultYn ? null : initialEndDate || today,
        maxDate: today,
        onChange: function (selectedDates) {
            if (selectedDates.length > 0) {
                let minDate = new Date(selectedDates[0]);
                minDate.setFullYear(minDate.getFullYear() - 1);
                startFlatpickr.set('minDate', minDate);
                startFlatpickr.set('maxDate', selectedDates[0]);
                // startFlatpickr.setDate(minDate);
                endFlatpickr.set('minDate', minDate);
                endFlatpickr.setDate(selectedDates[0]);
                endFlatpickr.set('maxDate', selectedDates[0]);
            }
        }
    });
}