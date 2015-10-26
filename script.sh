#!/bin/bash

randomImages[0]="http:\\/\\/i.imgur.com\\/eT1Tuws.jpg"
randomImages[1]="http:\\/\\/i.imgur.com\\/dacU3tc.png"
randomImages[2]="http:\\/\\/i.imgur.com\\/t7ZxaBD.jpg"
randomImages[3]="http:\\/\\/i.imgur.com\\/52WMnWV.png"
randomImages[4]="http:\\/\\/i.imgur.com\\/vaOxaJ1.jpg"
randomImages[5]="http:\\/\\/i.imgur.com\\/6X9P0sZ.png"
randomImages[6]="http:\\/\\/i.imgur.com\\/0j50DRS.png"
randomImages[7]="http:\\/\\/i.imgur.com\\/5gpuHly.png"
randomImages[8]="http:\\/\\/i.imgur.com\\/PE3FtgK.png"


sendMail()
{
    randomImageURL=${randomImages[$(($RANDOM % 9))]}

    from="#CyberGod <GoNavy@USA>"
    to=$currentRecipient
    cc1="m163876@usna.edu"
    cc2="m171500@usna.edu"
    subject="Halloween gram(s) confirmation"
    sed 's/NAME/'${currentName// /$(echo -ne '\u00A0')}'/' htmlMessage.html > tmp
    message=$(sed 's/RANDOMIMAGE/'$randomImageURL'/' tmp)

    (
    echo "From: $from";
    echo "To: $to";
    echo "Cc: $cc1";
    echo "Cc: $cc2";
    echo "Reply-to: m171500@usna.edu";
    echo "Reply-to: m163876@usna.edu";
    echo "Subject: $subject";
    echo "Content-Type: text/html"
    echo "MIME-Version: 1.0";
    echo "";
    echo "$message";
    ) | sendmail -t
}


while read line; do
    IFS="|" read currentRecipient currentName <<< $line
    sendMail
    count=$((count+1))
    echo "Sent confirmation to $currentName at $currentRecipient"
done < emails

echo "$count messages sent."
