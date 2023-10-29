const url = 'http://localhost:3000/vip';
const data = { "code": 'value1'};
const customHeaders = {
	"Content-Type":"application/x-www-form-urlencoded",
	"aaaa":"bbbb",
	"Cookie":"token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh0dHA6Ly84LjE0Mi45My4xMDM6NTAwMC92aXAiLCJpc1ZpcCI6ZmFsc2UsImlhdCI6MTY5ODU4MDEyOX0.h1S6qXk2a_MF343czEIm8XUyjHJ3p2b3uRc7idW11Au99dxZQWaJUtss6SfeCCYMil52BxSG28L36X8JerYRjH7v6UnVAYQLOeMtMXvRFmLjWYdwyDiHTfIFyTTmDRTtmIymhcXz7aACsLePMm7xgHfcwPlJC5sFdqhCg3TwpQBvVOk4h0grtp1i7uwdjTFsBBNh63QYPQEq-nZs7b9ioQTsUy8BNdHKUKaDov7D5ApoXVdoGcVaWdPzvnXHEpnyqxVXsYOaXiaC3K1wPQLRVRMhi47Vr1AJJtIxd5IyOIWm1ISI7Ui-4YjfeB0OdwRAx5OMruySdS8Mdr8iCZhyuA"
};

fetch(url, {
    method: 'POST',
    headers: customHeaders,
    body: "code=value1" // You can send JSON data or other formats
})
.then(response => response.json())
.then(data => {
    console.log(data); // Handle the response data here
})
.catch(error => {
    console.error('Error:', error);
});