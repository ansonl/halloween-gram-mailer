#!/bin/bash

while read line; do
  echo "$line read"
done < emails

randomImages[0]="http:\\/\\/i.imgur.com\\/eT1Tuws.jpg"
randomImages[1]="http:\\/\\/i.imgur.com\\/BdBLFp6.gif"
randomImages[2]="http:\\/\\/i.imgur.com\\/aVwNMEx.gif"
randomImages[3]="http:\\/\\/i.imgur.com\\/52WMnWV.png"
randomImages[4]="http:\\/\\/i.imgur.com\\/vaOxaJ1.jpg"
randomImageURL=${randomImages[$(($RANDOM % 5))]}

from="cybergod@usa"
to="m163876@usna.edu"
subject="Halloween gram confirmation"
sed 's/NAME//' htmlMessage.html > tmp
message=$(sed 's/RANDOMIMAGE/'$randomImageURL'/' tmp)


(
echo "From: $from";
echo "To: $to";
echo "Reply-to: m171500@usna.edu";
echo "Reply-to: m163876@usna.edu";
echo "Subject: $subject";
echo "Content-Type: text/html"
echo "MIME-Version: 1.0";
echo "";
echo "$message";
) | sendmail -t
