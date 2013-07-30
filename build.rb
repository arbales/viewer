require 'json'
files = Dir.entries("images")

files = files.select do |f|
  f =~ /(gif|jpe?g|png|tiff)$/i
end

payload = {FILES: files}

payload = JSON.generate files
payload = "window.FILES = #{payload};"

File.open("js/files.js", 'w+') { |file| file.write(payload) }

`rm -rf build && mkdir build && cp -r images build && cp index.html build && coffee -c -o js src && cp -r js build`
