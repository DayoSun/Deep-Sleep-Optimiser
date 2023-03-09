function c = loadeil101()
% LOADEIL101 Loads the data file.
% COMMENT : 101-city problem (Christofides/Eilon)
% TYPE : TSP
% DIMENSION : 101
% Source: www.iwr.uni-heidelberg.de/groups/comopt/software/TSPLIB95/tsp
clear all;
temp_x = [1 41 49
    2 35 17
    3 55 45
    4 55 20
    5 15 30
    6 25 30
    7 20 50
    8 10 43
    9 55 60
    10 30 60
    11 20 65
    12 50 35
    13 30 25
    14 15 10
    15 30 5
    16 10 20
    17 5 30
    18 20 40
    19 15 60
    20 45 65
    21 45 20
    22 45 10
    23 55 5
    24 65 35
    25 65 20
    26 45 30
    27 35 40
    28 41 37
    29 64 42
    30 40 60
    31 31 52
    32 35 69
    33 53 52
    34 65 55
    35 63 65
    36 2 60
    37 20 20
    38 5 5
    39 60 12
    40 40 25
    41 42 7
    42 24 12
    43 23 3
    44 11 14
    45 6 38
    46 2 48
    47 8 56
    48 13 52
    49 6 68
    50 47 47
    51 49 58
    52 27 43
    53 37 31
    54 57 29
    55 63 23
    56 53 12
    57 32 12
    58 36 26
    59 21 24
    60 17 34
    61 12 24
    62 24 58
    63 27 69
    64 15 77
    65 62 77
    66 49 73
    67 67 5
    68 56 39
    69 37 47
    70 37 56
    71 57 68
    72 47 16
    73 44 17
    74 46 13
    75 49 11
    76 49 42
    77 53 43
    78 61 52
    79 57 48
    80 56 37
    81 55 54
    82 15 47
    83 14 37
    84 11 31
    85 16 22
    86 4 18
    87 28 18
    88 26 52
    89 26 35
    90 31 67
    91 15 19
    92 22 22
    93 18 24
    94 26 27
    95 25 24
    96 22 27
    97 25 21
    98 19 21
    99 20 26
    100 18 18
    101 35 35];
cities = [temp_x(:,2)';temp_x(:,3)'];
save cities.mat cities -V6;
