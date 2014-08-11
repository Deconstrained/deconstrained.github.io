#!/bin/bash

sed -i 's:Technologies got to work on:Tools and Languages:g' *.html
sed -i 's%http://code.jquery.com/jquery-1.10.1.min.js%//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js%g' *.html
