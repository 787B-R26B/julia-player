using FileIO: load, save
using LibSndFile
using PortAudio
using MP3

println(PortAudio.devices())

# snd = load("02 sleeping beauty.aiff")
snd = LibSndFile.load("02 sleeping beauty.aiff")

sr = LibSndFile.samplerate(snd)
nch = LibSndFile.channels(snd)
nfrm = LibSndFile.frames(snd)

println("rate: ", sr)
println("channels: ", nch)
println("eltype: ", nfrm)

buf = reshape(buf, nch, :)'


stream = PortAudioStream("MacBook Air Speakers", 0, nch, samplerate=sr)
write(stream, buf)
close(stream)
LibSndFile.close(snd)
