#!/bin/sh
####################################
link=$(
zenity --forms \
--width 600 \
--height 150 \
--text="Linkten indirme" \
--add-entry "İndirilecek linki giriniz" \
)

echo "alinan link : " $link
#####################################
dosyaadi=$(

zenity --forms \
--width 600 \
--height 150 \
--text="Linkten indirme" \
--add-entry "Kaydedilecek dosyanın adını girin" \

)

echo "girilecek dosya : " $dosyaadi
#####################################
######################################
########################################
ans=$(zenity --info --title 'İndirme Parametreleri' \
      --text 'Lütfen indirme işlemi için gereken parametreyi seçiniz' \
      --ok-label Cikis \
      --width 500 \
      --height 200 \
      --extra-button '-c' \
      --extra-button '-r -A' \
      --extra-button '-r -R' \
      --extra-button '-b' \
      --extra-button '--no-check-certificate' \
      --extra-button '-O' \
       )
  echo $ans
  if [[ $ans = "-c" ]]
  then
        echo "-C seçildi"
        wget -O $dosyaadi -c  $link

  elif [[ $ans = "-r -A" ]]
  then
        echo "-r -A secildi"
	sonuc=$(
zenity --forms \
--width 600 \
--height 150 \
--text="Linkten indirme" \
--add-entry "Kaydedilecek dosyanın türünü girin" \

)
	
	echo $sonuc "secilen tur"
	wget -O $dosyaadi -r -A $sonuc $link
  elif [[ $ans = "-r -R" ]]
  then
        echo "-r -R secildi"
	sonuc2=$(
zenity --forms \
--width 600 \
--height 150 \
--text="Linkten indirme" \
--add-entry "Kaydedilmeyecek dosyanın türünü girin" \

)
	echo $sonuc "secilen tur"
        wget -O $dosyaadi -r -R $sonuc2 $link
  elif [[ $ans = "-b" ]]
  then
        echo "-b seçildi"
	wget -O $dosyaadi -b  $link

  elif [[ $ans = "--no-check-certificate" ]]
  then
        echo "nocheck secildi"
	wget -O $dosyaadi --no-check-certificate  $link 
	
  elif [[ $ans = "-O" ]]
  then
        echo "-O secildi"
	wget -O  $dosyaadi $link        
  fi
########################################


#wget -O $ans  $dosyaadi $link

zenity --info \
--title "Bilgilendirme Mesajı" \
--width 600 \
--height 150 \