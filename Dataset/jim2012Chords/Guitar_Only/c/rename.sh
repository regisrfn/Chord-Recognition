a=201
for i in *.wav; do
  new=$(printf "c-major-%d.wav" "$a")
  mv -i "$i" "$new"
  let a=a+1
done