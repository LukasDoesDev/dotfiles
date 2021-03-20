#!/bin/bash

dte(){
  dte="$(date +"%d.%m.%Y")"
  echo -e "$dte"
}

tme(){
  time="$(date +"%H:%M")"
  
  clock=$(date '+%I')

  case "$clock" in
	  "00") clockIcon="🕛" ;;
	  "01") clockIcon="🕐" ;;
	  "02") clockIcon="🕑" ;;
	  "03") clockIcon="🕒" ;;
	  "04") clockIcon="🕓" ;;
	  "05") clockIcon="🕔" ;;
	  "06") clockIcon="🕕" ;;
	  "07") clockIcon="🕖" ;;
	  "08") clockIcon="🕗" ;;
	  "09") clockIcon="🕘" ;;
	  "10") clockIcon="🕙" ;;
	  "11") clockIcon="🕚" ;;
	  "12") clockIcon="🕛" ;;
  esac

  echo -e "$clockIcon $time"
}

wthr() {
  wttrin=$(curl -s 'wttr.in/Helsinki?format=%t')
  echo -e "$wttrin"
}

xmr_price() {
  # xmr_eur=$(curl -s 'https://min-api.cryptocompare.com/data/price?fsym=XMR&tsyms=EUR' | jq -r '.EUR')
  xmr_eur="ratelimited"
  echo -e "$xmr_eur€"
}

# Add tons of space to account for systray
echo " ⛅ $(wthr) | 📅 $(dte) | $(tme) | 🇲 $(xmr_price)     ."
