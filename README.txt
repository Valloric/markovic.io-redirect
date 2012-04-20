To run wwwizer on heroku:

- heroku create
- git push heroku master
- heroku domains:add zzz-yourdomaingoeshere-zzz.com
- curl -D - -H "Host: zzz-yourdomaingoeshere-zzz.com" proxy.heroku.com

HTTP/1.1 301 Moved Permanently
Server: nginx
Date: Fri, 20 Apr 2012 17:06:08 GMT
Content-Type: text/html
Connection: keep-alive
Location: http://www.zzz-yourdomaingoeshere-zzz.com/
Content-Length: 95
X-Varnish: 459303571
Age: 0
Via: 1.1 varnish

Click <a href="http://www.zzz-yourdomaingoeshere-zzz.com/">here</a> if you are not redirected.