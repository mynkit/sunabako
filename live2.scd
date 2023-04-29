// ---------scene1---------

// node free
(
var osc = NetAddr.new("localhost", 57110);
osc.sendMsg("n_free", 2000);
osc.sendMsg("n_free", 2001);
)

// def
(
var osc = NetAddr.new("localhost", 57110);

~scene1n1 = 2000;
~scene1n2 = 2001;


osc.sendMsg("/s_new", \sine, ~scene1n1, 1, 0, \freq, 640.487/4, \amp, 0, \parFreq, 1.5, \pan2Freq, 1, \vibratoDepth, 0.3, \vibratoFreq, 0, \actave, 1, \reverb, 0.7);

osc.sendMsg("/s_new", \sine, ~scene1n2, 1, 0, \freq, 570.609/4, \amp, 0, \vibratoDepth, 0.3, \vibratoFreq, 1, \actave, 1, \reverb, 0.6, \parFreq, 0, \pan2Freq, 30, \vibratoFreq, 0, \vibratoDepth, 2);

)

// play, vol control

(
var osc = NetAddr.new("localhost", 57110);
var masterVol = 0;

osc.sendMsg("/n_set", ~scene1n1, \amp, 0.9*masterVol);
osc.sendMsg("/n_set", ~scene1n2, \amp, 0.9*masterVol);
)

// change param
(
var osc = NetAddr.new("localhost", 57110);

osc.sendMsg("/n_set", ~scene1n1, \freq, 640.487/4, \reverb, 0.7, \ice, 0, \parFreq, 10, \pan2Freq, 659.255/32);

osc.sendMsg("/n_set", ~scene1n2, \freq, 570.609/4, \reverb, 0.8, \ice, 0, \parFreq, 0, \pan2Freq, 10);
)

// change param

(
var osc = NetAddr.new("localhost", 57110);

osc.sendMsg("/n_set", ~scene1n1, \vibratoFreq,0.1,\vibratoDepth, 3);

osc.sendMsg("/n_set", ~scene1n2, \vibratoFreq,0.15,\vibratoDepth, 5);
)


// ---------scene2---------

// node free
(
var osc = NetAddr.new("localhost", 57110);
osc.sendMsg("n_free", 2002);
osc.sendMsg("n_free", 2003);
)

// def
(
var osc = NetAddr.new("localhost", 57110);

~scene2n1 = 2002;
~scene2n2 = 2003;


osc.sendMsg("/s_new", \sine, ~scene2n1, 1, 0, \freq, 493.883, \amp, 0, \parFreq, 1.5, \pan2Freq, 1, \vibratoDepth, 0.3, \vibratoFreq, 3, \actave, 1, \reverb, 0.7);

osc.sendMsg("/s_new", \sine, ~scene2n2, 1, 0, \freq, 523.251/8, \amp, 0, \vibratoDepth, 0.3, \vibratoFreq, 1, \actave, 1, \reverb, 0.5, \parFreq, 90, \pan2Freq, 110, \vibratoFreq, 1, \vibratoDepth, 0.1);

)

// play, vol control
(
var osc = NetAddr.new("localhost", 57110);
var masterVol = 1;

osc.sendMsg("/n_set", ~scene2n1, \amp, 0.5*masterVol);
osc.sendMsg("/n_set", ~scene2n2, \amp, 0.9*masterVol);
)

// change param
(
var osc = NetAddr.new("localhost", 57110);

var twoDegree = 1.122462048309373;

osc.sendMsg("/n_set", ~scene2n1, \freq, 493.883, \reverb, 0.7, \ice, 0.2, \parFreq, 10, \pan2Freq, 391.995/32);

osc.sendMsg("/n_set", ~scene2n2, \freq, 523.251/4, \reverb, 0.8, \ice, 0.2, \parFreq, 10, \pan2Freq, 523.251/4);
)

// change param
(
var osc = NetAddr.new("localhost", 57110);

osc.sendMsg("/n_set", ~scene2n2, \vibratoFreq, 2, \vibratoDepth, 3);
)


// stop
(
var osc = NetAddr.new("localhost", 57110);

osc.sendMsg("n_free", ~scene2n1);
osc.sendMsg("n_free", ~scene2n2);
)

//
// stop river
//

r.set(\amp, 0);
r.free;
