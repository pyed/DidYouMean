# query must be 20 characters or less
if [[ ${#POPCLIP_TEXT} -ge 21 ]]; then
	exit 1
fi

URL='http://www.google.com/search?q='$POPCLIP_TEXT

result=$(curl -s "$URL" | grep -oE '<i>.+?<' | head -1 | cut -c 4- | rev | cut -c 2- | rev)

if [[ -n $result ]]; then
	printf "${result}"
else
	exit 1
fi