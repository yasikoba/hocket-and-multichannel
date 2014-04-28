// saw only
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
		sig = Saw.ar(freq, amp) * EnvGen.kr(Env.perc(0.01, sustain),
			doneAction: 2);
		Out.ar(1, sig);
	}).add;

SynthDef("ch2",
	{ arg freq = 440, amp = 0.5, sustain = 1;
		var sig;
		sig = Saw.ar(freq, amp) * EnvGen.kr(Env.perc(0.01, sustain),
			doneAction: 2);
		Out.ar(2, sig);
	}).add;


SynthDef("ch3",
	{ arg freq = 440, amp = 0.5, sustain = 1;
		var sig;
		sig = Saw.ar(freq, amp) * EnvGen.kr(Env.perc(0.01, sustain),
			doneAction: 2);
		Out.ar(3, sig);
	}).add;
)