Runs a redirect service to val.markovic.io. Both www.markovic.io and markovic.io
(the zone apex) have A records pointing to heroku's static IP's. This will route
any incoming request to this app which will redirect users to val.markovic.io.

- heroku create
- git push heroku master
- heroku domains:add example.com
- curl -D - -H "Host: example.com" proxy.heroku.com

HTTP/1.1 301 Moved Permanently
Server: nginx
Date: Fri, 20 Apr 2012 17:06:08 GMT
Content-Type: text/html
Connection: keep-alive
Location: http://val.markovic.io/
Content-Length: 95
X-Varnish: 459303571
Age: 0
Via: 1.1 varnish

Click <a href="http://val.markovic.io/">here</a> if you are not redirected.

---

