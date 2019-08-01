const closingSubmit = () => {
  const closingPubForm = document.querySelector('[id^="edit_publication"]');
  const closingSubmit = document.getElementById('closingSubmit');
  const fileUploader = closingPubForm[4]
  if (closingSubmit) {
    
    closingPubForm.addEventListener('keyup', () => {
      if (validate(closingPubForm)) {
        closingSubmit.disabled = false;
      } else {
        closingSubmit.disabled = true;
      }
    })
    fileUploader.addEventListener('input', () => {
      if (validate(closingPubForm)) {
        closingSubmit.disabled = false;
      } else {
        closingSubmit.disabled = true;
      }
    })
  }
}

const validate = (closingPubForm) => {
  const condition1 = closingPubForm[3].value.length >= 140;
  const condition2 = closingPubForm[4].value.length > 0;
  if (condition1 && condition2) {
    return true
  } else {
    return false
  }
}

export { closingSubmit };