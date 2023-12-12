function submitForm() {
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var address = document.getElementById("address").value;

    var userData = {
        name: name,
        email: email,
        phoneNO: phone,
        address: address
    };

    // Send the user data to your Spring Boot application using Fetch API
    fetch('http://localhost:8080/demo', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(userData)
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
        alert('User data submitted successfully!');
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error submitting user data. Please try again.');
    });
}