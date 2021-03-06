const reportSubmit = () => {
  const newReport = document.getElementById('new_report');
  if (newReport) {
    const reportSubmit = document.getElementById('reportSubmit');
    const reportClose = document.querySelector('.close');
    const js_flashes = document.getElementById("js_flashes");
    
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
      js_flashes.innerHTML = `<div class='alert alert-warning alert-dismissible fade show m-1' role='alert'>
                                Report generated succesfully.
                                <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                                  <span aria-hidden='true'>&times;</span>
                                </button>
                              </div>`
    });  
  }
}

const validate = (newReport) => {
  const   reportCategories = ['Scam', 'Spam', 'Hate speech or symbols', 'Violence or threat of violence', 'Harassment or bullying', 'Sale or promote', 'Nudity or pornography'];
  const condition1 = reportCategories.includes(newReport[3].value);
  const condition2 = newReport[4].value.length >= 10;
  if (condition1 && condition2) {
    return true
  } else {
    return false
  }
}

export { reportSubmit };
