local counter = {}

local flags = {byteBuilt=false,binaryBuilt=false,hexadecimalBuilt=false,decimalBuilt=false}

local byteSize = 1

local byteListMAIN = {}
local byteListAUXI = {}

local binary = ""

local hexadecimal = ""

local hexadecimalList = {0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F'}

local decimal = 0

local function setByteSize(s)
  byteSize = s * 8
end

function counter.byteBuild(s) -- Clear the bytes and prepare s bytes 
  s = s or 1
  setByteSize(s)
  for i=1,byteSize do
    byteListMAIN[i] = 0
    byteListAUXI[i] = 0
  end
  flags.byteBuilt = true
  flags.decimalBuilt = false
  flags.binaryBuilt = false
  flags.hexadecimalBuilt = false
end

function counter.byteToDecimal() -- Returns the byte value in decimal
  if not flags.byteBuilt then
    print('Byte(s) not ready yet')
    return 0
  end
  if flags.decimalBuilt then
    return decimal
  end
  decimal = 0
  local bit = 1
  for i=byteSize,1,-1 do
    if byteListMAIN[i] == 1 then
      decimal = decimal + bit
    end
    bit = bit*2
  end
  flags.decimalBuilt = true
  return decimal
end

function counter.decimalToByte(x) -- transforms the x in to binary and load it in byteListAUX
  x = x or 0
  for i=1,byteSize do
    byteListAUXI[i] = 0
  end
  local bigBit = counter.bigestBit()
  for i=1,byteSize do
    if x >= bigBit then
      byteListAUXI[i] = 1
      x = x - bigBit
    end
    bigBit = bigBit/2
  end
end

function counter.byteToBinary() -- Return the byte value in binary in a string
  if not flags.byteBuilt then
    print('Byte(s) not ready yet')
    return ""
  end
  if flags.binaryBuilt then
    return binary
  end
  
  binary = ""
  for i=1,byteSize do
    binary = binary .. tostring(byteListMAIN[i])
  end
  return binary
end

function counter.byteSize() -- Returns the biggest value the bytes can hold before overflowing
  if byteSize == 1 then return 1 end
  local res = 1
  for i=1,byteSize do
    res = res * 2
  end
  res = res - 1
  return res
end

function counter.bigestBit() -- Returns the vaule of the biggest bit
  if byteSize == 1 then return 1 end
  local res = 1
  for i=1,byteSize-1 do
    res = res * 2
  end
  return res
end

function counter.getBit(b) -- Returns the said bit in the byteListMAIN
  return byteListAUXI[b]
end

function counter.lAND(x) -- Load x as binary in byteListAUX then AND it to byte list
  x = x or 0
  counter.decimalToByte(x)
  for i=1,byteSize do
    if byteListAUXI[i] == 0 then
      byteListMAIN[i] = 0
    end
  end
end
  
function counter.increment(x) -- Load x as binary in byteListAUX then add it to byte list
  x = x or 0
  local inc = true
  local a = 0
  local b = 0
  local c = 0
  
  local function addBits(u) -- Add the bits in byteList[x] and byteListAUX[x]
    u = u or 1
    if u < 1 then u = 1 end
    while u > byteSize do
      u = u - byteSize
    end
    a = byteListMAIN[u]
    b = byteListAUXI[u]
    if a == 1 then
      if b == 1 and c == 1 then
        a = 1
        c = 1
      elseif b == 1 and c == 0 then
        a = 0
        c = 1
      elseif b == 0 and c == 1 then
        a = 0
        c = 1
      end
    elseif b == 1 and c == 1 then
      a = 0
      c = 1
    elseif b == 0 and c == 1 then
      a = 1
      c = 0
    elseif b == 1 and c == 0 then
      a = 1
    end
    byteListMAIN[u] = a
    a = 0
    b = 0
  end
  
  counter.decimalToByte(x)
  for i=byteSize,1,-1 do
    addBits(i)
  end
  flags.decimalBuilt = false
  flags.binaryBuilt = false
  flags.hexadecimalBuilt = false
end

io.write('Write your player id: ')
local id = io.read("*n")
counter.byteBuild(2)
counter.increment(id)
counter.lAND(3)
local d = counter.byteToDecimal()
local result = {
  "Top Left",
  "Top Right",
  "Bottom Left",
  "Bottom Right"}
print(result[d + 1])