#!/bin/bash

forconvert=$(xsel)

# no data
if [[ -z "$forconvert" ]]; then
	notify-send "note: nothing selected!"
	exit 0
fi

# есть хотя бы одная русская буква
if [[ $forconvert =~ [А-ЯЁа-яё] ]]
# \x2F = / = slash
# \x5C = \ = backslash
then
	from="фисвуапршолдьтщзйкыегмцчняФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯхъХЪжэЖЭбюБЮ№ёЁ"
	to="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]{};':\",.<>#\`~"

	replace_direction='ru_us'
else
	from="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ[]{};':\",.\/<>?@#\$^&\`~"
	to="фисвуапршолдьтщзйкыегмцчняФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯхъХЪжэЖЭбю.БЮ,\"№;:?ёЁ"

	replace_direction='us_ru'
fi

# replace all symbols
forconvert=$(printf '%s' "$forconvert" | sed "y/$from/$to/")

# save original buffer
orig_bufer=$(xsel --clipboard --output)

# place result in buffer
printf '%s' "$forconvert" | xsel --clipboard --input
# sleep 0.1

# insert from buffer
xdotool key Shift+Insert

# Return original bufer back
printf %s "$orig_bufer" | xsel --clipboard --input

# switch layout to current used
# notify-send $replace_direction
[[ $replace_direction == 'us_ru' ]] && g3kb-switch -s ru


