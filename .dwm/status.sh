#! /bin/bash

dte(){
  dte="$(date +"%d.%m.%Y")"
  echo -e "$dte"
}

tme(){
  tme="$(date +"%H:%M")"
  echo -e "$tme"
}

wthr() {
  wttrin=$(curl -s 'wttr.in/Helsinki?format=%t')
  echo -e "$wttrin"
}

xmr_price() {
  xmr_eur=$(curl -s 'https://min-api.cryptocompare.com/data/price?fsym=XMR&tsyms=EUR' | jq -r '.EUR')
  echo -e "$xmr_eur€"
}

while true; do
  xsetroot -name " ⛅ $(wthr) | 📅 $(dte) | ⏰ $(tme) | 🇲 $(xmr_price) "
  sleep 10s
done
