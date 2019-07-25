const reportSubmit = () => {
  const reportModal = document.getElementById('reportModal');
  const newReport = document.getElementById('new_report');
  const reportSubmit = document.getElementById('reportSubmit');
  const reportClose = document.querySelector('.close');
  
  newReport.addEventListener('keyup', () => {
    if (validate(newReport)) {
      reportSubmit.disabled = false;
    } else {
      reportSubmit.disabled = true;

    }
  })
  
  reportSubmit.addEventListener('click', e => {
    e.preventDefault();
    reportClose.click();
    newReport.submit();
    newReport[3].value = '';
    newReport[4].value = '';
    newReport[5].value = '';
  });
}

const validate = (newReport) => {
  const options = ['Scam', 'Illegal']
  const condition1 = options.includes(newReport[3].value);
  const condition2 = newReport[4].value.length >= 140;
  if (condition1 && condition2) {
    return true
  } else {
    return false
  }
}

export { reportSubmit };
