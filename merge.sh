#!/bin/bash

mkdir app/js/master
find app/js/collections -name "*.js" | xargs cat >app/js/master/collections.js
find app/js/controllers -name "*.js" | xargs cat >app/js/master/controllers.js
find app/js/models -name "*.js" | xargs cat >app/js/master/models.js
find app/js/views -name "*.js" | xargs cat >app/js/master/views.js
awk 'match($0,"/collections/") == 0 {print $0}' app/index_mobile.html >temp.html
awk 'match($0,"/controllers/") == 0 {print $0}' temp.html >temp1.html
awk 'match($0,"/models/") == 0 {print $0}' temp1.html >temp2.html
awk 'match($0,"/views/") == 0 {print $0}' temp2.html >temp3.html
sed 's/<!----call app start file here---->/<script src="js\/master\/collections.js" type="text\/javascript"><\/script>\
    <script src="js\/master\/controllers.js" type="text\/javascript"><\/script>\
    <script src="js\/master\/models.js" type="text\/javascript"><\/script>\
    <script src="js\/master\/views.js" type="text\/javascript"><\/script>\
    <!----call app start file here---->/' temp3.html>app/index_mobile.html
rm temp*.html
rm -r app/js/collections
rm -r app/js/controllers
rm -r app/js/models
rm -r app/js/views
