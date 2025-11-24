using FileIO: load, save
import LibSndFile
using PortAudio
using MP3

println(PortAudio.devices())

snd = load("アンドロイドガール.mp3")

println("rate: ", snd.samplerate)
println("channels: ", size(snd, 2))
println("eltype: ", eltype(snd))

buf = Array{Float32}(snd)

stream = PortAudioStream("MacBook Air Speakers", 0, 2, samplerate=44100)
write(stream, buf)
close(stream)
