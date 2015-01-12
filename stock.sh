#!/bin/bash

properties=("Symbol" 
"Name" 
"Price" 
"Volume" 
"Stock Exchange" 
"PE Ratio" 
"Day High" 
"Day Low" 
"Year High" 
"Year Low" 
"% change since Year High" 
"% change since Year Low" 
"Dividend Pay Date" 
"Current Year Price Estimate" 
"Next Year Price Estimate" 
"200 day moving average" 
"Book Value Per Share" 
"Estimate Current Year Earnings Per Share" 
"Estimate Next Quarter Earnings Per Share" 
"Estimate Next Year Earnings Per Share")

symbol=$1

url="http://download.finance.yahoo.com/d/quotes.csv?s=$symbol&f=s0n0l1v0x0r0h0g0k0j0k5j6r1r6r7m4b4e7e9e8"

echo " "
echo "Pinging $url"

dataString=$(curl -s "$url")
dataString=${dataString//\"/}

IFS=,
data=($dataString)

count=0

date="$(date)"

echo " "
echo "Current date: $date"
echo " "

for i in "${!data[@]}"
do
	property=${properties[$count]}
    echo "$property: ${data[i]}"
	count=$((count+1))
done

echo " "
