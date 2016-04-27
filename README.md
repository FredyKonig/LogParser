# LogParser
Testing small log parser 

## Description

This test should not take you longer than two hours to complete. 

What we are looking for: functionality, efficiency, readability and tests
Use this test to demonstrate your understanding of OO and TDD.


## ruby_app

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  
     e.g.: ./parser.rb webserver.log

b. Returns the following:

list of webpages with most page views ordered from most pages views to less page views
     
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
list of webpages with most unique page views also ordered
     
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...

## example

       ./lib/parser.rb logs/webserver.log 

URL list with counts:
/about/2 90 visits 
/contact 89 visits 
/index 82 visits 
/about 81 visits 
/help_page/1 80 visits 
/home 78 visits 

URL List with uniq ip
/help_page/1 23  unique views
/contact 23  unique views
/home 23  unique views
/index 23  unique views
/about/2 22  unique views
/about 21  unique views


