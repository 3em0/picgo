const url = 'http://localhost:3000/vip';
const data = { "code": 'value1'};
const customHeaders = {
	"Content-Type":"application/x-www-form-urlencoded",
	"aaaa":"bbbb",
	"Cookie":"token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh0dHA6Ly84LjE0Mi45My4xMDM6NTAwMCIsImlzVmlwIjpmYWxzZSwiaWF0IjoxNjk4NTgyNzAzfQ.dLeIhtDHRJcmICNt2kHDIrqsK3KjBOhyZNRETyEsR5kaOtrXQvFlvHyAUj3zHFcqvckED5rRO0w99zcgzVHe26XF-SjRxz14toLcaOS9wV5VBUPpjF2YDyLfldE8e6VBrIQH27-h3ahiDPlR1LYHxHBTVdKBbzLVBwenJK6LnmFMBmYfhRAWhun-7ncQYbwzKLkkDUJTgmM7-ScvDrsVw0o2An1XVbM48GSIkf9hECA2qzBSBWSIizT0VY_7KtxP4PtoziTs40AjWiN2QkPoeNkDguojas3skUF4kbzCjsX1j_3u47ym4nmueutcyss6MU1WhsC3GVmdw5bIoNXLQA"
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
