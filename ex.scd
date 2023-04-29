(
SynthDef(\zureSynth, {|out, amp=1, sustain=1, accelerate, freq, decay=0, slide=1, detune=1 |
	var env = EnvGen.ar(Env.linen(0, 0, 0.6, 1, -2), timeScale:sustain, doneAction:2);
	var basefreq = freq * Line.kr(1, 1+accelerate, sustain);
	var sound = VarSaw.ar(basefreq, 0, Line.ar(0,0.5,sustain*20/slide));
	var sound2 = VarSaw.ar(basefreq*(detune/100+1), 0, Line.ar(0,0.5,sustain*20/slide));
	var sound3 = VarSaw.ar(basefreq*(-1*detune/100+1), 0, Line.ar(0,0.5,sustain*20/slide));
	var lpfEnv = 400 + EnvGen.ar(Env.linen(0, 0, 0.5, 2000, -30), timeScale:sustain);
	sound = sound - DelayN.ar(sound2,0.2, Line.ar(0,1,5*sustain/slide)/basefreq)
	+ DelayN.ar(sound3,0.2, Line.ar(0,1,20*sustain/slide)/basefreq);
	sound = LPF.ar(sound, lpfEnv);
	sound = sound!2;
	Out.ar(out, sound*0.1*amp*env);
}).add;
)



(
x = Synth("zureSynth", [\amp, 1, \sustain, 10, \freq, 369.994/2]);
y = Synth("zureSynth", [\amp, 1, \sustain, 10, \freq, 329.628/2]);
z = Synth("zureSynth", [\amp, 1, \sustain, 10, \freq, 277.183/2]);
w = Synth("zureSynth", [\amp, 1, \sustain, 10, \freq, 415.305/2]);
)

(
SynthDef(\zure2, {|amp=1, freq, detune=1, sustain=5, out=0 |
	var sound = VarSaw.ar(freq, 0);
	var sound2 = VarSaw.ar(freq*(detune/100+1), 0);
	var sound3 = VarSaw.ar(freq*(-1*detune/100+1), 0);
	var lpfEnv = 600;
	var env = EnvGen.ar(Env.linen(0, 0, 0.6, 1, -2), timeScale:sustain, doneAction:2);
	sound = sound - DelayN.ar(sound2,0.2)
	+ DelayN.ar(sound3,0.2);
	sound = LPF.ar(sound, lpfEnv);
	sound = sound!2;
	Out.ar(out, sound*0.1*amp*env);
}, [10]).asBytes.printOn(Post); nil
)



(
x = Synth("zure2", [\amp, 1, \freq, 440/4, \detune, 0.5]);
z = Synth("zure2", [\amp, 1, \freq, 277.183/2, \detune, 0.2]);
// y = Synth("zure2", [\amp, 1, \freq, 329.628/2, \detune, 0.7]);
w = Synth("zure2", [\amp, 1, \freq, 415.305/2, \detune, 0.5]);
)