// (setq sclang-runtime-directory "~/git/hocket-and-multichannel/")

"boot.scd".load;
"score.scd".load;

"instruments.scd".load;
"saw.scd".load;

TempoClock.default.tempo = 110/60;

~instrument = ["ch0"];
~instrument = ["ch0", "ch1"];
~instrument = ["ch0", "ch1", "ch2", "ch3"];
~instrument = ["ch0", "ch1", "ch2", "ch3","ch2", "ch1"];

// create from midinote
~instrument = ~midinote.collect{|i| "ch" ++ (i % 4)};

~instrument = ~instrument.reverse;

~inst_pattern = Pseq(~instrument, inf);
~inst_pattern = Prand(~instrument, inf);
~inst_pattern = Pshuf(~instrument, inf);

// one voice
(
p = Pbind(*[
    instrument: ~inst_pattern,
    midinote:    Pseq(~midinote, 1),
    dur:         Pseq(~duration, 1),
    sustain:     Pseq(~sustain, 1)
]);
)

p.play;
p.stop; p.reset;

// canon
(
a = Pbind(*[
    instrument: ~inst_pattern,
    midinote:    Pseq(~midinote, 1),
    dur:         Pseq(~duration, 1),
    sustain:     Pseq(~sustain, 1)
]);
b = Pbind(*[
    instrument: ~inst_pattern,
    midinote:    Pseq(~midinote, 1, 38),
    dur:         Pseq(~duration, 1, 38),
    sustain:     Pseq(~sustain, 1, 38)
]);
c = Pbind(*[
    instrument: ~inst_pattern,
    midinote:    Pseq(~midinote, 1, 37),
    dur:         Pseq(~duration, 1, 37),
    sustain:     Pseq(~sustain, 1, 37)
]);
d = Pbind(*[
    instrument: ~inst_pattern,
    midinote:    Pseq(~midinote, 1, 36),
    dur:         Pseq(~duration, 1, 36),
    sustain:     Pseq(~sustain, 1, 36)
]);
)

a.play;
b.play;

Ppar([a, b]).play;
Ppar([a, b, c, d]).play;
