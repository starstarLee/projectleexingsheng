



    function makeid(length) {
    let result = '';
    const characters = '0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
}

    var form = document.getElementById("form");
    form.addEventListener("submit", formSubmit);
    let oldMessages = [];
    let newMessages = [];
    function formSubmit(e) {
        let temp = makeid(10)
        let name =  document.querySelector('input[name="name"]').value;
        let phone_number =  document.querySelector('input[name="phone"]').value;
        let email =  document.querySelector('input[name="email"]').value;
        var replyTos =  email;
        let country =   document.querySelector('input[name="country"]').value;
        let message =  document.querySelector('textarea[name="text"]').value;
        const messageElement = document.querySelector('#message');
        
        e.preventDefault()
 // Check if the message is already in the old messages array
 const messageExists = oldMessages.some(m => m.name === name && m.phone_number === phone_number && m.email === email && m.country === country && m.message === message);

 if (!messageExists) {
   // Add the message to the new messages array
   newMessages.push({
     name,
     phone_number,
     email,
     country,
     message,
     
   });}

        const options = {
  method: 'POST',
  headers: {
    accept: 'application/json',
    'content-type': 'application/json',
    'api-key': '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' //sendiblue api key 
  },
  body: JSON.stringify({
   sender: {name: 'Quantum Capital Global', email: 'noreply@qcgbroker.com'},
    to: [{email:'leexingsheng123@gmail.com' }],  
    htmlContent: '<!DOCTYPE html> <html> <body> <h3>Name</h3> <p>' + name +'<hr> <h3>Phone number</h3> <p>'+phone_number+'<hr> <h3>Email</h3> <p>'+replyTos+'<hr> <h3>Country<h3> <p>'+country+'<hr><h3>Message</h3> <p>'+message+'<hr></p> </body> </html>',
    textContent: 'Please confirm your email address by clicking on the link https://text.domain.com',
    subject: 'Quantum Capital Global - New Web Contact Form Request',
   replyTo:{email:replyTos},
    headers: {
      'sender.ip': '1.2.3.4',
      'X-Mailin-custom': 'some_custom_header',
      idempotencyKey: 'abc-' + temp
    },
    params: {FNAME: 'QCG', LNAME: 'BROKER'},
    tags: ['tag1'],
  })
};


fetch('https://api.sendinblue.com/v3/smtp/email', options)
.then(response => {
  if (!response.ok) {
    throw new Error('Network response was not ok');
  }else{
    messageElement.textContent = 'Your message has been sent successfully!';
    messageElement.style.color = 'green';
  }
  return response.json();
})
.then(data => {
  messageElement.textContent = 'Your message has been sent successfully!';
  messageElement.style.color = 'green';
  console.log('Email sent successfully');
  console.log(data);
  // empty input field
  document.querySelector('input[name="name"]').value = '';
  document.querySelector('input[name="phone"]').value = '';
  document.querySelector('input[name="email"]').value = '';
  document.querySelector('input[name="country"]').value = '';
  document.querySelector('textarea[name="text"]').value = '';
  

  
})
.catch(error => console.error('Error:', error));

}    
