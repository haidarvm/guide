mogrify -quality 90 -format jpg banner-vertical.png 
mogrify -resize 720 img.jpg


# webp to jpg / png
convert input.webp output.png


# combine image horizontaly 
convert +append in*.png out.png 

# combine stack
convert -append in*.png out.png 

