a=101
for i in 'g'*.wav; do
  new=$(printf "g-major-%d.wav" "$a")
  mv -i "$i" "$new"
  let a=a+1
done