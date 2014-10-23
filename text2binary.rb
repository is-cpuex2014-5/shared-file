str = STDIN.gets
a = str.scan(/.{1,8}/)
a = a.map { |s| ("0b" + s).to_i(0) }
ret = a.inject("") { |out, i | out = out + i.chr}  
print ret
