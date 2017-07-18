% age values for atlas centers
atlasCenterAges = 25:0.1:65;
sig = 6;

Age=[
  20
22
24
26
28
22
25
25
26
28
31
32
35
37
39
30
31
33
34
36
40
43
43
44
48
43
44
46
47
49
50
55
57
57
57
51
55
56
57
58
61
64
65
66
66
60
61
64
67
72
  ];

Vol = [
  1.746671773
0.447151273
0.712119293
1.370743842
0.976619673
1.515131514
1.061746515
0.842051627
2.637065106
0.810407722
0.817986838
1.222850955
0.87263056
0.770027535
1.307659767
0.671672261
1.296590679
0.4913036
1.201253529
1.6160994
0.912552181
0.65299832
0.817293204
0.356395578
1.623997924
1.235117096
0.871397882
1.808087394
1.04166183
2.100980227
1.89307762
1.683643327
1.688140524
1.947678833
0.943623137
1.347660665
1.253330475
0.745709776
3.416091304
2.391038881
3.579551538
1.392292068
1.35208514
1.283764835
1.027115859
2.137002941
1.641225746
1.2576259
3.407312593
3.757928587
];

Vol2 = [
32.0643645
33.78584799
33.34632365
33.74814137
36.762532
35.19234564
33.70527211
36.40175366
35.16305063
33.62546985
33.14989003
37.47788259
46.40989196
35.14060064
35.38479069
33.40138263
34.62562207
35.89569038
36.93432585
41.28228215
35.29667482
34.95034846
33.08017164
33.57665832
38.28141804
36.25371278
35.64132828
38.62429988
38.03744465
37.34102102
42.42641056
35.95389472
33.31154433
39.86552937
35.27059879
38.96588022
38.47288446
35.00077489
37.61387735
40.89756208
40.60713717
36.8272448
37.36412205
37.56781951
35.35049005
42.7454941
37.87702806
39.12953388
46.92813652
42.20752981
];

Vol3 = [
52.78805217
55.56016166
55.72689453
54.23252286
52.45535581
51.01892643
53.75641452
52.91328774
51.31474555
51.58868707
54.00975009
50.84480405
44.76168441
49.90597891
51.7737342
52.05500338
51.33250845
53.45545211
49.95044693
47.13470835
48.70274939
51.59603734
50.48627587
51.41496878
46.67561256
50.06363826
50.37124367
48.83924546
50.68913486
46.95260182
45.73832804
47.68625738
50.77098384
48.82058049
49.94028492
47.85144494
50.62905023
49.92407453
50.57824479
47.43871105
46.67060971
48.52869553
46.81461757
46.40679958
50.73850689
43.45517608
47.66804855
46.28529195
41.93261867
47.19904535
];

m = zeros(length(atlasCenterAges),1);
currentWeights = zeros(length(Age),1);

for centerIndex = 1:length(atlasCenterAges)
  for observationIndex = 1:length(Age)
    currentWeights(observationIndex) = ...
      regkernel(Age(observationIndex), ...
      atlasCenterAges(centerIndex), ...
      sig);
  end
  currentWeights = currentWeights / sum(currentWeights(:));
  m(centerIndex) = currentWeights' * Vol2;
end

close all;
f = figure;
scatter(Age,Vol2,'+k','LineWidth',2);
hold on;
plot(atlasCenterAges,m,'b','LineWidth',2);
xlabel('Age');
ylabel('White Matter Volume / Total Brain Volume');
title({'White Matter Volume', 'Kernel Width=6; Sample Size=50'});
ca = gca;
boldifyPlot(f,ca);