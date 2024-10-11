clear all;close all;clc;
data = load("../data/MEG_DK_Atlas/Autism_MEG_all.mat");



fmin = 2; %Hz
fmax = 40;
fs=600;
nfreq = 40;

all = struct;
for iy = 1:78
    
    key = "data_" + iy;
    cur_dat = data.(key);
    key
    pow_data = struct;
    pow_data.mat = zeros(68, nfreq);
for ix = 1:68
    
[q, fsamples] = get_spectral(squeeze(cur_dat(ix, :)), fs,nfreq, fmin, fmax);
pow_data.mat(ix, :) = q;

end
pow_data.freq = fsamples;
all.(key) = pow_data;
end

save_path = "../data/MEG_DK_Atlas/Autism_MEG_all_PSD.mat";
save(save_path, "-struct", "all");