// 4 instruments
(
SynthDef("ch0",
	{ arg freq = 440, amp = 0.5, sustain = 1;
		var sig;
		sig = Saw.ar(freq, amp) * EnvGen.kr(Env.perc(0.01, sustain),
			doneAction: 2);
		Out.ar(0, sig);
	}).add;

SynthDef("ch1",
	{ arg freq = 440, amp = 0.5, sustain = 1;
		var sig;
		sig = Pulse.ar(freq, 0.5, amp) * EnvGen.kr(Env.perc(0.01, sustain),
			doneAction: 2);
		Out.ar(1, sig);
	}).add;

SynthDef("ch2",
	{arg freq = 440, amp = 0.5, sustain = 1;
		var sig;
		sig = Blip.ar(freq, 200, amp) * EnvGen.kr(Env.perc(0.01, sustain),
			doneAction: 2);
		Out.ar(2, sig);
	}).add;

SynthDef("ch3",
	{arg freq = 440, amp = 0.5, sustain = 1;
		var sig;
		sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.perc(0.01, sustain),
			doneAction: 2);
		Out.ar(3, sig);
	}).add;
)
