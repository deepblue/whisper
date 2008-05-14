= whisper

* Author: deepblue(Bryan Kang)
* http://myruby.net/pages/1182106

== DESCRIPTION:

Whisper(http://whisper.playmaru.net/) wrapper library for ruby.

== FEATURES/PROBLEMS:

* get_messages
* post_message

== SYNOPSIS:

	# initialize
	whisper = Whisper.new(:consumer_token => 'CT',   
	  :consumer_secret => 'CTS', 
	  :access_token => 'AT', 
	  :access_secret => 'ATS')
	
	# get messaage
	whisper.get_message
	whisper.get_message('inbox', :star_check => true)
	
	# post message
	whisper.post_message http://rath.myid.net/, 'Thank you!'
	

== REQUIREMENTS:

* oauth
* ruby-hmac
* active_support

== INSTALL:

sudo gem install whisper

== LICENSE:

(The MIT License)

Copyright (c) 2008 Bryan Kang

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.